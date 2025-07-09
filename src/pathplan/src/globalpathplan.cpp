#include <ros/ros.h>
#include <fstream>
#include <std_msgs/String.h>
#include <std_msgs/Int32.h>
#include <nav_msgs/Path.h>
#include <visualization_msgs/Marker.h>
#include <visualization_msgs/MarkerArray.h>
#include <common/public.h>
#include <common/kml_test.h>
#include <tf/transform_broadcaster.h>
#include <tf/transform_listener.h>
#include <common/mydisplay.h>
#include "NavConversion.h"
#include "help_tool/visualize_tool.h"

using namespace std;



class TGlobalPathPlan
{
private:
    ros::NodeHandle *nh_local, *nh;
    ros::Publisher rawpath_pub, path_pub, frontpath_pub, globalpath_pub, resetsp_bypathchange_pub, offsetpath_reset_pub;
    ros::Subscriber gps_sub, file_load_sub, mutiCarPos_sub;

    nav_msgs::Path rawpath, path, frontpath, otherCarPath;
    visualization_msgs::Marker car_marker;
    vector<struct LonLat_Path> rawpaths;

    // TGpxData gd;

    int path_id_last = -1;
    float aimrange = 10;
    bool sim_flag = false;
    bool multi_paths_flag = false;
    string utm_zone_data;

    TNodeCheck *nodecheck;
    geometry_msgs::PoseStamped cur_carPos;

public:
    TGlobalPathPlan()
    {
        nh_local = new ros::NodeHandle("~");
        nh = new ros::NodeHandle();
        rawpath_pub = nh_local->advertise<nav_msgs::Path>("rawpath", 10);
        resetsp_bypathchange_pub = nh_local->advertise<std_msgs::Int32>("resetshotpoint", 10);
        path_pub = nh_local->advertise<nav_msgs::Path>("path", 10);
        frontpath_pub = nh_local->advertise<nav_msgs::Path>("frontpath", 10); //@max pub the path in the valid range
        offsetpath_reset_pub = nh->advertise<std_msgs::Int32>("/ui/offsetpath_reset", 10);

        gps_sub = nh->subscribe<visualization_msgs::Marker>("/car_marker", 10, &TGlobalPathPlan::GPSDataCallback, this);
        mutiCarPos_sub = nh->subscribe("/multiCarpath", 10, &TGlobalPathPlan::MutiCarPosCallback, this);

        nh_local->getParam("aim_range", aimrange);
        nh_local->getParam("sim_flag", sim_flag);

        nodecheck = new TNodeCheck(nh_local, "node_rate gps_rate", 1);
        nodecheck->Find("node_rate")->SetLimit(10);
        nodecheck->Find("gps_rate")->SetLimit(10);
    };

    void GPSDataCallback(const visualization_msgs::Marker::ConstPtr &msg);
    void MutiCarPosCallback(const nav_msgs::Path::ConstPtr &msg);
    // void LoadTrackFromGpx(char *str);
    void LoadGlobalPath();
    void PathInterpolation(const nav_msgs::Path &inputPath);
    void Getrawpath(int id);

    int FindNearestPointInPath(geometry_msgs::Point p);
    int FindNearestPointInPath(geometry_msgs::Point p, vector<struct LonLat_Path> paths);

    int GetPathDirection();

    void Run();
};

void TGlobalPathPlan::MutiCarPosCallback(const nav_msgs::Path::ConstPtr &msg)
{
    int target_car_id = 1;
    nh->getParam("/multi_car/target_car_id", target_car_id);  
    if (msg->poses.size() < target_car_id)  return;
    geometry_msgs::PoseStamped carPos;
    carPos.header = msg->header;
    carPos.pose.position = msg->poses[target_car_id-1].pose.position;

    // ROS_INFO("%.2f %.2f", carPos.pose.position.x, carPos.pose.position.y);

    if (otherCarPath.poses.size() > 0)
    {
        geometry_msgs::Point p1 = carPos.pose.position;
        geometry_msgs::Point p2 = otherCarPath.poses[otherCarPath.poses.size() - 1].pose.position;
        float dd = GetDistanceXY(p1, p2);
        if (dd > 0.5)
        {
            otherCarPath.header = msg->header;
            otherCarPath.poses.push_back(carPos);
        }
    }
    else
    {
        otherCarPath.header = msg->header;
        if(cur_carPos.pose.position.x == 0 &&cur_carPos.pose.position.y == 0) 
        {
            ROS_INFO("return");
            return;
        }
        otherCarPath.poses.push_back(cur_carPos);  //  补全路径
        otherCarPath.poses.push_back(carPos);
        ROS_INFO("%f,%f",otherCarPath.poses[0].pose.position.x,otherCarPath.poses[0].pose.position.y);
    }

    // 限制轨迹长度
    const size_t max_traj_length = 60;  // 可调最大轨迹长度
    if (otherCarPath.poses.size() > max_traj_length)
        otherCarPath.poses.erase(otherCarPath.poses.begin());

    // ROS_INFO("otherCarPath.size() = %lu", otherCarPath.poses.size());
    if (otherCarPath.poses.size() < 5)  return;
    rawpath = otherCarPath;
    PathInterpolation(otherCarPath);
    
    // planner_exe::VisualizationTool &visual_tool = planner_exe::VisualizationTool::getInstance();
    // auto markers = visual_tool.buildPathWithBoxMarkers("planned_path", rawpath, 
    //     "map", 2.0, "orange", "gray", 3); // 等待 RViz 订阅者就绪
    // visual_tool.publishPathMarkers(markers, "/visTool/othercar_rawpath");
}


/* 加载全局路径(震源车)(UTM)*/
// void TGlobalPathPlan::LoadTrackFromGpx(char *str)
// {
//     _Point ptmp;
//     gd.Load(str);
//     rawpath.header.stamp = ros::Time::now();
//     rawpath.header.frame_id = "map";
//     rawpath.poses.clear();
//     path.poses.clear();

//     /*获取UTM起始点坐标*/
//     double utmx_zero = 0, utmy_zero = 0;
//     ros::param::get("/gps_base/utmx_zero", utmx_zero);
//     ros::param::get("/gps_base/utmy_zero", utmy_zero);

//     for (int j = 0; j < gd.trackcount; j++)
//     {
//         gd.track[j].track_points.clear();

//         vector<double> xtmp, ytmp;
//         xtmp.clear();
//         ytmp.clear();
//         for (int i = 0; i < gd.track[j].points.size(); i++)
//         {
//             LLtoUTM(gd.track[j].points[i].lat, gd.track[j].points[i].lon, ptmp.y, ptmp.x, utm_zone_data);
//             gd.track[j].track_points.push_back(ptmp);

//             geometry_msgs::PoseStamped p;
//             p.pose.position.x = ptmp.x;
//             p.pose.position.y = ptmp.y;
//             p.header.stamp = ros::Time::now();
//             p.header.frame_id = "map";
//             p.pose.position.x -= utmx_zero, p.pose.position.y -= utmy_zero;
//             rawpath.poses.push_back(p);
//         }
//     }
//     PathInterpolation(rawpath);
// }

/* 加载全局路径(实验小车)(UTM)测试直奔炮点时，将路径文件名设为不存在的即可*/
void TGlobalPathPlan::LoadGlobalPath()
{
    string pathfilename = "";
    nh_local->getParam("pathfilename", pathfilename);
    if (pathfilename == "clear")
    {
        rawpath.poses.clear();
        path.poses.clear();
        frontpath.poses.clear();
        ROS_INFO("\033[1;33m[Clear The Path!]\033[0m");
    }
    else if (pathfilename != "" && access(pathfilename.c_str(), F_OK) != 0)
    {
        ROS_ERROR("\033[1;31m Warnning: Path File Not Exists %s \033[0m", pathfilename.c_str());
    }
    else
    {
        double utmx_zero = 0.0, utmy_zero = 0.0;
        ros::param::get("/gps_base/utmx_zero", utmx_zero);
        ros::param::get("/gps_base/utmy_zero", utmy_zero);

        rawpath.poses.clear();
        rawpath.header.stamp = ros::Time::now();
        rawpath.header.frame_id = "map";

        if (pathfilename.find("txt") != string::npos)
        {
            ROS_INFO("\033[1;33m [Txt path file loaded success!] \033[0m");
            ifstream file(const_cast<char *>(pathfilename.c_str()));
            string line = "";

            while (getline(file, line))
            {
                vector<string> ss = split(line, " ");
                if (ss.size() != 2)
                    continue;

                geometry_msgs::PoseStamped p;
                p.pose.position.x = atof(ss[0].data());
                p.pose.position.y = atof(ss[1].data());
                p.header.stamp = ros::Time::now();
                p.header.frame_id = "map";
                // if(fabs(utmx_zero)+fabs(utmy_zero)<0.001)  utmx_zero=p.pose.position.x,  utmy_zero=p.pose.position.y;  //@max 注释原因：在仿真时会影响全局路径的位置，这句话好像并没用
                p.pose.position.x -= utmx_zero, p.pose.position.y -= utmy_zero;
                rawpath.poses.push_back(p);
            }
            PathInterpolation(rawpath);
        }
        else if (pathfilename.find("kml") != string::npos)
        {
            ROS_INFO("\033[1;33m[Kml Path File Loaded]\033[0m");

            // vector<struct LonLat_Path> rawpaths;
            rawpaths.clear();
            rawpaths = GetLonLatPathsFromKML(pathfilename);

            if (rawpaths.size() > 5)
            {
                multi_paths_flag = true;
                nh_local->setParam("pathfilename", "");

                for (int j = 0; j < rawpaths.size(); ++j)
                {
                    for (int i = 0; i < rawpaths[j].data.size(); ++i)
                    {
                        double UTM_xkml = 0, UTM_ykml = 0;
                        string utm_zone_data;
                        LLtoUTM(rawpaths[j].data[i].lat, rawpaths[j].data[i].lon, UTM_ykml, UTM_xkml, utm_zone_data);
                        // utmx_zero = 640144;
                        // utmy_zero = 4462530;
                        rawpaths[j].data[i].lat = UTM_xkml - utmx_zero;
                        rawpaths[j].data[i].lon = UTM_ykml - utmy_zero;
                    }
                }
                return;
            }
            for (int j = 0; j < rawpaths.size(); ++j)
            {
                for (int i = 0; i < rawpaths[j].data.size(); ++i)
                {
                    double UTM_xkml = 0, UTM_ykml = 0;
                    string utm_zone_data;
                    LLtoUTM(rawpaths[j].data[i].lat, rawpaths[j].data[i].lon, UTM_ykml, UTM_xkml, utm_zone_data);
                    geometry_msgs::PoseStamped p;
                    p.header.stamp = ros::Time::now();
                    p.header.frame_id = "map";
                    // utmx_zero = 640144;
                    // utmy_zero = 4462530;
                    p.pose.position.x = UTM_xkml - utmx_zero;
                    p.pose.position.y = UTM_ykml - utmy_zero;
                    rawpath.poses.push_back(p);
                }
            }
            PathInterpolation(rawpath);
        }
    }
    // *只加载一次全局路径 所以清空变量pathfilename
    nh_local->setParam("pathfilename", "");
}

// *对rawpath进行插值处理
void TGlobalPathPlan::PathInterpolation(const nav_msgs::Path &inputPath)
{
    if (inputPath.poses.size() <= 1)
        return;
    // cout <<"rawpath size = " <<rawpath.poses.size() << endl;

    path.header.stamp = ros::Time::now();
    path.header.frame_id = "map";
    path.poses.clear();

    float ds = 0.5;
    nh_local->getParam("path_space", ds); //@max 插值距离
    for (int i = 0; i < inputPath.poses.size() - 1; i++)
    {
        geometry_msgs::Point p1 = inputPath.poses[i].pose.position;
        geometry_msgs::Point p2 = inputPath.poses[i + 1].pose.position;
        float dd = GetDistanceXY(p1, p2);
        int n = dd / ds;
        if (n < 1)
            continue;
        n += 1;
        float dx = (p2.x - p1.x) / n, dy = (p2.y - p1.y) / n;
        for (int j = 0; j < n; j++)
        {
            geometry_msgs::PoseStamped p;
            p.pose.position.x = p1.x + dx * j;
            p.pose.position.y = p1.y + dy * j;
            p.header = inputPath.header;
            path.poses.push_back(p);
        }
    }

    // ROS_INFO("fine path size = %d", path.poses.size());
    path_pub.publish(path);
}

int TGlobalPathPlan::FindNearestPointInPath(geometry_msgs::Point p)
{
    int rid = -1;
    if (path.poses.size() == 0)
        return rid;

    float dmin = 9999999;
    geometry_msgs::Point p1 = p; // car_marker.pose.position;
    for (int i = 0; i < path.poses.size(); i++)
    {
        geometry_msgs::Point p2 = path.poses[i].pose.position;
        // if (p1.x -p2.x > 20 )
        //     continue;
        float dd = GetDistanceXY(p1, p2);
        if (dd <= dmin)
            rid = i, dmin = dd;
    }
    return rid;
}

int TGlobalPathPlan::FindNearestPointInPath(geometry_msgs::Point p, vector<struct LonLat_Path> paths)
{
    int rid = -1;
    if (paths.size() == 0)
        return rid;

    float dmin = 9999999;
    geometry_msgs::Point p1 = p;
    for (int j = 0; j < paths.size(); ++j)
    {
        for (int i = 0; i < paths[j].data.size(); ++i)
        {
            geometry_msgs::Point p2;
            p2.x = paths[j].data[i].lat;
            p2.y = paths[j].data[i].lon;
            float dd = GetDistanceXY(p1, p2);
            if (dd <= dmin)
                rid = j, dmin = dd;
        }
    }
    return rid;
}

int TGlobalPathPlan::GetPathDirection() // 获取路径方向
{
    int id = FindNearestPointInPath(car_marker.pose.position);
    if (id == -1)
        return 0;

    int id1 = id - 2, id2 = id + 2;
    if (id1 < 0)
        id1 = 0;
    if (id2 >= path.poses.size() - 1)
        id2 = path.poses.size() - 1;

    geometry_msgs::PointStamped src_p1, src_p2, dst_p1, dst_p2;
    src_p1.header.frame_id = "map";
    src_p1.header.stamp = ros::Time();
    src_p1.point = path.poses[id1].pose.position;

    src_p2.header.frame_id = "map";
    src_p2.header.stamp = ros::Time();
    src_p2.point = path.poses[id2].pose.position;

    if (transformPoint("base_link", src_p1, dst_p1, "") && transformPoint("base_link", src_p2, dst_p2, ""))
    {
        float x1 = dst_p1.point.x;
        float y1 = dst_p1.point.y;
        float x2 = dst_p2.point.x;
        float y2 = dst_p2.point.y;

        float angle = atan2(y2 - y1, x2 - x1) / 3.1416 * 180;
        if (fabs(angle) < 90)
            return 1;
        else
            return -1;
    }
    else
        return 0;
}

void TGlobalPathPlan::Run()
{
    nodecheck->Find("node_rate")->Beat();

    LoadGlobalPath();

    if (rawpath.poses.size())
    {
        rawpath.header.stamp = ros::Time::now(); // 原始路径
        rawpath_pub.publish(rawpath);
    }
    if (path.poses.size())
    {
        path.header.stamp = ros::Time::now(); // 插值后路径
        path_pub.publish(path);
    }
    if (frontpath.poses.size())
    {
        frontpath.header.stamp = ros::Time::now(); // 车辆前方路径
        frontpath_pub.publish(frontpath);
    }
}

void TGlobalPathPlan::GPSDataCallback(const visualization_msgs::Marker::ConstPtr &msg)
{
    nodecheck->Find("gps_rate")->Beat();

    if (multi_paths_flag)
    {
        int path_id = FindNearestPointInPath(car_marker.pose.position, rawpaths);
        Getrawpath(path_id);
        if (path_id_last != -1 && path_id_last != path_id)
        {
            std_msgs::Int32 msg;
            msg.data = 1;
            resetsp_bypathchange_pub.publish(msg);
            offsetpath_reset_pub.publish(msg);
        }
        path_id_last = path_id;
    }
    car_marker = *msg;
    cur_carPos.header.frame_id="map";
    cur_carPos.header.stamp=ros::Time::now();
    cur_carPos.pose=car_marker.pose;
    ROS_INFO("%f,%f",cur_carPos.pose.position.x,cur_carPos.pose.position.y);
    
    int id = FindNearestPointInPath(car_marker.pose.position);
    if (id == -1)
        return;
    int dir = GetPathDirection();
    nh_local->setParam("direction", dir);
    if (dir == 0)
        return;

    frontpath.poses.clear();
    frontpath.header = path.header;
    int p_id = id;
    float distance = 0;
    geometry_msgs::Point p0 = path.poses[p_id].pose.position;
    while (p_id >= 0 && p_id < path.poses.size() && distance <= aimrange)
    {
        geometry_msgs::Point p1 = path.poses[p_id].pose.position;
        distance += GetDistanceXY(p0, p1);
        p0 = p1;

        frontpath.poses.push_back(path.poses[p_id]);
        p_id += dir;
    }
}

void TGlobalPathPlan::Getrawpath(int id)
{
    rawpath.poses.clear();
    for (int j = id; j < (id + 2); ++j)
    {
        for (int i = 0; i < rawpaths[j].data.size(); ++i)
        {
            geometry_msgs::PoseStamped p;
            p.header.stamp = ros::Time::now();
            p.header.frame_id = "map";
            p.pose.position.x = rawpaths[j].data[i].lat;
            p.pose.position.y = rawpaths[j].data[i].lon;
            rawpath.poses.push_back(p);
        }
    }
    PathInterpolation(rawpath);
}

int main(int argc, char **argv)
{
    ros::init(argc, argv, "globalpathplan");
    TGlobalPathPlan globalpathplan;

    ros::Rate rate(20);
    while (ros::ok())
    {
        globalpathplan.Run();
        ros::spinOnce();
        rate.sleep();
    }

    return 0;
}