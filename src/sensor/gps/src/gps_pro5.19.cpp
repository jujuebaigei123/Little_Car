#include <serial/serial.h>
#include <NavConversion.h>
#include <common/public.h>
#include <gps/MyGPS_msg.h>
#include <std_msgs/String.h>
#include <nav_msgs/Path.h>
#include <nav_msgs/Odometry.h>
#include <tf/tf.h>
#include <tf/transform_broadcaster.h>
#include <visualization_msgs/Marker.h>
// #include <tf_conversions/tf_eigen.h>
#include <geometry_msgs/Point.h>
#include <fstream>
// User defined includes
#include <common/mydisplay.h>
#include<math.h>

#include <common/public.h>

using namespace std;

class TGPS_Pro : public Thread
{
private:
    ros::NodeHandle *nh, *nh_local;
    ros::Publisher path_cur_pub, path_load_pub, path_save_pub, globalpath_pub;
    ros::Publisher marker_pub;
    ros::Subscriber gps_base_sub, matching_loc_sub, turntable_sub;

    vector<geometry_msgs::Point> PathSaveBuf, PathLoadBuf;
    bool saveflag;
    bool matching_loc_enable;
    float turntable_pitch_angle=0, turntable_azimuth_angle=0;
    float yaw = 0;


public:
    TNodeCheck *nodecheck;

    TGPS_Pro();
    void matchingLocCallback(const nav_msgs::Odometry::ConstPtr &msg);
    void GPSDataCallback(const gps::MyGPS_msg::ConstPtr &msg);
    void TurntableCallback(const std_msgs::String::ConstPtr &msg);
    void run();
    void SavePath(char *filename);
    void LoadPath(char *filename);
    void PubPosition(geometry_msgs::PoseStamped pose, int quality);
    void PubPositionX(geometry_msgs::PoseStamped pose,int quality);

};

TGPS_Pro::TGPS_Pro()
{
    nh = new ros::NodeHandle;
    nh_local = new ros::NodeHandle("~");

    nodecheck = new TNodeCheck(nh_local, "node_rate");
    nodecheck->Find("node_rate")->SetLimit(10);

    // path_cur_pub = nh->advertise<nav_msgs::Path>("GPS_Path",10);
    path_load_pub = nh->advertise<nav_msgs::Path>("Path_Load", 10);
    path_save_pub = nh->advertise<nav_msgs::Path>("Path_Save", 10);

    gps_base_sub = nh->subscribe<gps::MyGPS_msg>("/gps_base/GPS_Base", 10, &TGPS_Pro::GPSDataCallback, this);
    matching_loc_sub = nh->subscribe<nav_msgs::Odometry>("/laser_localization", 10, &TGPS_Pro::matchingLocCallback, this);
    turntable_sub = nh->subscribe<std_msgs::String>("/turntable/table_state", 10, &TGPS_Pro::TurntableCallback, this);
   
    // gps_base_sub = nh->subscribe<std_msgs::String>("/gps_base/GPS_RawData", 1, &TGPS_Pro::GPSDataCallback,this);

    marker_pub = nh->advertise<visualization_msgs::Marker>("car_marker", 1);
    saveflag = false;
    matching_loc_enable = false;
    start();
}

void TGPS_Pro::PubPosition(geometry_msgs::PoseStamped pose, int quality)
{
    geometry_msgs::PoseStamped pose_stamped;
    pose_stamped.header.stamp = ros::Time::now();
    pose_stamped.header.frame_id = "base_link"; 
    pose_stamped.pose.orientation.w = 1;
    // pose_stamped.pose.position.z = msg->Vel; //速度信息
    marker_pub.publish(displayCarPosition(pose_stamped, quality));

    geometry_msgs::Quaternion quat = pose.pose.orientation;
    static tf::TransformBroadcaster br1;
    tf::Transform transform;
    tf::Quaternion quaternion;
    transform.setOrigin(tf::Vector3(pose.pose.position.x, pose.pose.position.y, 0)); // base_link在map中的位置
    tf::quaternionMsgToTF(quat, quaternion);
    transform.setRotation(quaternion);  // base_link在map中的旋转四元数
    br1.sendTransform(tf::StampedTransform(transform, ros::Time::now(), "map", pose.header.frame_id)); 

    if (saveflag && PathSaveBuf.size() < 100000)
    {
        geometry_msgs::Point p1, p2;
        if (PathSaveBuf.size() > 0)
            p1 = PathSaveBuf[PathSaveBuf.size() - 1];
        else
            p1.x = p1.y = p1.z = 0;

        p2=pose.pose.position;
        if (P2P(p1, p2) > 1)
        {
            PathSaveBuf.push_back(p2);

            nav_msgs::Path path_msg;
            path_msg.header.stamp = ros::Time::now();
            path_msg.header.frame_id = "map";
            for (int i = 0; i < PathSaveBuf.size(); i++)
            {
                geometry_msgs::PoseStamped pose_stamped;
                pose_stamped.pose.position.x = PathSaveBuf[i].x;
                pose_stamped.pose.position.y = PathSaveBuf[i].y;

                pose_stamped.header.stamp = ros::Time::now();
                pose_stamped.header.frame_id = "map";
                path_msg.poses.push_back(pose_stamped);
            }
            path_save_pub.publish(path_msg);
        }
    }
}

void TGPS_Pro::PubPositionX(geometry_msgs::PoseStamped pose, int quality)
{
    static geometry_msgs::Point p0;
    // static geometry_msgs::Quaternion quat;
    static tf2::Quaternion quat_tf(0, 0, 0, 1);  // 初始化为单位四元数
    static bool is_first_run = true;
    
    geometry_msgs::Point p1 = pose.pose.position;
    
    // 发布标记
    geometry_msgs::PoseStamped pose_stamped;
    pose_stamped.header.stamp = ros::Time::now();
    pose_stamped.header.frame_id = "base_link_x"; 
    pose_stamped.pose.orientation.w = 1;
    marker_pub.publish(displayCarPosition(pose_stamped, quality));

    if (is_first_run)
    {
        p0 = p1;
        is_first_run = false;
    }
    else if(P2P(p1,p0) > 0.2)  // 移动超过0.5米才更新
    {
        // 修正yaw计算
        yaw = atan2(p1.y - p0.y, p1.x - p0.x);  // 注意这里是p0.x
        quat_tf.setRPY(0, 0, yaw);  // 直接设置tf四元数
        // quat= tf::createQuaternionMsgFromYaw(yaw);
        p0 = p1;
    }

    // 发布TF变换
    static tf::TransformBroadcaster brl;
    tf::Transform transform;
    transform.setOrigin(tf::Vector3(p1.x, p1.y, 0));
    
    // 使用tf2四元数转换（避免NaN）
    tf::Quaternion quaternion;
    quaternion.setX(quat_tf.x());
    quaternion.setY(quat_tf.y());
    quaternion.setZ(quat_tf.z());
    quaternion.setW(quat_tf.w());
    // tf::quaternionMsgToTF(quat,quaternion);
    transform.setRotation(quaternion);
    brl.sendTransform(tf::StampedTransform(transform, ros::Time::now(), "map", "base_link_x"));  // 修正帧名称
    if (saveflag && PathSaveBuf.size() < 100000)
    {
        geometry_msgs::Point p2, p3;
        if (PathSaveBuf.size() > 0)
            p2 = PathSaveBuf[PathSaveBuf.size() - 1];
        else
            p2.x = p2.y = p2.z = 0;

        p3=pose.pose.position;
        if (P2P(p2, p3) > 1)
        {
            PathSaveBuf.push_back(p3);

            nav_msgs::Path path_msg;
            path_msg.header.stamp = ros::Time::now();
            path_msg.header.frame_id = "map";
            for (int i = 0; i < PathSaveBuf.size(); i++)
            {
                geometry_msgs::PoseStamped pose_stamped;
                pose_stamped.pose.position.x = PathSaveBuf[i].x;
                pose_stamped.pose.position.y = PathSaveBuf[i].y;

                pose_stamped.header.stamp = ros::Time::now();
                pose_stamped.header.frame_id = "map";
                path_msg.poses.push_back(pose_stamped);
            }
            path_save_pub.publish(path_msg);
        }
    }
}

void TGPS_Pro::TurntableCallback(const std_msgs::String::ConstPtr &msg)
{
    vector<string> ss = split(msg->data, ";");
    for (int i = 0; i < ss.size(); i++)
    {
        vector<string> subs = split(ss[i], " ");
        if (subs[0] == "pitch")
        {
            turntable_pitch_angle = atof(subs[2].c_str());
            // reached_flag = atoi(subs[3].c_str());
        }
        else if (subs[0] == "azimuth")
        {
            turntable_azimuth_angle = atof(subs[2].c_str());
            // reached_flag = atoi(subs[3].c_str());
        }
    }

    // ROS_INFO("%.2f %.2f", act_pitch_angle, act_azimuth_angle);
}

void TGPS_Pro::matchingLocCallback(const nav_msgs::Odometry::ConstPtr &msg)
{
    nh->getParam("matching_loc_enable", matching_loc_enable);
    if(!matching_loc_enable) return;

    nodecheck->Find("node_rate")->Beat();
    static geometry_msgs::PoseStamped pose;
    pose.header.frame_id="base_link";
    if(fabs(turntable_azimuth_angle)+fabs(turntable_pitch_angle)<0.2)   //  转台停在零位才能更新位置
        pose.pose=msg->pose.pose;
    PubPosition(pose, -1);
}


void TGPS_Pro::GPSDataCallback(const gps::MyGPS_msg::ConstPtr &msg)
{   
    nh->getParam("matching_loc_enable", matching_loc_enable);
    if(matching_loc_enable) return;
    if(msg->Quality==4)  nodecheck->Find("node_rate")->Beat();

    geometry_msgs::PoseStamped pose;
    pose.pose.position.x=msg->map_x;
    pose.pose.position.y=msg->map_y;
    PubPositionX(pose, msg->Quality);
    pose.pose.orientation=tf::createQuaternionMsgFromYaw(yaw);
    //pose.pose.orientation=tf::createQuaternionMsgFromYaw(msg->Angle/180*M_PI);
   pose.header.frame_id = "base_link_x";
    PubPositionX(pose,msg->Quality);
    // ROS_INFO("vel=%.2f", msg->Vel);
}

void TGPS_Pro::SavePath(char*filename)
{
    if (PathSaveBuf.size() == 0)  return;

    FILE *fp = fopen(filename, "w");

    double utmx_zero, utmy_zero;
    ros::param::get("/gps_base/utmx_zero", utmx_zero);
    ros::param::get("/gps_base/utmy_zero", utmy_zero);

    for (int i = 0; i < PathSaveBuf.size(); i++)
    {
        fprintf(fp, "%.2f %.2f\n", PathSaveBuf[i].x + utmx_zero, PathSaveBuf[i].y + utmy_zero);
    }
    fclose(fp);
    // ROS_INFO("I heard: [%d]", record_track_points.size());
}

void TGPS_Pro::LoadPath(char *filename)
{
    PathLoadBuf.clear();
    if (strcmp(filename, "clear") != 0)
    {
        double utmx_zero = 0, utmy_zero = 0;
        ros::param::get("/gps_base/utmx_zero", utmx_zero);
        ros::param::get("/gps_base/utmy_zero", utmy_zero);

        std::ifstream file_oxts(filename);
        std::string line = "";
        while (getline(file_oxts, line))
        {
            vector<string> ss = split(line, " ");
            geometry_msgs::Point p;
            p.x = atof(ss[0].data());
            p.y = atof(ss[1].data());

            if (fabs(utmx_zero) + fabs(utmy_zero) < 0.001)
                utmx_zero = p.x, utmy_zero = p.y;
            p.x -= utmx_zero, p.y -= utmy_zero;
            PathLoadBuf.push_back(p);
            // printf("%.2f %.2f\n",p.x,p.y);
        }
        printf("there are %d trajectory points.\n", PathLoadBuf.size());
    }
}

void TGPS_Pro::run()
{
    while (1)
    {
        usleep(10000);

    	// if(nodecheck->Find("node_rate")->value<3)  ROS_ERROR_STREAM_THROTTLE(1, "GPS signal error!");

        bool flag = false;
        nh_local->getParam("saveflag", flag);
        if (!saveflag && flag)
        {
            printf("begin save path!\n");
            saveflag = flag;
            PathSaveBuf.clear();
        }
        else if (saveflag && !flag)
        {
            printf("stop save path!\n");
            saveflag = flag;
        }
        else
        {
            string fname = "";
            nh_local->getParam("savefilename", fname);
            nh_local->setParam("savefilename", "");
            if (fname != "")
            {
                printf("stop save path %s!\n", fname.c_str());
                char buf[200];
                strcpy(buf, fname.c_str());
                SavePath(buf);
            }
        }

        string pathfilename = "";
        nh_local->getParam("loadfilename", pathfilename);

        if (pathfilename != "")
        {
            printf("load path %s\n", pathfilename.c_str());
            char buf[200];
            strcpy(buf, pathfilename.c_str());
            LoadPath(buf);
            nh_local->setParam("loadfilename", "");
        }

        ros::spinOnce();
    }
}

int main(int argc, char *argv[])
{
    ros::init(argc, argv, "GPS_Pro");
    ROS_INFO_STREAM("gps pro start");

    TGPS_Pro gps;
    ros::Rate loop_rate(50);
    while (ros::ok())
    {
        ros::spinOnce();
        loop_rate.sleep();
    }
    return 0;
}
