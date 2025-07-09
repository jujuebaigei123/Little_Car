#include "common/kml_test.h"

using kmldom::ElementPtr;
using kmlengine::KmlFile;
using kmlengine::KmlFilePtr;
using namespace std;

vector<struct LonLat_Path> GetLonLatPathsFromKML(string filename)
{
    string kml_str, errors;
    kmlbase::File::ReadFileToString(filename, &kml_str);
    ElementPtr root = kmldom::ParseNS(kml_str, &errors);
    kml_str=kmldom::SerializePretty(root);

    vector<string> kml_strs=split(kml_str,"\n");
	std::cout << kml_strs.size() << std::endl;
    vector<struct LonLat_Path> paths;
	struct LonLat_Path path;
    int state = 0;
	int id_path = 0;

    for(int i=0;i<kml_strs.size();i++)
    {
        if(kml_strs[i].find("<LineString>") != string::npos)  id_path ++;

        if(kml_strs[i].find("<coordinates>") != string::npos && state == 0) {
			state++;
			path.data.clear();
		}
		else if(state == 1){
			if(kml_strs[i].find("</coordinates>") == string::npos) 
			{
				vector<string> strs=split(kml_strs[i],",");
				struct LonLat_Point p;
				p.lon=atof(strs[0].c_str());
				p.lat=atof(strs[1].c_str());
				p.alt=atof(strs[2].c_str());
				if(path.data.size() == 0)
					path.p_start = p;
				path.data.push_back(p);
			}
			else{
				state=0;
				path.p_end = path.data[path.data.size()-1];
				path.id = id_path;
				paths.push_back(path);
			}	
		}
  	}
	return paths;
}

// int main(int argc, char** argv) 
// {
//     vector<struct LonLat_Path> paths=GetLonLatPathsFromKML("/home/wsk/555.kml"); 

// 	for(int i=0;i<paths.size();i++)  printf("%s: %d\n", paths[i].name.c_str(), paths[i].data.size());
  
//     return 0;
// }