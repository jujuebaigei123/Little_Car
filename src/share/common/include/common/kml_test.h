#include <iostream>
#include <string>
#include "boost/scoped_ptr.hpp"
#include "kml/dom.h"
#include "kml/engine.h"
#include "kml/base/file.h"
#include "common/public.h"

using kmldom::ElementPtr;
using kmlengine::KmlFile;
using kmlengine::KmlFilePtr;
using namespace std;

struct LonLat_Point
{
	double lat;    // 纬度
	double lon;    // 经度
	double alt;    // 高度
};

struct LonLat_Path
{
	string name;
	int id;
	LonLat_Point p_start;
	LonLat_Point p_end;
	vector<struct LonLat_Point> data;
};

vector<struct LonLat_Path> GetLonLatPathsFromKML(string filename);


// int main(int argc, char** argv) 
// {
//     vector<struct LonLat_Path> paths=GetLonLatPathsFromKML("/home/wsk/555.kml"); 

// 	for(int i=0;i<paths.size();i++)  printf("%s: %d\n", paths[i].name.c_str(), paths[i].data.size());
  
//     return 0;
// }