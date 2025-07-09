#include <ros/ros.h>
#include <geometry_msgs/Twist.h>
#include <car_ctr/car_ctr.h>
#include <geometry_msgs/PoseStamped.h>
#include <nav_msgs/Path.h>
using namespace std;
class TDecision
{
private:
    ros::NodeHandle *nh_local;
    float decision_angle = 0;
    float decision_speed = 0;
    float last_decision_speed = 0;
    float last_decision_angle = 0;
    geometry_msgs::PoseStamped shotpoint;
    car_ctr::car_ctr pathtrack_ctr;
    geometry_msgs::Twist follow_ctr;
    nav_msgs::Path shotpath;
    ros::Subscriber pathtrack_ctr_sub, follow_ctr_sub, shotpoint_sub;
    ros::Publisher ctr_pub, shotpath_pub;
public:
    TDecision()
    {
        nh_local = new ros::NodeHandle("~");
        pathtrack_ctr_sub = nh_local->subscribe<car_ctr::car_ctr>("/pathtrack/car_cmd",10,&TDecision::PathTrackCtrCallback,this);
        follow_ctr_sub = nh_local->subscribe<geometry_msgs::Twist>("/multi_car/ctr_cmd",10,&TDecision::FollowCtrCallback,this);
        shotpoint_sub = nh_local->subscribe<geometry_msgs::PoseStamped>("/shotpoint",10,&TDecision::ShotPointCallback,this);
        ctr_pub = nh_local->advertise<car_ctr::car_ctr>("/ctr_cmd", 10);
        shotpath_pub = nh_local->advertise<nav_msgs::Path>("/shotpath",10);
    }
    void PathTrackCtrCallback(const car_ctr::car_ctr::ConstPtr &msg);
    void FollowCtrCallback(const geometry_msgs::Twist::ConstPtr &msg);
    void ShotPointCallback(const geometry_msgs::PoseStamped::ConstPtr &msg);
    void ctr_decision();
};
void TDecision::PathTrackCtrCallback(const car_ctr::car_ctr::ConstPtr &msg )
{
    pathtrack_ctr = *msg;
}
void TDecision::FollowCtrCallback(const geometry_msgs::Twist::ConstPtr &msg)
{
    follow_ctr = *msg;
}
void TDecision::ShotPointCallback(const geometry_msgs::PoseStamped::ConstPtr &msg)
{
    shotpoint = *msg;
    shotpoint.header.frame_id = "map";
    shotpoint.header.stamp = ros::Time::now();
    shotpath.poses.clear();
    shotpath.header.frame_id = "map";
    shotpath.header.stamp = ros::Time::now();
    shotpath.poses.push_back(shotpoint);
    shotpath_pub.publish(shotpath);
}
void TDecision::ctr_decision()
{
    decision_angle = pathtrack_ctr.angle;
    decision_speed = pathtrack_ctr.speed;
    if (follow_ctr.linear.x >= 0.0 )
    {
        if(decision_speed > follow_ctr.linear.x) decision_speed = follow_ctr.linear.x;
        if(follow_ctr.linear.x = 0.0)    decision_angle = last_decision_angle;
    }     
    car_ctr::car_ctr car_ctr;
    car_ctr.angle = decision_angle;
    car_ctr.speed = decision_speed;
    ctr_pub.publish(car_ctr);
    last_decision_speed = decision_speed;
    last_decision_angle = decision_angle;
}

int main(int argc, char **argv)
{
    ros::init(argc, argv, "ctr_desicion");
    TDecision decision;

    ros::Rate rate(20);
    while (ros::ok())
    {
        decision.ctr_decision();
        ros::spinOnce();
        rate.sleep();
    }

    return 0;
}