#include<geometry_msgs/Point.h>
#include<nav_msgs/Path.h>
#include <math.h>
#include <eigen3/Eigen/Dense>
#include <vector>
#include <iostream>

#define distance2points(from, to) sqrt(pow(to.x - from.x, 2) + pow(to.y - from.y, 2))


using namespace std;
using namespace Eigen;

int Multiplication(const int N)
{
	if(N==0) return 1;
	else return N*Multiplication(N-1);
};


class TInterportion
{
private:
    vector<double> dx,dy;
    vector<double> ai, bi, ci, di;
    vector<int> x_, x_interportion_;
public:
    vector<double> x_interportion,y_interportion;
    vector<double> x_beseir,y_beseir;
	
    TInterportion(){};
    ~TInterportion(){};    
    void Beseir_spline(const std::vector<double>& x,const std::vector<double>& y,int power);
};



class BezierPlan
{
public:
    vector<double> key_x,key_y;
	nav_msgs::Path res_path;
    BezierPlan(geometry_msgs::Point sp, nav_msgs::Path pt, float len=12);
	double plan_distance;
    bool ok_flag=true;

	void Run();
private:
    geometry_msgs::Point shotpoint;
	vector<geometry_msgs::Point> key_points;

	nav_msgs::Path frontpath;
	TInterportion spline;	
	int FindNearestPointInPath();
	int GetKeyPoint(int m);
	void GetPartResPath(int m);
};


BezierPlan::BezierPlan(geometry_msgs::Point sp, nav_msgs::Path pt, float len)
{
    plan_distance = len;
	shotpoint = sp;
	frontpath = pt;
	key_x.clear();
	key_y.clear();
	key_points.clear();
	Run();
}

int BezierPlan::FindNearestPointInPath()
{
	int rid = -1;
	if (frontpath.poses.size() == 0)  return rid;
	float dmin = 999.9;
	geometry_msgs::Point p1 = shotpoint;
	for (auto i = frontpath.poses.begin(); i < frontpath.poses.end(); ++i)
	{
		geometry_msgs::Point p2 = i->pose.position;
		float dd = distance2points(p1, p2);
		if (dd <= dmin)
			rid = i-frontpath.poses.begin(), dmin = dd;
	}

    return rid;	
}

int BezierPlan::GetKeyPoint(int m)
{
	key_points.clear();
	int nearestID = FindNearestPointInPath();

	geometry_msgs::Point start = frontpath.poses[nearestID].pose.position;
	geometry_msgs::Point next = frontpath.poses[nearestID+1].pose.position;

	geometry_msgs::Point end = shotpoint;
	float devdistance = distance2points(start, end);

	geometry_msgs::Point ver;
	ver.x = end.x - start.x;
	ver.y = end.y - start.y;

	double near_distance = distance2points(start, next);
	int plandiff = round(0.125*plan_distance/near_distance);  //总距离中包含的路径点的数量为(plandiff*8),设置为3表示规划长度为24个点
	
    if(((nearestID-4*plandiff)>=0)&&((nearestID+4*plandiff)<=frontpath.poses.size()))
	{
		// geometry_msgs::Point point1,point2,point3,point4,point5,point6;
		// point1 = path.poses[nearestID-plandiff*4].pose.position;
		// point2 = path.poses[nearestID-plandiff*3].pose.position;
		// point3 = path.poses[nearestID-plandiff*2].pose.position;

		// point4.x = path.poses[nearestID-plandiff*2].pose.position.x + ver.x;
		// point4.y = path.poses[nearestID-plandiff*2].pose.position.y + ver.y;
		
		// point5.x = path.poses[nearestID-plandiff*1].pose.position.x + ver.x;
		// point5.y = path.poses[nearestID-plandiff*1].pose.position.y + ver.y;

		// point6.x = path.poses[nearestID-plandiff*0].pose.position.x + ver.x;
		// point6.y = path.poses[nearestID-plandiff*0].pose.position.y + ver.y;

		for(int i=0;i<3;++i)
		{
			geometry_msgs::Point point;
			point = frontpath.poses[nearestID+m*plandiff*(4-i)].pose.position;
			key_points.push_back(point);
		}

		for(int i=0;i<3;++i)
		{
			geometry_msgs::Point point;
			point.x = frontpath.poses[nearestID+m*plandiff*(2-i)].pose.position.x + ver.x;
			point.y = frontpath.poses[nearestID+m*plandiff*(2-i)].pose.position.y + ver.y;
			key_points.push_back(point);
		}
	}
	else
	{
		// printf("shot=%.1f %.1f nn=%d  n=%d\n", shotpoint.x, shotpoint.y, nearestID, frontpath.poses.size());
		// geometry_msgs::Point p0 = shotpoint, p1 = frontpath.poses.begin()->pose.position, p2 = (frontpath.poses.end() - 1)->pose.position;
		// printf("sp=%.1f %.1f  path from %.1f %.1f to %.1f %.1f\n", p0.x, p0.y, p1.x, p1.y, p2.x, p2.y);
		printf("the path for bezier is too short\n");
		ok_flag=false;
		return 0;
	}
	return 1;
}


void BezierPlan::GetPartResPath(int m)
{
	key_x.clear();
    key_y.clear();
	for(auto i=key_points.begin();i<key_points.end();++i)
	{
		key_x.push_back(i->x);
		key_y.push_back(i->y);
	}  
    spline.Beseir_spline(key_x,key_y,key_x.size());

	if(m==-1)
	{
		for(int i=0;i<spline.x_beseir.size();i++)
		{
			geometry_msgs::PoseStamped pose;
			pose.pose.position.x=spline.x_beseir.at(i);
			pose.pose.position.y=spline.y_beseir.at(i);
			res_path.poses.push_back(pose);
		}
	}
	if(m==1)
	{
		for(int i=spline.x_beseir.size()-1;i>=0;i--)
		{
			geometry_msgs::PoseStamped pose;
			pose.pose.position.x=spline.x_beseir.at(i);
			pose.pose.position.y=spline.y_beseir.at(i);
			res_path.poses.push_back(pose);
		}		
	}
}

void BezierPlan::Run()
{
	res_path.poses.clear();  
	int r1 = GetKeyPoint(-1);
	GetPartResPath(-1);
	int r2 = GetKeyPoint(1);
	GetPartResPath(1);
	if (r1 == 0 || r2 == 0) res_path.poses.clear(); 
}


void TInterportion::Beseir_spline(const std::vector<double>& x,const std::vector<double>& y,int num)
{
    dx.clear();dy.clear();
	ai.clear(); bi.clear(); ci.clear(); di.clear();
	x_.clear(); x_interportion_.clear();
	x_beseir.clear();y_beseir.clear();
	x_interportion.clear();y_interportion.clear();
	x_beseir.clear();y_beseir.clear();
	for(float t=0;t<1;t+=0.01)
	{
		double x_temp=0,y_temp=0;
		for(int i=0;i<num;++i)
		{
			x_temp+=(Multiplication(num-1)/(Multiplication(i)*Multiplication(num-1-i)))*pow(1-t,num-1-i)*pow(t,i)*x[i];
			y_temp+=(Multiplication(num-1)/(Multiplication(i)*Multiplication(num-1-i)))*pow(1-t,num-1-i)*pow(t,i)*y[i];
		}
		x_beseir.push_back(x_temp);
		y_beseir.push_back(y_temp);
	}	
}




