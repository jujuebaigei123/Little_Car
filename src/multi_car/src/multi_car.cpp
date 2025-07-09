#include <ros/ros.h>
#include <std_msgs/Float32.h>
#include <std_msgs/Int32.h>
#include <common/public.h>
#include <std_msgs/String.h>
#include <nav_msgs/Path.h>
#include <common/myudp.h>
#include "NavConversion.h"
#include <geometry_msgs/PoseStamped.h>
#include <geometry_msgs/PointStamped.h>
#include <visualization_msgs/Marker.h>
#include <gps/MyGPS_msg.h>
#include <unordered_map>
#include <common/mydisplay.h>
#include "mqtt_commx/path_point.h"
using namespace std;



ros::NodeHandle *nh;
ros::Publisher adj_shotpath_pub, multiCarPath_pub, ctrcmd_pub, target_car_pub, vp_wait_point_pub, adj_vp_point_pub,SP_ready_pub;
mqtt_commx::path_point pose_data;  

ros::Subscriber gps_base_sub,globalpath_sub, shotpath_sub,multicarpath_sub;

nav_msgs::Path shotpath, globalpath, multiCarPath;

geometry_msgs::PoseStamped virb_point;

float vp_adj_dis_max = 15;      // 距炮点停车调整距离
bool carFollowEnable = false;
bool frontCarStop = false;
int target_car_id = 1;

float utmx_zero = 0.0;
float utmy_zero = 0.0;
float keep_dis_frontcar=8;      // 间距保持
float cur_dis_frontcar=0;
int num_cars = 2;       // 车队车辆数
geometry_msgs::Point cur_pos, front_pos, last_front_pos;
geometry_msgs::Twist fellow_cmd, work_cmd;

unordered_map<int, geometry_msgs::Point> car_prev_pos;
TTimer udp_tmr;
IdDis FindNearestPointInPath(geometry_msgs::Point p, nav_msgs::Path pt)
{ 
    int rid = -1;
    float dmin = 9999999;
    IdDis res;
    res.id = rid, res.dis = dmin;
    if(pt.poses.size()==0)  return res;
    
    geometry_msgs::Point p1 = p;  //car_marker.pose.position;
    for(int i=0;i<pt.poses.size();i++)
    {
        geometry_msgs::Point p2 = pt.poses[i].pose.position;
        float dd = GetDistanceXY(p1,p2);
        if(dd <= dmin) rid=i, dmin = dd;
    }
    res.id = rid, res.dis = dmin;
    return res;
}
float GetLengthInPath(nav_msgs::Path path, geometry_msgs::Point p1, geometry_msgs::Point p2)
{
    int id1=FindNearestPointInPath(p1, path).id;
    int id2=FindNearestPointInPath(p2, path).id;
    
    if(id2<id1)  
    {
        int tmp=id1;
        id1=id2;
        id2=tmp;
    }

    float res=0;
    for(int i=id1; i<id2; i++)
    {
        p1=path.poses[i].pose.position;
        p2=path.poses[i+1].pose.position;
        res+=GetDistanceXY(p1,p2);
    }
    return res;
}

void FellowSpdCtr()  //  跟车距离/车速控制
{
    fellow_cmd.linear.x=-1;
    if(globalpath.poses.size()<=0)  return;

    cur_dis_frontcar=GetLengthInPath(globalpath, front_pos, cur_pos);
    // ROS_INFO("%.2f", cur_dis_frontcar);

    float err=cur_dis_frontcar-keep_dis_frontcar, kp=0.3;
    float base_v=1.2, max_v=2;  //  跟车速度设置
    static float cur_v=0;
    cur_v+=err*kp;
    // cur_v=base_v+err*kp;
    if(cur_v>max_v)  cur_v=max_v;
    else if(cur_v<0)  cur_v=0;

    fellow_cmd.linear.x = cur_v;  
    fellow_cmd.angular.z = -999;
}
geometry_msgs::PoseStamped RotateAroundPoint(const geometry_msgs::PoseStamped& A, const geometry_msgs::PoseStamped& B, double angle_rad) {
    geometry_msgs::PoseStamped result;
    double dx = A.pose.position.x - B.pose.position.x;
    double dy = A.pose.position.y - B.pose.position.y;
    result.pose.position.x = dx * cos(angle_rad) - dy * sin(angle_rad) + B.pose.position.x;
    result.pose.position.y = dx * sin(angle_rad) + dy * cos(angle_rad) + B.pose.position.y;
    result.pose.position.z = A.pose.position.z; // 若需保持平面
    return result;
}
void GPSBaseCallback(const gps::MyGPS_msg::ConstPtr &msg)
{
    // ROS_INFO("gps_callback");
    cur_pos.x=msg->map_x;
    cur_pos.y=msg->map_y;
    
    if (!carFollowEnable)
    {
        return;
    }
    // if (globalpath.poses.size() <= 0)
    // {
    //     ROS_WARN("although carFollowEnable, we dont have a global path ...");
    //     return;
    // }

    // bool multiCar_comm_lost=(udp_tmr.GetValue()>3.0);
    // if (multiCar_comm_lost)
    // {
    //     ROS_WARN("multiCar communication lost... ");
    //     return;
    // }
    // 获取前车位置
    if (multiCarPath.poses.size() <= 1)
    {
        ROS_WARN("multiCarPos.poses too short, no target_car_pos available");
        return;
    }

    geometry_msgs::Point target_car_pos= multiCarPath.poses[target_car_id - 1].pose.position;
    // printf("pos_x:%f,pos_y:%f\r\n",target_car_pos.x,target_car_pos.y);
    geometry_msgs::PoseStamped target_point;
    target_point.header.frame_id="map";
    target_point.header.stamp = ros::Time::now();
    target_point.pose.position = target_car_pos;
    target_car_pub.publish(target_point);
    work_cmd.linear.x=-1;
    if (shotpath.poses.size()>0)    //(dist > 1)
    {
        geometry_msgs::Point vp_wait_point;
        int vp_nearestId = -1;
        int target_car_nearestId = -1;
        int ego_car_nearestId = -1;

        virb_point=shotpath.poses[0];
        geometry_msgs::Point p1=virb_point.pose.position;
        geometry_msgs::Point p2=cur_pos;
        float dis_vp=GetDistanceXY(p1, p2); 
        // case 1 前车停车时，计算并发布当前车的最优炮点位置
        nh->getParam("/pad_state",frontCarStop);
        if (frontCarStop)  
        {
            target_car_nearestId = FindNearestPointInPath(target_car_pos, globalpath).id;   // 找到前车停止位置
            vp_nearestId = FindNearestPointInPath(virb_point.pose.position, globalpath).id; // 找到炮点位置
            geometry_msgs::PoseStamped target_car_point = globalpath.poses[target_car_nearestId];
            // printf("%d %d %d\n",target_car_nearestId, vp_nearestId, ego_car_nearestId);
            // 计算目标停车位置
            geometry_msgs::PoseStamped adj_goal_point;
            adj_goal_point = RotateAroundPoint(target_car_point, virb_point, M_PI / num_cars);
            nav_msgs::Path adj_path;
            adj_path.header.frame_id=shotpath.header.frame_id;
            adj_path.header.stamp=ros::Time::now();
            adj_path.poses.push_back(adj_goal_point); 
            adj_shotpath_pub.publish(adj_path);
            // 发布rviz中可视位置
            geometry_msgs::PointStamped p_msg;
            p_msg.header=adj_path.header;
            p_msg.point=adj_goal_point.pose.position; 
            adj_vp_point_pub.publish(p_msg);
            geometry_msgs::PointStamped base_p;  //add 0703 base_link坐标系下的
            if(transformPoint("base_link", p_msg, base_p, ""))  
            {
                if(base_p.point.x<1)  work_cmd.linear.x = 0.0; 
                // printf("%.1f\n", work_cmd.linear.x); 
            }
            // printf("adj: %.2f %.2f\n",globalpath.poses[ego_car_nearestId].pose.position.x, globalpath.poses[ego_car_nearestId].pose.position.y);
        }
        // case2 前车未停车时，计算并发布当前车的停车等待位置，停车等待前车触发停车信号，然后再进行case1
        else if(dis_vp<1.5*vp_adj_dis_max)
        {
            vp_nearestId = FindNearestPointInPath(virb_point.pose.position, globalpath).id;
            //look for vp_wait_point
            int id=vp_nearestId;
            while(id>=0)
            {
                vp_wait_point = globalpath.poses[id].pose.position;
                geometry_msgs::Point  p1=globalpath.poses[vp_nearestId].pose.position;
                geometry_msgs::Point  p2=globalpath.poses[id].pose.position;
                float ds=GetDistanceXY(p1, p2); 
                if (ds>vp_adj_dis_max)  break;
                id--;
            }
            geometry_msgs::PointStamped vp_wait_msg;
            vp_wait_msg.header.frame_id="map";
            vp_wait_msg.header.stamp=ros::Time::now();
            vp_wait_msg.point=vp_wait_point;
            vp_wait_point_pub.publish(vp_wait_msg);
            // printf("%.1f %d %d\n", vp_adj_dis_max, vp_nearestId, id);

            geometry_msgs::PointStamped base_p;
            if(transformPoint("base_link", vp_wait_msg, base_p, ""))  
            {
                if(base_p.point.x<2)  work_cmd.linear.x = 0.0; 
                // printf("%.1f\n", work_cmd.linear.x); 
            }
        }

        static bool last_frontCarStop=false;
        if(last_frontCarStop && !frontCarStop)  //  当前炮点作业完成
        {
            shotpath.poses.clear();
            ROS_INFO("shotpoint clear!");
        }

        last_frontCarStop=frontCarStop;
    }
    FellowSpdCtr();
}

void GlobalPathCallback(const nav_msgs::Path::ConstPtr &msg)
{
    globalpath = *msg;
}

void ShotPathCallback(const nav_msgs::Path::ConstPtr &msg)
{
    shotpath=*msg;
}
void MultiCarPathCallback(const nav_msgs::Path::ConstPtr &msg)
{
    multiCarPath = *msg;
}
int main(int argc, char **argv)
{
    ros::init(argc, argv, "multi_car");
    nh = new ros::NodeHandle("~");   // 局部句柄
        
    adj_shotpath_pub = nh->advertise<nav_msgs::Path>("adj_shotpath", 10);
    multiCarPath_pub = nh->advertise<nav_msgs::Path>("multiCarpath", 10);
    ctrcmd_pub = nh->advertise<geometry_msgs::Twist>("ctr_cmd", 10);
    SP_ready_pub = nh->advertise<geometry_msgs::PointStamped>("shotpoint", 10);
    vp_wait_point_pub = nh->advertise<geometry_msgs::PointStamped>("vp_wait_point", 10);
    target_car_pub = nh->advertise<geometry_msgs::PointStamped>("target_point", 10);
    adj_vp_point_pub = nh->advertise<geometry_msgs::PointStamped>("adj_vp_point", 10);

    shotpath_sub = nh->subscribe<nav_msgs::Path>("/shotpath", 10, ShotPathCallback); // ver--rviz模拟炮点:
    gps_base_sub = nh->subscribe<gps::MyGPS_msg>("/gps_base/GPS_Base", 10, GPSBaseCallback);
    globalpath_sub = nh->subscribe<nav_msgs::Path>("/globalpathplan/path", 10, GlobalPathCallback);
    multicarpath_sub = nh->subscribe<nav_msgs::Path>("/multiCarpath",10,MultiCarPathCallback);
    nh->getParam("/gps_base/utmx_zero", utmx_zero);
    nh->getParam("/gps_base/utmy_zero", utmy_zero);
    // 跟车炮点调整及停车等待
    nh->getParam("vp_adj_dis_max", vp_adj_dis_max);
    nh->getParam("carFollowEnable", carFollowEnable);  
    fellow_cmd.linear.x=work_cmd.linear.x=-1;
    nh->getParam("target_car_id", target_car_id);    
    ros::Rate loop_rate(20);
    while (ros::ok())
    {
        if(work_cmd.linear.x>=0 && work_cmd.linear.x<fellow_cmd.linear.x)  
            ctrcmd_pub.publish(work_cmd);
        else  
            ctrcmd_pub.publish(fellow_cmd);
        if (shotpath.poses.size())
        {
            geometry_msgs::PointStamped p;
            p.header.frame_id = shotpath.header.frame_id;
            p.header.stamp = ros::Time::now();
            p.point = shotpath.poses[0].pose.position;
            SP_ready_pub.publish(p);
        }
        ros::spinOnce();
        loop_rate.sleep();
    }

    return 0;
}