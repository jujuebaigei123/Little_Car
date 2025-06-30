// #include <ros/ros.h>
// #include <nav_msgs/Path.h>
// #include <geometry_msgs/PointStamped.h>
// #include <geometry_msgs/PoseStamped.h>
// // #include <common/mydisplay.h>
// using namespace std;


// class Follower
// {
// private:
//     ros::NodeHandle nh;
//     ros::Subscriber leader_pose_sub;
//     ros::Publisher path_pub;
//     nav_msgs::Path path_to_track;
//     geometry_msgs::Pose last_pose;
// public:
//     Follower()
//     {
//         leader_pose_sub = nh.subscribe<geometry_msgs::PoseStamped>("leader_pose",10,&Follower::update_path,this);   // 接受位姿点
//         path_pub = nh.advertise<nav_msgs::Path>("follower_path",10);
//     }
//     void update_path(geometry_msgs::PoseStamped pose);
// };

// void Follower::update_path(geometry_msgs::PoseStamped pose)
// {
//     if(pose.pose != last_pose)    //位姿点更新后增量式更新路径
//     {
//         path_to_track.header.frame_id = "map";
//         path_to_track.header.stamp = ros::Time::now();
//         path_to_track.poses.push_back(pose);
//     }
//     path_pub.publish(path_to_track);
//     last_pose = pose.pose;
// }

// int main(int argc, char **argv)
// {
//     ros::init(argc, argv, "follower");
//     Follower follower;

//     ros::Rate rate(20);
//     while (ros::ok())
//     {
//         ros::spinOnce();
//         rate.sleep();
//     }

//     return 0;
// }