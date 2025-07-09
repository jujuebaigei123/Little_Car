#ifndef HELP_TOOL_VISUALIZE_TOOL_H
#define HELP_TOOL_VISUALIZE_TOOL_H

#include <geometry_msgs/PolygonStamped.h>
#include <geometry_msgs/PoseStamped.h>
#include <nav_msgs/Path.h>
#include <ros/ros.h>
#include <visualization_msgs/Marker.h>
#include <visualization_msgs/MarkerArray.h>
#include <Eigen/Core>
#include <Eigen/Dense>
#include <Eigen/Sparse>
#include <unordered_map>
#include <vector>
#include <rviz_visual_tools/rviz_visual_tools.h>
// #include "refpath_planner/safe_corridor.h"

namespace planner_exe
{
    class VisualizationTool
    {
    public:
        static VisualizationTool &getInstance()
        {
            static VisualizationTool instance;
            return instance;
        }

        // 禁用拷贝和赋值
        VisualizationTool(const VisualizationTool &) = delete;
        void operator=(const VisualizationTool &) = delete;

        void updateVisualPoint(const std::string &point_id, const Eigen::Vector2d &point,
                               const std::string &frame_id = "map", const double scale = 0.2,
                               const std::string &color = "red");

        void updateVisualPoint(const std::string &point_id, const Eigen::Vector3d &point,
                               const std::string &frame_id = "map", const double scale = 0.2,
                               const std::string &color = "red");

        void updateVisualPoints(const std::string &points_id,
                                const std::vector<Eigen::Vector2d> &points,
                                const std::string &frame_id = "map", const double scale = 0.2,
                                const std::string &color = "red");

        void updateVisualPoints(const std::string &points_id,
                                const std::vector<Eigen::Vector3d> &points,
                                const std::string &frame_id = "map", const double scale = 0.2,
                                const std::string &color = "red");

        void updateVisualPath(const std::string &path_id, const int path_idx,
                              const std::vector<Eigen::Vector2d> &path,
                              const std::string &frame_id = "map", const double scale = 0.1,
                              const std::string &color = "red");

        void updateVisualVehicle(const std::string &vehicle_id, const Eigen::Vector3d &pose,
                                 const std::string &frame_id = "map",
                                 const std::string &color = "red");

        void updateVisualVehiclePath(const std::string &vehicle_path_id,
                                     const std::vector<Eigen::Vector3d> &poses,
                                     const std::string &frame_id = "map",
                                     const std::string &color = "red");
        // box
        void visualizeCorridorBox(const std::string &id,
                                  const std::vector<Eigen::Vector2d> &box_corner_points,
                                  const std::string &frame_id, const std::string &color = "blue");

        // 可视化一系列安全走廊boxes
        void visualizeCorridorBoxes(const std::string &id,
                                    const std::vector<std::vector<Eigen::Vector2d>> &boxes,
                                    const std::string &frame_id, const std::string &color = "blue");
        visualization_msgs::MarkerArray buildPathWithBoxMarkers(
            const std::string &path_id,
            const nav_msgs::Path &path,
            const std::string &frame_id,
            const double path_width,
            const std::string &path_color,
            const std::string &box_color,
            int box_mode // 0: no box, 1: flat box, 2: full 3D 3: flat wireframe only
        );
        visualization_msgs::MarkerArray buildPathWithBoxMarkers(
            const std::string &path_id,
            const std::vector<Eigen::Vector4d> &path_vec,
            const std::string &frame_id,
            const double path_width,
            const std::string &path_color,
            const std::string &box_color,
            int box_mode // 0: no box, 1: flat box, 2: full 3D 3: flat wireframe only
        );
        void publishPathMarkers(const visualization_msgs::MarkerArray &marker_array,
                                const std::string &topic_name);
        // 删除指定ID的可视化对象
        void deleteObject(const std::string &id);

        // 清除所有可视化对象
        void clearAll();

        // 设置车辆尺寸
        // void setVehicleSize(double length, double width, double height) {
        //     vehicle_length_ = length;
        //     vehicle_width_ = width;
        //     vehicle_height_ = height;
        // }

        // 可视化障碍物多边形
        void visualizeObstaclePolygons(const std::string &id,
                                       const std::vector<geometry_msgs::PolygonStamped> &polygons,
                                       const std::string &color = "red");
        void visualizeGlobalPathWithBoxes(
            const std::string &path_id,
            const nav_msgs::Path &path,
            const std::string &frame_id,
            const double path_width,
            const std::string &path_color,
            const std::string &box_color,
            int box_mode // 0: no box, 1: flat box, 2: full 3D
        );

    private:
        VisualizationTool();
        ~VisualizationTool() = default;

        ros::NodeHandle nh_;
        ros::Publisher marker_pub_;
        ros::Publisher marker_array_pub_;
        ros::Publisher path_pub_;

        std::map<std::string, ros::Publisher> custom_publishers_;

        std::shared_ptr<rviz_visual_tools::RvizVisualTools> visual_tools_;

        // 车辆尺寸参数
        const double vehicle_length_ = 8.0; // 车长
        const double vehicle_width_ = 2.3;  // 车宽
        const double vehicle_height_ = 3.6; // 车高

        std::unordered_map<std::string, visualization_msgs::Marker> markers_;
        std::unordered_map<std::string, visualization_msgs::MarkerArray> marker_arrays_;
        // 辅助函数
        visualization_msgs::Marker createMarker(const std::string &frame_id, const std::string &ns,
                                                const int32_t type,
                                                const std::vector<double> &color);
        // clang-format off
        const std::unordered_map<std::string, std::vector<double>> color_map_ = {
            {"red",         {0.8, 0.0, 0.0, 1.0}},
            {"green",       {0.0, 1.0, 0.0, 1.0}},
            {"blue",        {0.0, 0.0, 1.0, 1.0}},
            {"yellow",      {1.0, 1.0, 0.0, 1.0}},
            {"cyan",        {0.0, 1.0, 1.0, 1.0}},
            {"magenta",     {1.0, 0.0, 1.0, 1.0}},
            {"white",       {1.0, 1.0, 1.0, 1.0}},
            {"black",       {0.0, 0.0, 0.0, 1.0}},
            {"orange",      {1.0, 0.65, 0.0, 1.0}},
            {"purple",      {0.5, 0.0, 0.5, 1.0}},
            {"pink",        {1.0, 0.75, 0.8, 1.0}},
            {"brown",       {0.65, 0.16, 0.16, 1.0}},
            {"gray",        {0.75, 0.75, 0.75, 1.0}},
            {"light_red",   {1.0, 0.4, 0.4, 1.0}},
            {"light_green", {0.4, 1.0, 0.4, 1.0}},
            {"light_blue",  {0.4, 0.4, 1.0, 1.0}},
            {"dark_red",    {0.6, 0.0, 0.0, 1.0}},
            {"dark_green",  {0.0, 0.6, 0.0, 1.0}},
            {"dark_blue",   {0.0, 0.0, 0.6, 1.0}},
            {"gold",   {0.85, 0.65, 0.13, 1.0}},
            {"navy",   {0.0, 0.0, 0.5, 1.0}},
            {"shallow_blue",{0.0, 0.0, 1.0, 0.75}},
            {"shallow_orange",{1.0, 0.65, 0.0, 0.75}},
            {"shallow_purple",{0.7, 0.2, 0.7, 0.75}},
            {"shallow_green",{0.0, 1.0, 0.0, 0.75}},
            {"shallow_red",{0.8, 0.0, 0.0, 0.10}}


        };
        // clang-format on
        // 获取颜色值的辅助函数
        std::vector<double> getColor(const std::string &color_name) const
        {
            auto it = color_map_.find(color_name);
            if (it != color_map_.end())
            {
                return it->second;
            }
            ROS_WARN_STREAM("Unknown color: " << color_name << ". Using red instead.");
            return color_map_.at("red");
        }
    };
} // namespace planner_exe
#endif
