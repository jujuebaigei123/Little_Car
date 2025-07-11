#include "ros/ros.h"
#include "tf/tf.h"
#include "std_msgs/String.h"
#include "std_msgs/Float64.h"
#include "nav_msgs/Odometry.h"
#include <yaml-cpp/yaml.h>

#include <common/public.h>
#include <common/mydisplay.h>
#include "geometry_msgs/PoseStamped.h"
#include "mqtt_comm/mqtt_controls.h"
#include "mqtt_comm/path_point.h"
#include "mqtt_comm/task.h"
#include "mqtt_comm/mqtt_task.h"

#include "mqtt_comm/resp_agvstate.h"
#include "mqtt_comm/resp_task.h"
#include "mqtt_comm/resp_video.h"
#include "mqtt_comm/resp_ctrl.h"

#include <gps/MyGPS_msg.h>
#include <car_ctr/car_state.h>
#include <car_ctr/car_ctr.h>

using namespace std;

ros::NodeHandle *nh;
ros::Publisher resp_agvstate_pub, resp_task_pub, resp_video_pub, resp_ctrl_pub;
ros::Publisher task_pub;
mqtt_comm::task task_msg;
TNodeCheck *nodecheck;

string agvId = "123";
mqtt_comm::resp_agvstate agvstate_msg;
float remain_path_length=999;

car_ctr::car_state car_state_msg;
car_ctr::car_ctr car_ctr_msg;

struct fault_info
{
    string desc;
    int code;
    int level;
};

struct sensor_item
{
    string nodename;
    string paramname;
    float rate_min;
    fault_info fault;
};

struct node_item  
{
    int id;
    string nodename;
    float rate_min;
    fault_info fault;
};

vector<sensor_item> sensor_array;
vector<node_item> node_array;
vector<fault_info> fault_array;

void SensorFaultInit()
{
    sensor_item sensor_data;
    node_item node_data;
    
    // 传感器故障信息
    sensor_data.nodename = "/gps_pro";                     //gps
    sensor_data.paramname = "node_rate";
    sensor_data.rate_min = 10;
    sensor_data.fault.desc = "slam fault";
    sensor_data.fault.code=0x1001;
    sensor_data.fault.level=1;
    sensor_array.push_back(sensor_data);

    sensor_data.nodename = "/cloud_tf";                    //rslidar
    sensor_data.paramname = "rslidar_rate";
    sensor_data.rate_min = 5;
    sensor_data.fault.desc = "lidar fault";
    sensor_data.fault.code=0x1002;
    sensor_data.fault.level=1;
    sensor_array.push_back(sensor_data);

    sensor_data.nodename = "/cap_image1";                    //CCD
    sensor_data.paramname = "node_rate";
    sensor_data.rate_min = 1;
    sensor_data.fault.desc = "CCD fault";
    sensor_data.fault.code=0x1003;
    sensor_data.fault.level=1;
    sensor_array.push_back(sensor_data);

    sensor_data.nodename = "/car_ctr";       //car_ctr
    sensor_data.paramname = "node_rate";
    sensor_data.rate_min = 10;
    sensor_data.fault.desc = "car_ctr fault";
    sensor_data.fault.code=0x1004;
    sensor_data.fault.level=1;
    sensor_array.push_back(sensor_data);

    sensor_data.nodename = "/car_charge";
    sensor_data.paramname = "node_rate";
    sensor_data.rate_min = 1;
    sensor_data.fault.desc = "station fault";
    sensor_data.fault.code=0x1005;
    sensor_data.fault.level=1;
    sensor_array.push_back(sensor_data);

    sensor_data.nodename = "/can_comm";
    sensor_data.paramname = "node_rate";
    sensor_data.rate_min = 5;
    sensor_data.fault.desc = "battery fault";
    sensor_data.fault.code=0x1006;
    sensor_data.fault.level=1;
    sensor_array.push_back(sensor_data); 

    sensor_data.nodename = "/turntable";
    sensor_data.paramname = "node_rate";
    sensor_data.rate_min = 20;
    sensor_data.fault.desc = "turntable fault";
    sensor_data.fault.code=0x1007;
    sensor_data.fault.level=1;
    sensor_array.push_back(sensor_data);   

    // 节点故障信息
    node_data.id=0;
    node_data.nodename="/read_if_cam";
    node_data.fault.desc="if_cam fault";
    node_data.rate_min = 10;
    node_data.fault.code=0x2001;
    node_data.fault.level=1;
    node_array.push_back(node_data);
}

bool CheckSensor(sensor_item sensor)
{
    float value=0;
    nh->getParam(sensor.nodename+"/check/"+sensor.paramname, value);
    return value>=sensor.rate_min;
}

bool CheckNode(node_item node)
{
    bool res = false;
    float noderate=0;
    static int old_seq[20];
    int seq=0;
    nh->getParam(node.nodename+"/check/seq", seq);
    nh->getParam(node.nodename+"/check/node_rate", noderate); 
    res=old_seq[node.id]!=seq;
    old_seq[node.id] = seq;
    return res && noderate>=node.rate_min;
}

void UpdateFaultInfo()
{
    fault_array.clear();
    for(auto s: sensor_array)  
    {
        if(!CheckSensor(s))  
        {
            fault_array.push_back(s.fault);
        }
    }

    for(auto n: node_array)
    {
        if(!CheckNode(n))
        {
            fault_array.push_back(n.fault);
        }  
    }

    //  速度控制检测
    // static TTimer speed_check_tmr;
    // if(car_state_msg.ctrmode==0 || fabs(car_state_msg.speed[0]-car_ctr_msg.speed)<0.1)  speed_check_tmr.Clear();
    // else if(speed_check_tmr.GetValue()>20)
    // {
    //     fault_info fault;
    //     fault.desc = "speed ctr fault";
    //     fault.code=0x4003;
    //     fault.level=2;
    //     fault_array.push_back(fault);
    // }

    //  电机驱动报警
    bool motorerr_state=false;
    for(int i=0;i<8;i++)
        if(car_state_msg.errcode[i]!=0)
        {
            motorerr_state=true;
            break;
        }
    if(motorerr_state)
    {
        fault_info fault;
        fault.desc = "motor err";
        fault.code=0x4001;
        fault.level=1;
        fault_array.push_back(fault);
    }    

    if(car_state_msg.enable!=255)
    {
        fault_info fault;
        fault.desc = "enable err";
        fault.code=0x4002;
        fault.level=1;
        fault_array.push_back(fault);
    }  

   
    char errcode[1000]={0}, warncode[1000]={0};
    for(auto it:fault_array)
    {
        if(it.level==1)  sprintf(errcode,"%s %04x", errcode, it.code);
        else  sprintf(warncode,"%s %04x", warncode, it.code);
    }    
    //if(err!="")  ROS_ERROR("%s", err.c_str());
    nh->setParam("err",errcode);
    nh->setParam("warn",warncode);

    agvstate_msg.errCode=errcode;

    // ROS_INFO("%d", fault_array.fault_info_data.size());
}

void matchingLocCallback(const nav_msgs::Odometry::ConstPtr &msg)
{
    geometry_msgs::Quaternion geo_quat = msg->pose.pose.orientation;
    tf::Quaternion tf_quat;
    tf::quaternionMsgToTF(geo_quat, tf_quat);
    double roll, pitch, yaw;
    tf::Matrix3x3(tf_quat).getRPY(roll, pitch, yaw); //四元数转欧拉角
    yaw *= (180 / M_PI);

    agvstate_msg.pointHA=yaw;
    agvstate_msg.pointX=msg->pose.pose.position.x;
    agvstate_msg.pointY=msg->pose.pose.position.y;
}

void CarStateCallback(const car_ctr::car_state::ConstPtr &msg) //  运动模式
{
    agvstate_msg.steerControlMode = msg->turnmode;
    agvstate_msg.autoDriveEnable = msg->ctrmode;
    agvstate_msg.vehCtrlMode = msg->ctrmode;
    agvstate_msg.vehSpeed = msg->speed[0];
    car_state_msg=*msg;
}

void CarCtrCallback(const car_ctr::car_ctr::ConstPtr &msg) // 接收车辆控制指令
{
    car_ctr_msg=*msg;
}

void RemainPathCallback(const std_msgs::Float64::ConstPtr &msg)
{
    remain_path_length=msg->data;
    // ROS_INFO("%.2f", remain_path_length); 
}
float GetDis2Home()
{
    geometry_msgs::PoseStamped pose_map, pose_base;
    pose_base.header.stamp = ros::Time::now();
    pose_base.header.frame_id = "base_link";
    pose_base.pose.orientation.w=1;
    transformPose("map", pose_base, pose_map, "XXX");

    geometry_msgs::Point p1=pose_map.pose.position, p0;
    p0.x=-0.1,  p0.y=0.83;  //  HOME点坐标
    return GetDistanceXY(p0,p1);
}

void Pub_AgvState() //  发布车辆状态
{
    agvstate_msg.msgType = "agvinfo";
    agvstate_msg.timestamp = ros::Time::now().toSec() * 1000;

    if(remain_path_length<1 && GetDis2Home()<1)  agvstate_msg.taskStatus=1;   // task finished
    else  agvstate_msg.taskStatus=0;
    
    resp_agvstate_pub.publish(agvstate_msg);
}

void TurntableCallback(const std_msgs::String::ConstPtr &msg)
{
    vector<string> ss = split(msg->data, ";");
    for (int i = 0; i < ss.size(); i++)
    {
        vector<string> subs = split(ss[i], " ");
        if (subs[0] == "pitch")
        {
            agvstate_msg.pitchAngle = atof(subs[2].c_str());
            // reached_flag = atoi(subs[3].c_str());
        }
        else if (subs[0] == "azimuth")
        {
            agvstate_msg.azimuthAngle = atof(subs[2].c_str());
            // reached_flag = atoi(subs[3].c_str());
        }
    }

    // ROS_INFO("%.2f %.2f", act_pitch_angle, act_azimuth_angle);
}


void mqttTaskCallback(const mqtt_comm::mqtt_task::ConstPtr &msg) //  回应信号
{
    agvstate_msg.taskId=msg->taskId;
    // ROS_INFO("%s", );
}


void controlsCallback(const mqtt_comm::mqtt_controls::ConstPtr &msg)
{
    // ROS_INFO("value=%d", msg->value);
    // nh->setParam("/pathtrack/run_enable", msg->value==1);
}

int main(int argc, char *argv[])
{
    ros::init(argc, argv, "mqtt_comm");
    nh = new ros::NodeHandle("~");

    // nh->getParam("/agvId", agvId);
    // ROS_INFO("agvId=%s", agvId.c_str());

    resp_agvstate_pub = nh->advertise<mqtt_comm::resp_agvstate>("/resp_agvstate", 10);
    // resp_task_pub = nh->advertise<mqtt_comm::resp_task>("/resp_task", 10);
    // resp_video_pub = nh->advertise<mqtt_comm::resp_video>("/resp_video", 10);
    // resp_ctrl_pub = nh->advertise<mqtt_comm::resp_ctrl>("/resp_ctrl", 10);
    // task_pub = nh->advertise<mqtt_comm::task>("/task_cmd", 10);

    ros::Subscriber mqtttask_sub = nh->subscribe<mqtt_comm::mqtt_task>("/mqtt_task", 10, mqttTaskCallback);
    ros::Subscriber matching_loc_sub = nh->subscribe<nav_msgs::Odometry>("/laser_localization", 10, matchingLocCallback);
    ros::Subscriber carstate_sub = nh->subscribe<car_ctr::car_state>("/car_state", 10, CarStateCallback);
    ros::Subscriber carctr_sub = nh->subscribe<car_ctr::car_ctr>("/car_cmd", 10, CarCtrCallback);
    ros::Subscriber turntable_sub = nh->subscribe<std_msgs::String>("/turntable/table_state", 10, TurntableCallback);
    ros::Subscriber controls_sub = nh->subscribe<mqtt_comm::mqtt_controls>("/mqtt_controls", 10, controlsCallback);
    ros::Subscriber remainpath_sub = nh->subscribe<std_msgs::Float64>("/local_path_plan/remainpath", 10, RemainPathCallback);
        

    float check_duration=4;
    nodecheck = new TNodeCheck(nh, "node_rate",check_duration);
    nodecheck->Find("node_rate")->SetLimit(0.4);

    SensorFaultInit();
    
    ros::Rate loop_rate(1);
    while (ros::ok())
    {
        Pub_AgvState(); //  发送状态心跳
        UpdateFaultInfo();

        ros::spinOnce();
        loop_rate.sleep();
    }

    return 0;
}
