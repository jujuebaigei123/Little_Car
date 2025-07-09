#include <ros/ros.h>
#include <std_msgs/String.h>
#include <nav_msgs/Path.h>
#include <std_msgs/Float32.h>
#include <std_msgs/Float64.h>
#include <std_msgs/Float32MultiArray.h>
#include <std_msgs/Int32.h>
#include <common/public.h>
#include <car_ctr/car_ctr.h>
#include <car_ctr/car_state.h>
#include <common/mydisplay.h>
#include <geometry_msgs/Twist.h>
#include <gps/MyGPS_msg.h>
using namespace std;

class TPathTrack
{
private:
    ros::NodeHandle *nh_local, *nh;
    ros::Publisher aimpoint_pub, carctr_pub, trackangleerr_pub, movedir_pub; 
    ros::Subscriber localpath_sub, carstate_sub, speedlimit_sub, selfturnctr_sub, charge_station_sub;
    ros::Subscriber avg_remaintime_sub, avg_taskprogress_sub, remainpath_sub, passedpath_sub, gpsbase_sub;
    nav_msgs::Path localpath;
    car_ctr::car_state cur_carstate;

    TNodeCheck *nodecheck;
    
    float angle_offset = 0;
    bool test_flag = false;
    float test_speed = 0;
    float speedlimit=999;

    geometry_msgs::PointStamped aimpoint;
    float aim_range = 2, ref_speed = 0.6; 
    float steering_property = 1;
    float track_angle_err = 0;
    int selfturnctr=0;
    float avg_remaintime, avg_taskprogress,leader_taskprogress;
    float remainpath, passedpath, cur_vel;
    car_ctr::car_ctr car_ctr;
    string move_dir="back", stop_str="";
    bool my_sync=false;
    float kp,ki,kd;
public:
    TPathTrack()
    {
        nh_local = new ros::NodeHandle("~");
        nh = new ros::NodeHandle();

        aimpoint_pub = nh_local->advertise<geometry_msgs::PointStamped>("aimpoint", 10); // 发布预瞄点
        carctr_pub = nh_local->advertise<car_ctr::car_ctr>("car_cmd", 10); // 发布控制信息

        trackangleerr_pub = nh_local->advertise<std_msgs::Float32>("track_angle_err", 10); 
        movedir_pub = nh_local->advertise<std_msgs::String>("move_dir", 10);

        localpath_sub = nh->subscribe<nav_msgs::Path>("/localpathplan/localpath", 10, &TPathTrack::LocalPathCallback, this);
        carstate_sub = nh->subscribe<car_ctr::car_state>("/car_state", 10, &TPathTrack::CarStateCallback, this);
        speedlimit_sub = nh->subscribe<std_msgs::Float32>("/speed_limit", 10, &TPathTrack::SpeedLimitCallback, this);
        selfturnctr_sub = nh->subscribe<std_msgs::Int32>("/selfturnctr/self_turn_ctr", 10, &TPathTrack::SelfTurnCtrCallback, this);

        avg_remaintime_sub = nh->subscribe<std_msgs::Float64>("/avg_remaintime", 10, &TPathTrack::AvgRemainTimeCallback,this);
        avg_taskprogress_sub = nh->subscribe<std_msgs::Float64>("/avg_taskprogress", 10, &TPathTrack::AvgTaskProgressCallback,this); 
        remainpath_sub = nh->subscribe<std_msgs::Float64>("/local_path_plan/remainpath", 10, &TPathTrack::RemainPathCallback,this);
        passedpath_sub = nh->subscribe<std_msgs::Float64>("/local_path_plan/passedpath", 10, &TPathTrack::PassedPathCallback,this);
        gpsbase_sub = nh->subscribe<gps::MyGPS_msg>("/gps_base/GPS_Base", 10, &TPathTrack::GPSDataCallback,this);
        
        nh->getParam("/pathtrack/sync",my_sync);

        // printf("sync%d\n",my_sync);
        aimpoint.header.frame_id = "";

        nodecheck = new TNodeCheck(nh_local, "node_rate track_rate");
        nodecheck->Find("node_rate")->SetLimit(10);

        nh_local->getParam("angle_offset", angle_offset);
        nh_local->getParam("test_speed", test_speed);
    };

    void LocalPathCallback(const nav_msgs::Path::ConstPtr &msg);
    void CarStateCallback(const car_ctr::car_state::ConstPtr &msg);
    void SpeedLimitCallback(const std_msgs::Float32::ConstPtr &msg); 
    void SelfTurnCtrCallback(const std_msgs::Int32::ConstPtr &msg); 

    void AvgRemainTimeCallback(const std_msgs::Float64::ConstPtr &msg);
    void AvgTaskProgressCallback(const std_msgs::Float64::ConstPtr &msg);
    void RemainPathCallback(const std_msgs::Float64::ConstPtr &msg); 
    void PassedPathCallback(const std_msgs::Float64::ConstPtr &msg); 
    void GPSDataCallback(const gps::MyGPS_msg::ConstPtr &msg); 
    void Run();
    void UpdateCtrParam(float vel);
    float GetAimAngleErr(geometry_msgs::PointStamped aimp, string move_dir);
    void PubCarCtr(car_ctr::car_ctr ctr);
    void TimeSync(car_ctr::car_ctr &ctr);
    void TaskPregressSync(car_ctr::car_ctr &ctr);
    void Taskprogressleader(car_ctr::car_ctr &ctr);
    void PurePursuit(car_ctr::car_ctr &car_ctr);

    float CheckTrackErr()
    {
        float res=0;
        if(localpath.poses.size()>0)  res=GetDistance(*localpath.poses.begin());
        return res;
    }
};

void TPathTrack::TimeSync(car_ctr::car_ctr &ctr)
{
    // 时间协同控制
    float my_remaintime=0;
    if(cur_vel>0.1)  my_remaintime=remainpath/cur_vel;
    if(my_remaintime>0.1 && avg_remaintime>0.1)
    {
      float dt=my_remaintime-avg_remaintime, k=0.1;
      float adj_value=dt*k;

      printf("my_remaintime=%.2f, avg_remaintime=%.2f", my_remaintime, avg_remaintime);
      printf("raw_sp=%.2f, dv=%.2f, new_sp=%.2f\n", ctr.speed, adj_value, ctr.speed+adj_value);
      if(adj_value > 0.05) adj_value = 0.05;
      else if (adj_value < -0.05) adj_value = -0.05;
      ctr.speed+=adj_value;
    }

}
void TPathTrack::TaskPregressSync(car_ctr::car_ctr &ctr)
{
    // 任务进度协同
    float my_taskprogress = 0;
    nh_local->getParam("kp",kp);
    nh_local->getParam("ki",ki);
    nh_local->getParam("kd",kd);
    // printf("p:%.2f,i:%.2f,d:%.2f",kp,ki,kd);
    // printf("speed:%.2f\n",ctr.speed);
    if(passedpath>0.1 || remainpath>0.1)
    {
        my_taskprogress = passedpath/(passedpath + remainpath);

        float dp = avg_taskprogress - my_taskprogress;
        float adj_value = dp*kp;

        
        if(my_taskprogress < 0.95 && adj_value < 1)
        {
            printf("my_taskprogress=%.2f, avg_taskprogress=%.2f", my_taskprogress, avg_taskprogress);
            if(ctr.speed < 0) 
            {
                printf("raw_sp=%.2f, dv=%.2f, new_sp=%.2f\n", ctr.speed, adj_value, ctr.speed-adj_value);
                if(ctr.speed>0) ctr.speed = 0;
                
            }
            else 
            {
                printf("raw_sp=%.2f, dv=%.2f, new_sp=%.2f\n", ctr.speed, adj_value, ctr.speed+adj_value);
                ctr.speed += adj_value;
                if(ctr.speed<0) ctr.speed = 0;
                
            }
        }
        
        
    } 
}

void TPathTrack::PubCarCtr(car_ctr::car_ctr ctr)
{
    static car_ctr::car_ctr last_ctr;
    float dvel = ctr.speed - last_ctr.speed;
    float max_dvel = 0.05;
    if (dvel > max_dvel)
        ctr.speed = last_ctr.speed + max_dvel;
    else if (dvel < -max_dvel)
        ctr.speed = last_ctr.speed - max_dvel;
    last_ctr = ctr;
    // printf("sync1111:%d\n",my_sync);
    string next_path;
    nh->getParam("/next_path",next_path);
    // printf("next_path:%s\n",next_path.c_str());
    if(my_sync && next_path != "x1-go-3")
    {
        //TimeSync(ctr);     // 时间协同
        TaskPregressSync(ctr);     // 任务进度协同
    }
    
    if(move_dir=="front")  ctr.angle += angle_offset;
    else if(move_dir=="back")   ctr.angle -= angle_offset;
    ctr.enable=true;
    if (speedlimit<0.01) ctr.angle = 0;
    // printf("speed:%.2f\n",ctr.speed);
    carctr_pub.publish(ctr);

    // printf("speed=%.2f angle=%.2f  track_angle_err=%.2f  \n", ctr.speed, ctr.angle, track_angle_err);
}

void TPathTrack::LocalPathCallback(const nav_msgs::Path::ConstPtr &msg) // 接收局部路径 获取预瞄点
{
    localpath = *msg;
    // ROS_INFO("%d\n", localpath.poses.size());

    aimpoint.point.x = aimpoint.point.y = 0;    
    aimpoint.header = msg->header;
    aimpoint.header.stamp = ros::Time();
    if (localpath.poses.size() > 1)
    {
        aimpoint.point = (localpath.poses.end() - 1)->pose.position;
    }
    else
    {
        aimpoint.header.frame_id = "";
        localpath.poses.clear();
        return;
    }

    float dd = 0;
    for (auto it = localpath.poses.begin(); it != localpath.poses.end() - 2; ++it) // 寻找预瞄点
    {
        float ds = GetDistanceXY(it->pose.position, (it + 1)->pose.position);
        dd += ds;
        if (dd >= aim_range)
        {
            aimpoint.point = it->pose.position; // float wheel_err_front_external = 999, wheel_err_rear_external = 999;
            break;
        }
    }

    if (dd < aim_range)
    {
        float L1 = aim_range - dd + 0.05; //  最后引导距离
        geometry_msgs::PoseStamped p1 = *(localpath.poses.end() - 1);
        geometry_msgs::PoseStamped p2 = *(localpath.poses.end() - 2);
        p1.pose.orientation = GetQuaternionMsgByPoints(p2.pose.position, p1.pose.position);
        geometry_msgs::PoseStamped p = GetExtendPoseByPose(p1, L1);
        aimpoint.point = p.pose.position;
    }

    ref_speed = localpath.poses[0].pose.position.z; //  速度为首点Z数据
    ref_speed = min(ref_speed, speedlimit);

    // printf("vel0=%.2f\n", localpath.poses[0].pose.positio    
    // printf("vel1=%.2f\n", localpath.poses[1].pose.position.z);
}

void TPathTrack::CarStateCallback(const car_ctr::car_state::ConstPtr &msg) //  接收车体状态信息
{
    cur_carstate = *msg;
    // ROS_INFO("%d", cur_carstate.turnmode);
}

void TPathTrack::SpeedLimitCallback(const std_msgs::Float32::ConstPtr &msg) 
{
    speedlimit = msg->data;
}

void TPathTrack::SelfTurnCtrCallback(const std_msgs::Int32::ConstPtr &msg)
{
    selfturnctr = msg->data;
}

void TPathTrack::AvgRemainTimeCallback(const std_msgs::Float64::ConstPtr &msg)
{
    avg_remaintime=msg->data;
}
void TPathTrack::AvgTaskProgressCallback(const std_msgs::Float64::ConstPtr &msg)
{
    avg_taskprogress=msg->data;
}  
void TPathTrack::RemainPathCallback(const std_msgs::Float64::ConstPtr &msg)
{
    remainpath=msg->data;
}
void TPathTrack::PassedPathCallback(const std_msgs::Float64::ConstPtr &msg)
{
    passedpath=msg->data;
}
void TPathTrack::GPSDataCallback(const gps::MyGPS_msg::ConstPtr &msg)
{
    cur_vel=msg->Vel;
}
void TPathTrack::UpdateCtrParam(float vel) //  根据速度规划预瞄点和转向控制系数
{
    vel = fabs(vel);
    if (vel > 5 )  // speedlimit < 1)
        aim_range = 20, steering_property = 0.6;
    else if (vel > 4.7)
        aim_range = 15, steering_property = 0.7;
    else if (vel > 3.6)
        aim_range = 15, steering_property = 0.8;
    else if (vel > 2.8)
        aim_range = 15, steering_property = 1.0;
    else if (vel > 1.5)
        aim_range = 10, steering_property = 1.3;
   
   else if (vel > 0.7)
        aim_range = 2.5, steering_property = 1.0;   
   else if (vel > 0.6)
        aim_range = 2, steering_property = 1.2;
    else if (vel > 0.5)
        aim_range = 2, steering_property = 1.5;        
    else if (fabs(vel) > 0.4)
        aim_range = 1.5, steering_property = 2;       
    else if (fabs(vel) > 0.2)
        aim_range = 1.0, steering_property = 2.5;   
    else 
        aim_range = 1, steering_property = 3;
        // aim_range = 0.5, steering_property = 2;

    aim_range = 1.2, steering_property = 1.5;    
    
    if (cur_carstate.turnmode == 4)  aim_range=3;

    // printf("range=%.2f\n",aim_range);

    //  预瞄距离滤波
    static TDataFilter f_aimrange(10);
    aim_range=f_aimrange.GetValue(aim_range);
}   

float TPathTrack::GetAimAngleErr(geometry_msgs::PointStamped aimp, string move_dir) //  根据横移状态和运动速度判断跟踪角度误差
{
    float err=0;
    if(aimp.header.frame_id=="" || move_dir=="")  return err;
    // printf("aim_frame:%s\n",aimp.header.frame_id.c_str());
    geometry_msgs::PointStamped dst_p;
    transformPoint("base_link", aimp, dst_p, "");
    // printf("dst_p_X:%.2f,dst_p_y:%.2f\n",dst_p.point.x,dst_p.point.y);
    if(move_dir=="front")  err = atan2(dst_p.point.y, dst_p.point.x);//-angle_offset*M_PI/180;
    else if(move_dir=="back")  err = atan2(dst_p.point.y, -dst_p.point.x);//+angle_offset*M_PI/180;
    else if(move_dir=="left")  err = -atan2(dst_p.point.x, dst_p.point.y);
    else if(move_dir=="right")  err = -atan2(dst_p.point.x, -dst_p.point.y);
    
    err*=180/M_PI;

    // ROS_INFO("dst_p.point.x=%.2f ",dst_p.point.x);
    // ROS_INFO("dst_p.point.y= %.2f",dst_p.point.y );
    // ROS_INFO("err=%.2f\n",err );

    return err;
}

// 纯轨迹跟踪控制
void TPathTrack::PurePursuit(car_ctr::car_ctr &car_ctr)
{
    if(move_dir == "left" || move_dir == "right") car_ctr.turnmode = 2; 
    // car_ctr.turnmode = cur_carstate.turnmode;
    car_ctr.speed = ref_speed;
    // steering_property=0.02;
    if(move_dir=="back")  car_ctr.speed*=-1,  steering_property*=1;
    else if(move_dir == "left") car_ctr.speed*=-1;
    // printf("move dir :%s",move_dir);
    car_ctr.angle = steering_property*track_angle_err;
    // printf("car_ctr=%.2f\n  track_angle_err=%.2f  ",car_ctr.angle, track_angle_err);
    
    if(localpath.poses.size()==0)  
        car_ctr.speed=car_ctr.angle=0;
}

void TPathTrack::Run() //  主运行函数
{
    
    nodecheck->Find("node_rate")->Beat();
    if(CheckTrackErr()<0.5)  nodecheck->Find("track_rate")->Beat();
    
    move_dir=CheckMoveDir(localpath, 0);
    std_msgs::String str_msg;
    str_msg.data=move_dir;
    movedir_pub.publish(str_msg);
    // ROS_INFO("move_dir=%s",move_dir.c_str());  
     
    track_angle_err=GetAimAngleErr(aimpoint, move_dir);
    std_msgs::Float32 float_msg;
    float_msg.data=track_angle_err;
    trackangleerr_pub.publish(float_msg);
    
    if (!test_flag)   //  正常模式
    {
        UpdateCtrParam(ref_speed);
        
        if (localpath.poses.size())  aimpoint_pub.publish(aimpoint);
 
        PurePursuit(car_ctr);      // 纯跟踪控制
    }
    else  // 开环测试模式
    {
        car_ctr.turnmode = 0;
        car_ctr.angle = 0;
        car_ctr.speed = test_speed;
    }

    bool run_enable=true;
    nh_local->getParam("run_enable",run_enable);
    if(!run_enable)
    {
        car_ctr.turnmode = 0;
        car_ctr.angle = car_ctr.speed = 0;
    }

    if(selfturnctr==0)  
    {   
        if (localpath.poses.size()<2)
        {
            car_ctr.angle = car_ctr.speed = 0;
            car_ctr.turnmode = 0;
        }

        PubCarCtr(car_ctr);
    }
}

int main(int argc, char **argv)
{
    ros::init(argc, argv, "pathtrack");
    TPathTrack pathtrack;

    ros::Rate rate(20);
    while (ros::ok())
    {
        pathtrack.Run();
        ros::spinOnce();
        rate.sleep();
    }

    return 0;
}
