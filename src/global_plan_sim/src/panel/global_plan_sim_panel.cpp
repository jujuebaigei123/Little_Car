#include <stdio.h>

#include <QPainter>
#include <QLineEdit>
#include <QVBoxLayout>
#include <QHBoxLayout>
#include <QLabel>
#include <QPushButton>
#include <QTimer>
#include <QDebug>
#include <std_msgs/String.h>
#include <common/public.h>
#include <geometry_msgs/PoseStamped.h>
#include <tf/tf.h>
#include <nav_msgs/Path.h>
#include "common/mydisplay.h"

#include <QDir>
#include <fstream>
#include <iostream>
#include <unistd.h>
#include "mqtt_commx/path_point.h"
#include "global_plan_sim_panel.h"

using namespace std;

namespace rviz_gui
{
    QStringList filenameInDir(string path)
    {
        //存储文件名称
        QStringList string_list;

        //判断路径是否存在
        QDir dir(QString::fromStdString(path));
        if (!dir.exists())  return string_list;

        //查看路径中后缀为.yaml格式的文件
        QStringList filters;
        filters << QString("*.yaml");
        dir.setFilter(QDir::Files | QDir::NoSymLinks); //设置类型过滤器，只为文件格式
        dir.setNameFilters(filters);                   //设置文件名称过滤器，只为filters格式

        //统计文件个数
        int dir_count = dir.count();
        for (int i = 0; i < dir_count; i++)
        {
            QString file_name = dir[i]; //文件名称
            file_name=file_name.left(file_name.size()-5);
            string_list.append(file_name);
        }
        return string_list;
    }

    Panel_Global_Plan_Sim::Panel_Global_Plan_Sim(QWidget *parent)
        : rviz::Panel(parent), ui(new Ui::Panel_Global_Plan_Sim)
    {
        ui->setupUi(this);

        nh = new ros::NodeHandle();
        nh_local = new ros::NodeHandle("~");

        trackpath_pub = nh->advertise<nav_msgs::Path>("/track_path", 10);
        task_pub = nh->advertise<mqtt_comm::task>("/task_cmd", 10);
        
        carstate_sub = nh->subscribe<car_ctr::car_state>("/car_state", 10, &Panel_Global_Plan_Sim::CarStateCallback, this);
        carctr_sub = nh->subscribe<car_ctr::car_ctr>("/car_cmd", 10, &Panel_Global_Plan_Sim::CarCtrCallback, this);
        target_sub = nh->subscribe<geometry_msgs::PoseStamped>("/local_path_plan/target_pose", 10, &Panel_Global_Plan_Sim::TargetCallback, this);
        remainpath_sub = nh->subscribe<std_msgs::Float64>("/local_path_plan/remainpath", 10, &Panel_Global_Plan_Sim::RemainPathCallback, this);
        follow_pose_sub = nh->subscribe<mqtt_commx::path_point>("/leader_pose", 10, &Panel_Global_Plan_Sim::ReceivePoseCallback, this);
        
        qtmr.start(200);
        connect(&qtmr, SIGNAL(timeout()), this, SLOT(qtmrfunc()));

        connect(ui->btn_load, SIGNAL(clicked()), this, SLOT(btn_load_onclick()));
        connect(ui->btn_cleartrack, SIGNAL(clicked()), this, SLOT(btn_cleartrack_onclick()));
        connect(ui->btn_stop, SIGNAL(clicked()), this, SLOT(btn_stop_onclick()));
        connect(ui->btn_syscheck, SIGNAL(clicked()), this, SLOT(btn_syscheck_onclick()));
        connect(ui->btn_enable, SIGNAL(clicked()), this, SLOT(btn_enable_onclick()));
        connect(ui->btn_sample, SIGNAL(clicked()), this, SLOT(btn_sample_onclick()));
        
        char filename[1000];
        GetPackagePath("global_plan_sim", filename);
        int pos = strlen(filename);
        if (pos > 0)  filename[pos-1] = 0;
        sprintf(filename, "%s/path", filename);
        pathfilepath=filename;

        QStringList filenames = filenameInDir(pathfilepath);
        ui->cb_load->clear();
        ui->cb_load->addItems(filenames);

        string agvid, ver;
        nh->getParam("/Car_ID", agvid);
        nh->getParam("/version", ver);
        agvid="Car: "+agvid+" "+ver;
        ui->label_agvid->setText(QString::fromStdString(agvid));

        string init_path;
        nh_local->getParam("init_path", init_path);
        // ROS_INFO("%s", init_path.c_str());
        ui->cb_load->setCurrentText(QString::fromStdString(init_path));
        sleep(1);
        btn_load_onclick();
    }
    void Panel_Global_Plan_Sim::ReceivePoseCallback(const mqtt_commx::path_point::ConstPtr &msg)
    {
        static mqtt_commx::path_point last_pose=*msg;
        static int end_count = 0;
        if(*msg != last_pose )
        {
            // printf("start_point:%d\r\n",start_count);
            // printf("end_point:%d\r\n",end_count);
            if(end_count >= 1)
            {
                // printf("record point!!!!\r\n");
                string fn=ui->cb_load->currentText().toStdString();
                string filename=pathfilepath+"/"+fn+".yaml";
                // ROS_INFO("%s",filename.c_str());

                YAML::Node config = YAML::LoadFile(filename);
                
                char posename[100];
                for(int i=0;i<10000;i++)
                {
                    sprintf(posename,"pose%d",i);
                    if (config[posename]["map_x"].IsDefined()==false)  break;
                }

                YAML::Node newnode=config[posename];
                newnode["map_x"]=last_pose.pointX;
                newnode["map_y"]=last_pose.pointY;
                newnode["heading"]=last_pose.pointHA;
                if(last_pose.vehSpeed == 0) last_pose.vehSpeed = 0.5;
                newnode["vel"]=last_pose.vehSpeed;
                newnode["caption"]="";
                
                ofstream ofs(filename);
                ofs << config;
                ofs.close();
                
                // 先让头车走一段再开始跟随
                printf("load!!!\r\n");
                btn_load_onclick();
                end_count = 0;
            }
            last_pose = *msg;
            
            end_count += 1;
            
        }
        // printf("count:%d\n",count);
    }
    void Panel_Global_Plan_Sim::PubTrackPath()  // 发布车辆走过的轨迹
    {
        track_path.header.frame_id = "map";
        track_path.header.stamp = ros::Time::now();

        geometry_msgs::PoseStamped pose_map, pose_base;
        pose_base.header.stamp = ros::Time::now();
        pose_base.header.frame_id = "base_link";
        pose_base.pose.orientation.w=1;
        transformPose("map", pose_base, pose_map, "XXX");

        bool add_flag = true;
        if (track_path.poses.size() > 0)
        {
            geometry_msgs::PoseStamped last_pose = *(track_path.poses.end() - 1);
            float dx = last_pose.pose.position.x - pose_map.pose.position.x;
            float dy = last_pose.pose.position.y - pose_map.pose.position.y;
            float ds = sqrt(pow(dx, 2) + pow(dy, 2));
            add_flag = (ds > 0.1);
        }
        if (add_flag)  track_path.poses.push_back(pose_map);
        //  保留100m轨迹
        if(track_path.poses.size()>100)  track_path.poses.erase(track_path.poses.begin());

        trackpath_pub.publish(track_path);
    }

    
    void Panel_Global_Plan_Sim::qtmrfunc()  // 定时
    {
        nh_local->getParam("/gps_base/utmx_zero", utm_x_zero);
        nh_local->getParam("/gps_base/utmy_zero", utm_y_zero);

        char buf[1000];

        string errcode="";
        nh_local->getParam("/mqtt_comm/err",errcode);
        sprintf(buf, "errcode: %s", errcode.c_str());
        ui->lab8->setText(QString::fromUtf8(buf));

        PubTrackPath();

        nh_local->getParam("/pathtrack/run_enable", run_enable);
        // ROS_INFO("%d", run_enable);
        if(run_enable)  ui->btn_enable->setStyleSheet("background-color: rgb(0, 255, 0);");
        else ui->btn_enable->setStyleSheet("background-color: rgb(186, 189, 182);");

        geometry_msgs::PoseStamped zero_base;
        zero_base.header.frame_id="base_link";
        zero_base.pose.orientation.w=1;
        transformPose("map",zero_base,pose_map);
        float angle=GetYawFromPose(pose_map)*180/M_PI;
        sprintf(buf, "pose: x=%.2f y=%.2f angle=%.1f°", pose_map.pose.position.x,pose_map.pose.position.y, angle);
        ui->lab1->setText(QString::fromUtf8(buf));

        sprintf(buf, "remainpath: %.2f", remain_path_length);
        ui->lab3->setText(QString::fromUtf8(buf));

        ContinueProcess();  
    }

    void Panel_Global_Plan_Sim::mqttTaskCallback(const mqtt_comm::mqtt_task::ConstPtr &msg)
    {
        cur_task.taskId=msg->taskId;
        task_id=msg->taskId;
        LoadPath(msg->pathId);

        cur_task.stamp = ros::Time::now();
        cur_task.final_path=true;
        task_pub.publish(cur_task);
        // cur_task = *msg;
    }
    
    void Panel_Global_Plan_Sim::RemainPathCallback(const std_msgs::Float64::ConstPtr &msg)
    {
        remain_path_length=msg->data;
    }

    void Panel_Global_Plan_Sim::CarStateCallback(const car_ctr::car_state::ConstPtr &msg)  //接收车辆状态
    {
        // string wheel_enable="", turn_enable="";
        // for(int i=0;i<4;i++)
        // {
        //     if((msg->enable>>i) & 0x01)  wheel_enable+=" 1";
        //     else wheel_enable+=" 0";

        //     if((msg->enable>>(i+4)) & 0x01)  turn_enable+=" 1";
        //     else turn_enable+=" 0";  
        // }

        // char buf[1000];
        // sprintf(buf, "car_state: wheel_enable=%s wheel_err=%d %d %d %d\n", wheel_enable.c_str(), msg->errcode[0], msg->errcode[1], msg->errcode[2], msg->errcode[3]);
        // sprintf(buf, "%s                      turn_enable=%s turn_err=%d %d %d %d\n", buf, turn_enable.c_str(), msg->errcode[4], msg->errcode[5], msg->errcode[6], msg->errcode[7]);
        // sprintf(buf, "%s                      turn=%d ctr=%d vel=%.1f", buf, msg->turnmode, msg->ctrmode, msg->speed[0]);
        // ui->lab3->setText(QString::fromUtf8(buf));
        car_state = *msg;
    }

    void Panel_Global_Plan_Sim::CarCtrCallback(const car_ctr::car_ctr::ConstPtr &msg)      //接收车辆状态
    {
        // char buf[1000];
        // sprintf(buf, "car_ctr: turnmode=%d vel=%.1f angle=%.1f", msg->turnmode, msg->speed, msg->angle);
        // ui->lab4->setText(QString::fromUtf8(buf));
        car_ctr=*msg;
    }

    void Panel_Global_Plan_Sim::TargetCallback(const geometry_msgs::PoseStamped::ConstPtr &msg)
    {
        char buf[1000];
        float angle=GetYawFromPose(*msg)*180/M_PI;
        sprintf(buf, "target:x=%.2f y=%.2f angle=%.2f", msg->pose.position.x, msg->pose.position.y, angle);
        ui->lab2->setText(QString::fromUtf8(buf));
    }

    void Panel_Global_Plan_Sim::ContinueProcess()  
    {
        
        
        static TTimer tmr; 
        bool flag=false;
        nh->setParam("/next_path",next_path);
        if(repeat_flag==1) 
        {
            tmr.Clear();
            repeat_flag++;
        }

        else if(repeat_flag==2 && tmr.GetValue()>0.1)
        {
            repeat_flag++;
            tmr.Clear();
        }
        else if(repeat_flag==3 && tmr.GetValue()>0.1)
        {           
            if(next_path!="")  
            {
                
                nh->getParam("/arrive_flag", flag);
                if(flag)   repeat_flag++;
                //nh->setParam("/arrive_flag",false);
            }
            else repeat_flag = 0;
        } 
        else if(repeat_flag==4 && tmr.GetValue()>0.1)  
        {
            ui->cb_load->setCurrentText(QString::fromStdString(next_path));
            btn_load_onclick();
            nh->setParam("/arrive_flag", false);
        }
        // printf("arrive_flag:%d\n",flag);
    } 

    void Panel_Global_Plan_Sim::LoadPath(string fn)
    {
        fn=pathfilepath+"/"+fn+".yaml";
        if(access(fn.c_str(), F_OK)!=0)  return;
        // printf("%s\n", fn.c_str());

        if(fn=="new_path1")  nh->setParam("/next_path_len", 82.1);
        else nh->setParam("/next_path_len", 82.1);

        YAML::Node config = YAML::LoadFile(fn);
        cur_task.cmd="run task";
        cur_task.path.clear();

        if(config["next_path"].IsDefined())  next_path=config["next_path"].as<string>();
        else  next_path="";

        for(int i=0;i<1000;i++)
        {
            char posename[100];
            sprintf(posename,"pose%d",i);
            
            if (config[posename]["map_x"].IsDefined())
            {
                YAML::Node node=config[posename];
                mqtt_comm::path_point point;
                if(node["circle"].IsDefined())
                {
                    float c_x=node["map_x"].as<float>();
                    float c_y=node["map_y"].as<float>();
                    YAML::Node cnode=node["circle"];
                    float c_r=cnode[0].as<float>();
                    float c_a1=cnode[1].as<float>();
                    float c_a2=cnode[2].as<float>();
                    int n=cnode[3].as<int>();
                    int order=cnode[4].as<int>();
                    float c_da=(c_a2-c_a1)/n;
                    
                    point.vehSpeed = node["vel"].as<float>();
                    vector<mqtt_comm::path_point> points;
                    for(int i=0;i<=n;i++)
                    {
                        float angle=(c_a1+c_da*i)*M_PI/180;
                        point.pointX = c_x+c_r*cos(angle);
                        point.pointY = c_y+c_r*sin(angle);
                        points.push_back(point);
                    }
                    
                    for(int i=0;i<=n;i++)
                    {
                        float h_angle=0;
                        if(i==n)  h_angle=180/M_PI*atan2(points[i].pointY-points[i-1].pointY, points[i].pointX-points[i-1].pointX);
                        else h_angle=180/M_PI*atan2(points[i+1].pointY-points[i].pointY, points[i+1].pointX-points[i].pointX); 
                        if(order==-1)  h_angle+=180;
                        points[i].pointHA=h_angle;
                        point.pointHA = h_angle;
                        point.pointX=points[i].pointX;
                        point.pointY=points[i].pointY;
                        // if(node["lane_type"].IsDefined())  point.lane_type=node["lane_type"].as<int>();
                        // else point.lane_type=0;
                        cur_task.path.push_back(point);
                        // ROS_INFO("111111111111111111111");
                    }
                }
                else 
                {
                    point.pointX = config[posename]["map_x"].as<float>();
                    point.pointY = config[posename]["map_y"].as<float>();
                    point.pointHA = config[posename]["heading"].as<float>();
                    point.vehSpeed = config[posename]["vel"].as<float>();
                    point.caption="";
                    point.actEnable=false; 
                    if(config[posename]["caption"].IsDefined())  
                    {
                        point.caption = config[posename]["caption"].as<string>();
                        point.actEnable=true; 
                            // ROS_INFO("%s, %s ", workIds.c_str(), point.caption.c_str());  
                    }
                    
                    if(point.actEnable)
                    {
                        for(int j=0;j<100;j++)
                        {
                            char actname[100];
                            sprintf(actname,"action%d",j);

                            if(config[posename][actname].IsDefined())
                            {
                                YAML::Node node=config[posename][actname];
                                mqtt_comm::path_point_action act;
                                
                                for(int i=0;i<node.size();i++)
                                    if(i==0)  act.caption=node[i].as<string>();
                                    else act.params.push_back(node[i].as<float>());

                                point.actions.push_back(act);    
                                // ROS_INFO("%d",node.size());
                            }
                            else break;
                        }
                    }    
                    cur_task.path.push_back(point); 
                }   
            }
            else break;
        }

        if(cur_task.path.size()<=1)  return;

        cur_task.only_akm=config["onlyAkm"].as<bool>();
        cur_task.accordingPathdir=config["accordingPathdir"].as<bool>();
        if(cur_task.accordingPathdir)
        {
            for(int i=0;i<cur_task.path.size();i++)
                if(i==cur_task.path.size()-1)  cur_task.path[i].pointHA=cur_task.path[i-1].pointHA;
                else
                {
                    float x1 = cur_task.path[i].pointX, y1 = cur_task.path[i].pointY;
                    float x2 = cur_task.path[i+1].pointX, y2 = cur_task.path[i+1].pointY;
                    cur_task.path[i].pointHA = atan2(y2 - y1, x2 - x1)*180/M_PI;
                }
        }
    }

    void Panel_Global_Plan_Sim::btn_load_onclick()    //  发布路径指令
    {
        btn_stop_onclick();
        usleep(50000);
        
        string str=ui->cb_load->currentText().toStdString();
        // printf("str:%s\n",str.c_str());
        LoadPath(str);
        cur_task.stamp = ros::Time::now();
        cur_task.final_path=true;
        cur_task.taskId=task_id;
        task_pub.publish(cur_task);
        repeat_flag=1;
    }

  
    void Panel_Global_Plan_Sim::btn_stop_onclick()    //  发送停车指令
    {
        cur_task.stamp = ros::Time::now();
        cur_task.cmd = "stop task";
        cur_task.path.clear();
        task_pub.publish(cur_task);

        repeat_flag=0;
    }

    void Panel_Global_Plan_Sim::btn_cleartrack_onclick()    //  清除跟踪轨迹
    {

        track_path.poses.clear();
    }

    void Panel_Global_Plan_Sim::btn_syscheck_onclick()     //  系统状态检查
    {
        d_nodecheck=new dialog_node_check(this);
        d_nodecheck->setModal(true);
        d_nodecheck->show();
    }

    void Panel_Global_Plan_Sim::btn_enable_onclick()      //  系统使能
    {
        nh_local->setParam("/pathtrack/run_enable", !run_enable);
        // nh->setParam("/pathtrack/run_enable", !run_enable);
    }

    void Panel_Global_Plan_Sim::btn_sample_onclick()      //  采集数据
    {
        string fn=ui->cb_load->currentText().toStdString();
        string filename=pathfilepath+"/"+fn+".yaml";
        // ROS_INFO("%s",filename.c_str());

        YAML::Node config = YAML::LoadFile(filename);
        
        char posename[100];
        for(int i=0;i<10000;i++)
        {
            sprintf(posename,"pose%d",i);
            if (config[posename]["map_x"].IsDefined()==false)  break;
        }

        YAML::Node newnode=config[posename];
        newnode["map_x"]=pose_map.pose.position.x;
        newnode["map_y"]=pose_map.pose.position.y;
        newnode["heading"]=GetYawFromPose(pose_map)*180/M_PI;
        newnode["vel"]=0.3;
        newnode["caption"]="";
        
        ofstream ofs(filename);
        ofs << config;
        ofs.close();
    }
  

} // end namespace rviz_teleop_commander

// 声明此类是一个rviz的插件
#include <pluginlib/class_list_macros.h>
PLUGINLIB_EXPORT_CLASS(rviz_gui::Panel_Global_Plan_Sim, rviz::Panel)
// END_TUTORIAL
