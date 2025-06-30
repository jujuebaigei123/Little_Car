#include <common/public.h>
#include <common/myudp.h>
#include <common/can.h>
#include <ros/ros.h>
#include <geometry_msgs/Point.h>
#include <car_ctr/car_state.h>
#include <car_ctr/car_ctr.h>
#include <geometry_msgs/Twist.h>
#include <std_msgs/Float32.h>
#include <std_msgs/Float32MultiArray.h>


const float RPM2SPD = 3.1416 * 0.24 / 60;
const float SPD2RPM = 1 / RPM2SPD;

class TCarCtr 
{
private:
    TUDP *udp;
    TTimer delay_time;
    ros::NodeHandle *nh;
	
    ros::Subscriber carctr_sub;
    ros::Publisher carstate_pub;

    car_ctr::car_ctr car_ctr;
    car_ctr::car_state car_state;
    bool can_enable=false, run_enable=false;
    TCan *can=NULL;
    float mode_change_time=5;
    TNodeCheck *nodecheck;
    
    void CarCmdCallback(const car_ctr::car_ctr::ConstPtr &msg)
    {
        // printf("run_enale:%d,car_state_ctrmode:%d,car_state.enable:%d\n",run_enable,car_state.ctrmode,car_state.enable);
        if(!run_enable || car_state.ctrmode==0 || car_state.enable!=255)  return;
        car_ctr=*msg;
        char str[50]={0};

        if(car_state.turnmode!=car_ctr.turnmode)
        {
            sprintf(str, "Car SteerModeCtrl %d",car_ctr.turnmode);
            udp->Send(str);
            delay_time.Clear();
        }
        else if(delay_time.GetValue() > mode_change_time && (car_ctr.turnmode==0 || car_ctr.turnmode==1)) 
        {
            sprintf(str, "Car Run %.2f %.2f", msg->speed, msg->angle);
            udp->Send(str);
            // ROS_INFO("%s", str);
        }
        else if(delay_time.GetValue() > mode_change_time && (car_ctr.turnmode==2 || car_ctr.turnmode==4)) 
        {   
            sprintf(str, "Car Run %.2f 0.0", msg->speed);  
            udp->Send(str);
        }
    }

public:
    TCarCtr()
    {
        nh=new ros::NodeHandle("~");

        nodecheck=new TNodeCheck(nh, "node_rate");
	    nodecheck->Find("node_rate")->SetLimit(10);

        nh->getParam("can_enable",can_enable);
        if(can_enable)
        {  
            can = InitCan(0, 500000);
        }
        else
        {
            string remote_ip=""; 
            nh->getParam("remote_ip",remote_ip);
            udp = new TUDP(8090);
            udp->AddRemoteIP(remote_ip, 8080);

            udp->Send("OK");
            usleep(10000);
            carstate_pub = nh->advertise<car_ctr::car_state>("/car_state", 10);
            carctr_sub = nh->subscribe<car_ctr::car_ctr>("/car_cmd", 10, &TCarCtr::CarCmdCallback, this);
            Enable(true);
        }
    }
    
    void Stop(int flag)
    {
        char str[50];
        sprintf(str, "Car Stop %d", flag);
        udp->Send(str);
    }

    void AutoCtr(bool v)
    {
        char str[50];
        if (v)  sprintf(str, "Car Code_Ctrl");
        else  sprintf(str, "Car Key_Ctrl");
        udp->Send(str);
        usleep(2000);
        // ROS_INFO("AutoCtr %s", str);
    }

    void Enable(bool e)
    {
        char str[50];
        if (e)  sprintf(str, "Car Enable");
        else  sprintf(str, "Car Disable");
        udp->Send(str);
        usleep(2000);
        // ROS_INFO("Enable %s", str);
    }

    void UDP_Proc() //  用于处理小车上传的状态信息
    {
        if (udp->rec_count == 0)  return;
        udp->rec_count = 0;

        // car_ctr::car_state car_state;
    
        char recbuf[1000];
        strcpy(recbuf, udp->rec_buf);
        // ROS_INFO("%s || %d", recbuf, strlen(recbuf));

        vector<string> strs = split(recbuf, ";");
        // return;
        
        for (int i = 0; i < strs.size(); i++)
        {
            vector<string> substrs = split(strs.at(i), " ");
            if (substrs.size()>=4 && substrs[0] == "Car")
            {
                car_state.enable = atoi(substrs.at(1).c_str());
                car_state.ctrmode = atoi(substrs.at(2).c_str());
                car_state.turnmode = atoi(substrs.at(3).c_str());
                nodecheck->Find("node_rate")->Beat();
            }
            if (substrs.size()>0 && substrs[0].find("Wheel") != -1) // || substrs[0].substr(0,4)=="Turn" )
            {
                int len = substrs[0].length();
                int id = atoi(substrs[0].substr(len - 1, len).c_str());
                // car_state_msg.WheelMotor_Enable[id] = atoi(substrs.at(1).c_str());
                car_state.speed[id] = atof(substrs.at(2).c_str()) * RPM2SPD;
            }
            if (substrs.size()>=9 && substrs[0].find("errcode") != -1) // || substrs[0].substr(0,4)=="Turn" )
            {
                for(int i=0;i<8;i++)  car_state.errcode[i]=atoi(substrs[1+i].c_str());
                // ROS_INFO("%s", substrs[8].c_str());
            }
        }
            
        carstate_pub.publish(car_state);

        static TTimer tmr;
        if(tmr.GetValue()>1)
        {
            // printf("enable:%d\n",car_state.enable);
            tmr.Clear();
            if(run_enable)
            {
                if(car_state.ctrmode==0)  AutoCtr(true);  
                else if(car_state.enable!=255)  Enable(true);
            }
            else 
            {
                if(car_state.enable!=0)  Enable(false);
                else if(car_state.ctrmode==1)  AutoCtr(false);
            }    
            // ROS_INFO("ENABLE!");
        }    
    }

    void Can_Proc()
    {

    }

    void run()
    {
        nh->getParam("/pathtrack/run_enable", run_enable);
        
        if(can_enable)  Can_Proc();
        else  UDP_Proc();
    }
};

int main(int argc, char **argv)
{
    ros::init(argc, argv, "Car_Ctr");
    TCarCtr myCar;

    ros::Rate rate(20);
    while (ros::ok())
    {
        myCar.run();
        ros::spinOnce();
        rate.sleep();
    }
    return 0;
};
