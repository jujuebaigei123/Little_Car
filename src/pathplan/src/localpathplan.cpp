#include <ros/ros.h>
#include <fstream>
#include <std_msgs/String.h>
#include <std_msgs/Int32.h>
#include <nav_msgs/Path.h>
#include <visualization_msgs/Marker.h>
#include <visualization_msgs/MarkerArray.h>
#include <geometry_msgs/PoseStamped.h>
#include <common/public.h>
#include <tf/transform_broadcaster.h>
#include <tf/transform_listener.h>
#include <common/mydisplay.h>
#include <geometry_msgs/PolygonStamped.h>
#include "BezierPlan.h"

using namespace std;


class TLocalPathPlan
{
private:
    ros::NodeHandle *nh_local, *nh;
    ros::Publisher path_pub, workrange_pub, stoprange_pub, offsetpath_pub;
    ros::Subscriber gps_sub, shotpath_sub, adjshotpath_sub, frontpath_sub, shotdone_sub, globalpath_sub, offsetpath_reset_sub;

    geometry_msgs::PointStamped carpoint, shotpoint_ready;
    nav_msgs::Path globalpath, frontpath, offsetpath, topointpath;
    float work_range_x=20, work_range_y=2,  detect_area_angle=100, shotpoint_topath_dist = 0;
    int localpath_flag = 0, localpath_clear_flag = 1, shotpoint_topath_id = 999999;

    geometry_msgs::PolygonStamped getWorkRange();
    geometry_msgs::PolygonStamped getStopRange();

    TNodeCheck *nodecheck;
    TTimer adj_shotpath_tmr;

public : 
    TLocalPathPlan()
    {
        nh_local=new ros::NodeHandle("~");
        nh= new ros::NodeHandle();
        path_pub = nh_local->advertise<nav_msgs::Path>("localpath", 10);
        offsetpath_pub = nh_local->advertise<nav_msgs::Path>("offsetpath", 10);
        workrange_pub = nh_local->advertise<geometry_msgs::PolygonStamped>("work_range", 10);
        stoprange_pub = nh_local->advertise<geometry_msgs::PolygonStamped>("stop_range", 10);


        gps_sub = nh->subscribe<visualization_msgs::Marker>("/car_marker", 10, &TLocalPathPlan::GPSDataCallback, this);
        frontpath_sub = nh->subscribe<nav_msgs::Path>("/globalpathplan/frontpath", 10, &TLocalPathPlan::FrontPathCallback, this);
        shotpath_sub = nh->subscribe<nav_msgs::Path>("/shotpath", 10, &TLocalPathPlan::ShotPathCallback, this); // ver--rviz模拟炮点:
        adjshotpath_sub = nh->subscribe<nav_msgs::Path>("/multi_car/adjshotpath", 10, &TLocalPathPlan::AdjShotPathCallback, this); // ver--rviz模拟炮点:
        
        shotdone_sub = nh->subscribe<geometry_msgs::PointStamped>("/work/shotdone", 10, &TLocalPathPlan::ShotDoneCallback, this);
        globalpath_sub = nh->subscribe<nav_msgs::Path>("/globalpathplan/path", 10, &TLocalPathPlan::GlobalPathCallback, this);
        offsetpath_reset_sub = nh->subscribe<std_msgs::Int32>("ui/offsetpath_reset", 10, &TLocalPathPlan::OffsetpathResetCallback, this);
        
        shotpoint_ready.header.frame_id = "WorkDone";

        nodecheck=new TNodeCheck(nh_local, "node_rate gps_rate frontpath_rate", 1);
        nodecheck->Find("node_rate")->SetLimit(10);
        nodecheck->Find("gps_rate")->SetLimit(10);
        nodecheck->Find("frontpath_rate")->SetLimit(10);
        
    };

    void GPSDataCallback(const visualization_msgs::Marker::ConstPtr &msg);
    void FrontPathCallback(const nav_msgs::Path::ConstPtr &msg);
    void GlobalPathCallback(const nav_msgs::Path::ConstPtr &msg);
    void ShotPathCallback(const nav_msgs::Path::ConstPtr &msg);
    void AdjShotPathCallback(const nav_msgs::Path::ConstPtr &msg);
    void ShotDoneCallback(const geometry_msgs::PointStamped::ConstPtr &msg);
    void OffsetpathResetCallback(const std_msgs::Int32::ConstPtr &msg);

    void PubBezierPath(nav_msgs::Path p, geometry_msgs::Point s);
    nav_msgs::Path GetPathByX(nav_msgs::Path src_path, float min_x, float max_x);
    nav_msgs::Path GetPathByDis(nav_msgs::Path src_path, float min_x, float max_x, int d);
    void GetPathMaxMinX(nav_msgs::Path src_path, float* max_x, float* min_x);
    IdDis FindNearestPointInPath(geometry_msgs::Point p, nav_msgs::Path pt);


    void Run();
};

IdDis TLocalPathPlan::FindNearestPointInPath(geometry_msgs::Point p, nav_msgs::Path pt)
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


void TLocalPathPlan::ShotPathCallback(const nav_msgs::Path::ConstPtr &msg)
{
    if(adj_shotpath_tmr.GetValue()<5)  return;

    shotpoint_ready.header = msg->header;
    shotpoint_ready.header.stamp = ros::Time();
    shotpoint_ready.point = msg->poses[0].pose.position;
    // offsetpath.poses.clear();
    localpath_flag = 1;
    shotpoint_topath_dist = FindNearestPointInPath(shotpoint_ready.point, frontpath).dis;
}

void TLocalPathPlan::AdjShotPathCallback(const nav_msgs::Path::ConstPtr &msg)
{
    adj_shotpath_tmr.Clear();

    shotpoint_ready.header = msg->header;
    shotpoint_ready.header.stamp = ros::Time();
    shotpoint_ready.point = msg->poses[0].pose.position;
    // offsetpath.poses.clear();
    localpath_flag = 1;
    shotpoint_topath_dist = FindNearestPointInPath(shotpoint_ready.point, frontpath).dis;
}

void TLocalPathPlan::ShotDoneCallback(const geometry_msgs::PointStamped::ConstPtr &msg)
{
    shotpoint_ready.header.frame_id = "WorkDone"; //@max WorkDone means the shotpoint_ready has been vibrated, has no reason to plan linepath.
    topointpath.poses.clear();
}

void TLocalPathPlan::GPSDataCallback(const visualization_msgs::Marker::ConstPtr &msg)
{
    nodecheck->Find("gps_rate")->Beat();

    carpoint.header=msg->header;
    carpoint.point=msg->pose.position;

    if(shotpoint_ready.header.frame_id != "WorkDone")   //如果存在未作业炮点
    {
        geometry_msgs::PointStamped dst_p;
        if(transformPoint("base_link",shotpoint_ready,dst_p,"Localpathplan-Shotpathcallback"))  
        {
            if(nodecheck->Find("frontpath_rate")->value>1 && frontpath.poses.size() &&  localpath_flag == 1 && localpath_clear_flag ==1 &&  shotpoint_topath_dist>1 && shotpoint_topath_id < frontpath.poses.size()-1)   //@max 如果有炮点 且有全局路径 进行偏点规划
            {
                ROS_INFO("\033[1;32m Bezier Path Planner Working ... \033[0m");
                PubBezierPath(globalpath, shotpoint_ready.point);
                localpath_flag = 0;
            }
        }
    }
    if(!(nodecheck->Find("frontpath_rate")->value>1 && frontpath.poses.size()) && shotpoint_ready.header.frame_id!="WorkDone")   //@max 存在炮点，如果不进行偏点规划，则进行直线规划
    {
        // topointpath.header.frame_id = carpoint.header.frame_id;
        topointpath.header.frame_id = "map";
        topointpath.poses.clear();
        int n = 100;
        for (int i = 0; i < n; i++)
        {
            float x1 = carpoint.point.x, x2 = shotpoint_ready.point.x;
            float y1 = carpoint.point.y, y2 = shotpoint_ready.point.y;

            geometry_msgs::PoseStamped p;
            p.pose.position.x = x1 + i * 1.0 / n * (x2 - x1);
            p.pose.position.y = y1 + i * 1.0 / n * (y2 - y1);
            p.header.stamp = ros::Time();
            p.header.frame_id = topointpath.header.frame_id;
            topointpath.poses.push_back(p);
        }
    }
}

void TLocalPathPlan::GlobalPathCallback(const nav_msgs::Path::ConstPtr &msg)
{
    globalpath = *msg;
}

void TLocalPathPlan::OffsetpathResetCallback(const std_msgs::Int32::ConstPtr &msg)
{
    localpath_flag = 1, localpath_clear_flag =1;
    ROS_INFO("\033[1;32mThe Bezier planner was resetted. \033[0m");
}


void TLocalPathPlan::FrontPathCallback(const nav_msgs::Path::ConstPtr &msg)
{
    nodecheck->Find("frontpath_rate")->Beat();
    frontpath = *msg;  //Map坐标系 不管在全局路径上正向还是逆向行驶 其点的id均是正序的

    shotpoint_topath_id = 999999;
    if(shotpoint_ready.header.frame_id != "WorkDone")   
        shotpoint_topath_id = FindNearestPointInPath(shotpoint_ready.point, frontpath).id;
    
    IdDis IdDis1, IdDis2;
    nav_msgs::Path localpath;

    int dir = 0; nh->getParam("/globalpathplan/direction", dir);

    /*接收到frontpath后，与偏点所产生的偏点路径进行拼接，以组成最终的localpath --NIU*/
    if(offsetpath.poses.size() && dir!=0)
    {
        offsetpath_pub.publish(offsetpath);
        /*求距离贝塞尔曲线的第一个点和最后一个点最近的frontpath上的路径点，获取最小距离和路径点的id*/
        if(dir == 1)
        {
            IdDis1 = FindNearestPointInPath(offsetpath.poses[0].pose.position, frontpath); 
            IdDis2 = FindNearestPointInPath(offsetpath.poses[offsetpath.poses.size()-1].pose.position, frontpath);
            // cout << "id1 = " << IdDis1.id << "id2 = " << IdDis2.id << endl;
            // cout << "dis1 = " << IdDis1.dis << "dis2 = " << IdDis2.dis << endl;
        }
        else if(dir == -1) 
        {
            IdDis1 = FindNearestPointInPath(offsetpath.poses[offsetpath.poses.size()-1].pose.position, frontpath);
            IdDis2 = FindNearestPointInPath(offsetpath.poses[0].pose.position, frontpath);
            // cout << "id1 = " << IdDis1.id << "id2 = " << IdDis2.id << endl;
            // cout << "dis1 = " << IdDis1.dis << "dis2 = " << IdDis2.dis << endl;
        }

        if(IdDis1.dis < 1 && IdDis2.dis < 1) //贝塞尔在frontpath的中间
        {
            nav_msgs::Path path0;
            // printf("%d %d\n", path2.poses.size(), path0.poses.size());
            for(int i=0;i<IdDis1.id;i++)  path0.poses.push_back(frontpath.poses[i]); 

            /*offsetpath 的序号跟全局路径的序号特点一致 车辆正向行驶 offsetpath上的点距离车由近到远为正序1,2,3..,n，反之为逆序 n,..,3,2,1 */
            if(dir == 1){
                for(int i = 0;i < offsetpath.poses.size();i++)  path0.poses.push_back(offsetpath.poses[i]);
            }
            if(dir == -1){
                for(int i = offsetpath.poses.size()-1;i >= 0;i--)  path0.poses.push_back(offsetpath.poses[i]);
            }
            for(int i=IdDis2.id; i<frontpath.poses.size(); i++) path0.poses.push_back(frontpath.poses[i]);

            path0.header = frontpath.header;
            localpath = path0;
        }  
        else if(IdDis1.dis<1 && IdDis2.dis >1) //贝塞尔曲线位于frontpath的后半段，且只有一部分在frontpath的范围内
        {
            nav_msgs::Path path0;
            for(int i=0;i<IdDis1.id;i++)  path0.poses.push_back(frontpath.poses[i]); 
            if(dir == 1){
                for(int i = 0;i < offsetpath.poses.size();i++)  path0.poses.push_back(offsetpath.poses[i]);
            }
            if(dir == -1){
                for(int i = offsetpath.poses.size()-1;i >= 0;i--)  path0.poses.push_back(offsetpath.poses[i]);
            }
            path0.header = frontpath.header;
            localpath = path0;
        }
        else if(IdDis1.dis>1 && IdDis2.dis <1) //贝塞尔曲线位于frontpath的前半段，且只有一部分在frontpath的范围内
        {
            nav_msgs::Path path0;
            nav_msgs::Path path_tmp = GetPathByDis(offsetpath, 0, 10000, dir);  //只取车前方的贝塞尔曲线 输出的path_tmp是按照车辆最近点开始正序排列的 无需再判断路径方向
            for(int i=0;i<path_tmp.poses.size();i++)  
                path0.poses.push_back(path_tmp.poses[i]); 
            for(int i=IdDis2.id;i<frontpath.poses.size();i++)  
                path0.poses.push_back(frontpath.poses[i]);
            path0.header = frontpath.header;
            localpath = path0;
        }
        else  //以上条件都不满足 说明贝塞尔曲线不在frontpath范围
        {
            localpath = frontpath;
        }
    }  

    else if(nodecheck->Find("frontpath_rate")->value > 1 && frontpath.poses.size())
    {
        localpath = frontpath; 
    }

    if(localpath.poses.size()) 
        path_pub.publish(localpath);  //map坐标系
}

void TLocalPathPlan::PubBezierPath(nav_msgs::Path p, geometry_msgs::Point s)
{
    offsetpath.poses.clear();
    float len = 12;
    nh_local->getParam("offset_path_length", len);
    BezierPlan B(s, p, len);
    offsetpath = B.res_path;  /*offsetpath: Map坐标系 其点的id序列与车辆行驶方向一致，如果车辆在全局路径正向行驶，则点按照距离车从近到远是正序的，反之是逆序的*/
    offsetpath.header = p.header;
    if(offsetpath.poses.size() > 5)
    {
        localpath_clear_flag = 0;
    }
    else localpath_clear_flag = 1;
 
    // printf("%d\n", offsetpath.poses.size());
}

void TLocalPathPlan::GetPathMaxMinX(nav_msgs::Path src_path, float* max_x, float* min_x)
{
    *max_x = 0, *min_x = 10000;
    for (auto it = src_path.poses.begin(); it != src_path.poses.end(); ++it)
    {
        geometry_msgs::PointStamped src_p, dst_p;
        src_p.header = src_path.header;
        src_p.point = it->pose.position;
        if(transformPoint("base_link",src_p,dst_p,""))
        {
            if(dst_p.point.x >= *max_x)  *max_x=dst_p.point.x;
            if(dst_p.point.x <= *min_x)  *min_x=dst_p.point.x;
        }
    }
}

nav_msgs::Path TLocalPathPlan::GetPathByX(nav_msgs::Path src_path, float min_x, float max_x)
{
    nav_msgs::Path res;
    res.header=src_path.header;
    res.header.stamp=ros::Time();
    for (auto it = src_path.poses.begin(); it != src_path.poses.end(); ++it)
    {
        geometry_msgs::PointStamped src_p, dst_p;
        src_p.header = res.header;
        src_p.point = it->pose.position;

        if(transformPoint("base_link",src_p,dst_p,""))
        {
            if (dst_p.point.x >= min_x && dst_p.point.x <= max_x)  res.poses.push_back(*it);
        }        
    }
    return res;
}

 /*------截取车辆坐标系下前方(x轴)的路径（添加大折角处求解出现异常的处理）--NIU ------*/
nav_msgs::Path TLocalPathPlan::GetPathByDis(nav_msgs::Path src_path, float min_x, float max_x, int d)
{
    nav_msgs::Path res;
    nav_msgs::Path tmppath;
    res.header=tmppath.header=src_path.header;
    res.header.stamp= tmppath.header.stamp = ros::Time();

    int idmin = -1;
    int id = -1;
    float dmin = 9999999;
    
    for (auto it = src_path.poses.begin(); it != src_path.poses.end(); ++it)
    {
        id+=1;
        geometry_msgs::PointStamped src_p, dst_p;
        src_p.header = tmppath.header;
        src_p.point = it->pose.position;
        //找到位于车辆前方的最近的点
        if(transformPoint("base_link",src_p,dst_p,""))
        {
            geometry_msgs::Point p; p.x = 0; p.y = 0;
            if (dst_p.point.x >= min_x && dst_p.point.x <= max_x)
            {
                float dd = GetDistanceXY(dst_p.point,p);
                if(dd<=dmin) idmin = id, dmin = dd;
            }
        }        
    }
    if(d == 1){
        for(int i=idmin;i<src_path.poses.size();i++)  res.poses.push_back(src_path.poses[i]);
    }
    if(d == -1){
        for(int i=idmin;i>=0;i--)  res.poses.push_back(src_path.poses[i]);
    }
    return res;
}  

void TLocalPathPlan::Run()
{
    nodecheck->Find("node_rate")->Beat();
    nav_msgs::Path localpath;
    offsetpath.header.stamp = topointpath.header.stamp=ros::Time();

    if(offsetpath.poses.size())  
    {
        nav_msgs::Path path_tmp = GetPathByX(offsetpath, 0, 10000);
        float d1 = GetDistanceXY(carpoint.point, offsetpath.poses[0].pose.position);
        float d2 = GetDistanceXY(carpoint.point, offsetpath.poses[offsetpath.poses.size()-1].pose.position);
        if(!path_tmp.poses.size() && (d1<3 || d2 <3))  //d1 d2 用来防止误清除 单纯靠baselink x方向无路径点不能作为走完贝塞尔的判断条件 例如U型路，车和贝塞尔分辨在两侧
        {
            offsetpath.poses.clear();
            localpath_clear_flag = 1;
        }      
    }  

    /*没有全局路径 则采用直奔炮点路径规划*/
    if(!(nodecheck->Find("frontpath_rate")->value > 1 && frontpath.poses.size()) && shotpoint_ready.header.frame_id != "WorkDone")
    {
        ROS_INFO("no global");
        localpath = topointpath;
        if(topointpath.poses.size()) path_pub.publish(localpath);  //map坐标系
    }
    workrange_pub.publish(getWorkRange());
    stoprange_pub.publish(getStopRange());
}

geometry_msgs::PolygonStamped TLocalPathPlan::getWorkRange()
{
    geometry_msgs::PolygonStamped polygon;
    geometry_msgs::Point32 p;
    p.z=0;

    nh_local->getParam("work_range_x", work_range_x);
    nh_local->getParam("work_range_y", work_range_y);


    p.x = 0, p.y = work_range_y;
    polygon.polygon.points.push_back(p);
    p.y = -work_range_y;
    polygon.polygon.points.push_back(p);
    p.x = work_range_x;;
    polygon.polygon.points.push_back(p);
    p.y = work_range_y;
    polygon.polygon.points.push_back(p);

    polygon.header.frame_id = "rslidar";
    polygon.header.stamp = ros::Time::now();
    return polygon;

    float angle=detect_area_angle*0.5*M_PI/180;

    // p.x=0, p.y = detect_area_y/2;
    // polygon.polygon.points.push_back(p);
    // p.y=-p.y;
    // polygon.polygon.points.push_back(p);
    // p.x = detect_area_x, p.y = -tan(angle)*p.x;
    // polygon.polygon.points.push_back(p);
    // p.y = -p.y;
    // polygon.polygon.points.push_back(p);

    // polygon.header.frame_id="base_link";
    // polygon.header.stamp=ros::Time::now();
    // return polygon;
}

geometry_msgs::PolygonStamped TLocalPathPlan::getStopRange()
{
    geometry_msgs::PolygonStamped polygon;
    geometry_msgs::Point32 p;
    p.z = 0;

    float stop_x, stop_y;
    nh_local->getParam("stop_maxx", stop_x);
    nh_local->getParam("stop_maxy", stop_y);
    
    p.x = 0, p.y = stop_y;
    polygon.polygon.points.push_back(p);
    p.y = -stop_y;
    polygon.polygon.points.push_back(p);
    p.x = stop_x;;
    polygon.polygon.points.push_back(p);
    p.y = stop_y;
    polygon.polygon.points.push_back(p);

    polygon.header.frame_id = "rslidar";
    polygon.header.stamp = ros::Time::now();
    return polygon;
}

int main(int argc, char **argv)
{
    ros::init(argc, argv, "localpathplan");
    TLocalPathPlan localpathplan;

    ros::Rate rate(20);
    while(ros::ok())
    {
        localpathplan.Run();
        ros::spinOnce();
        rate.sleep();
    }
       
    return 0;
}