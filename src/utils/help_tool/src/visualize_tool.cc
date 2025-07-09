#include "help_tool/visualize_tool.h"
#include <tf/transform_broadcaster.h>
// #include "refpath_planner/safe_corridor.h"
#include <cmath> // For cos and sin

namespace planner_exe
{

    VisualizationTool::VisualizationTool()
    {
        marker_pub_ = nh_.advertise<visualization_msgs::Marker>("/visualization_marker", 10, true);
        marker_array_pub_ =
            nh_.advertise<visualization_msgs::MarkerArray>("/visualization_marker_array", 10, true);
        path_pub_ = nh_.advertise<nav_msgs::Path>("/visualization_path", 10, true);

        // visual_tools_初始化
        visual_tools_ = std::make_shared<rviz_visual_tools::RvizVisualTools>("map", "/rviz_visual_markers");
        visual_tools_->loadMarkerPub();    // 初始化发布器
        visual_tools_->deleteAllMarkers(); // 清除旧内容
    }

    visualization_msgs::Marker VisualizationTool::createMarker(const std::string &frame_id,
                                                               const std::string &ns,
                                                               const int32_t type,
                                                               const std::vector<double> &color)
    {
        visualization_msgs::Marker marker;
        marker.header.frame_id = frame_id;
        marker.header.stamp = ros::Time::now();
        marker.ns = ns;
        marker.type = type;
        marker.action = visualization_msgs::Marker::ADD;

        marker.color.r = color[0];
        marker.color.g = color[1];
        marker.color.b = color[2];
        marker.color.a = color[3];

        marker.lifetime = ros::Duration(0.00); // 100ms

        return marker;
    }

    void VisualizationTool::updateVisualPoint(const std::string &point_id,
                                              const Eigen::Vector2d &point,
                                              const std::string &frame_id, const double scale,
                                              const std::string &color)
    {
        auto marker = createMarker(frame_id, "point_" + point_id,
                                   visualization_msgs::Marker::SPHERE, getColor(color));

        marker.lifetime = ros::Duration(0.0);
        marker.pose.position.x = point.x();
        marker.pose.position.y = point.y();
        marker.pose.position.z = 0;

        marker.scale.x = scale;
        marker.scale.y = scale;
        marker.scale.z = scale;

        markers_[point_id] = marker;
        marker_pub_.publish(marker);
    }

    void VisualizationTool::updateVisualPoint(const std::string &point_id,
                                              const Eigen::Vector3d &point,
                                              const std::string &frame_id, const double scale,
                                              const std::string &color)
    {
        auto marker = createMarker(frame_id, "point_" + point_id,
                                   visualization_msgs::Marker::SPHERE, getColor(color));

        marker.lifetime = ros::Duration(0.0);
        marker.pose.position.x = point.x();
        marker.pose.position.y = point.y();
        marker.pose.position.z = point.z();

        marker.scale.x = scale;
        marker.scale.y = scale;
        marker.scale.z = scale;

        markers_[point_id] = marker;
        marker_pub_.publish(marker);
    }

    void VisualizationTool::updateVisualPoints(const std::string &points_id,
                                               const std::vector<Eigen::Vector2d> &points,
                                               const std::string &frame_id, const double scale,
                                               const std::string &color)
    {
        visualization_msgs::MarkerArray marker_array;

        for (size_t i = 0; i < points.size(); ++i)
        {
            auto marker = createMarker(frame_id, "points_" + points_id + "_" + std::to_string(i),
                                       visualization_msgs::Marker::SPHERE, getColor(color));

            marker.lifetime = ros::Duration(0.0);
            marker.pose.position.x = points[i].x();
            marker.pose.position.y = points[i].y();
            marker.pose.position.z = 0;
            marker.color.a = 0.20;

            marker.scale.x = scale;
            marker.scale.y = scale;
            marker.scale.z = scale;

            marker_array.markers.push_back(marker);
        }

        marker_arrays_[points_id] = marker_array;
        marker_array_pub_.publish(marker_array);
    }

    void VisualizationTool::updateVisualPath(const std::string &path_id, const int path_idx,
                                             const std::vector<Eigen::Vector2d> &path,
                                             const std::string &frame_id, const double scale,
                                             const std::string &color)
    {
        auto marker = createMarker(frame_id, "path_" + path_id,
                                   visualization_msgs::Marker::LINE_STRIP, getColor(color));
        for (const auto &point : path)
        {
            geometry_msgs::Point p;
            p.x = point.x();
            p.y = point.y();
            p.z = 0.1 + path_idx * 0.04;
            marker.points.push_back(p);
        }

        marker.scale.x = scale;
        markers_[path_id] = marker;
        marker_pub_.publish(marker);
    }
    void VisualizationTool::updateVisualVehiclePath(const std::string &vehicle_path_id,
                                                    const std::vector<Eigen::Vector3d> &poses,
                                                    const std::string &frame_id,
                                                    const std::string &color)
    {
        visualization_msgs::MarkerArray marker_array;

        // Define half dimensions for convenience
        const double half_length = vehicle_length_ / 2.0;
        const double half_width = vehicle_width_ / 2.0;

        // Define corners relative to vehicle center (x forward, y left)
        Eigen::Vector2d corners[4];
        corners[0] = {half_length, half_width};   // Front-left
        corners[1] = {half_length, -half_width};  // Front-right
        corners[2] = {-half_length, -half_width}; // Rear-right
        corners[3] = {-half_length, half_width};  // Rear-left

        for (size_t i = 0; i < poses.size(); ++i)
        { // Iterate through all poses, not skipping any
            auto marker =
                createMarker(frame_id, "vehicle_path_" + vehicle_path_id + "_" + std::to_string(i),
                             visualization_msgs::Marker::LINE_LIST,
                             getColor(color)); // Change type to LINE_LIST

            marker.lifetime = ros::Duration(0.0);
            marker.points.clear(); // Clear previous points if any

            // Vehicle pose
            const double x = poses[i].x();
            const double y = poses[i].y();
            const double theta = poses[i].z();
            const double cos_theta = std::cos(theta);
            const double sin_theta = std::sin(theta);

            // Calculate world coordinates for corners
            geometry_msgs::Point world_corners[4];
            for (int j = 0; j < 4; ++j)
            {
                world_corners[j].x = x + corners[j].x() * cos_theta - corners[j].y() * sin_theta;
                world_corners[j].y = y + corners[j].x() * sin_theta + corners[j].y() * cos_theta;
                world_corners[j].z = 0.0; // Keep the rectangle on the ground plane
            }

            // Add line segments for the rectangle border
            marker.points.push_back(world_corners[0]);
            marker.points.push_back(world_corners[1]); // FL -> FR
            marker.points.push_back(world_corners[1]);
            marker.points.push_back(world_corners[2]); // FR -> RR
            marker.points.push_back(world_corners[2]);
            marker.points.push_back(world_corners[3]); // RR -> RL
            marker.points.push_back(world_corners[3]);
            marker.points.push_back(world_corners[0]); // RL -> FL

            // No need to set orientation, as rotation is applied to points
            // marker.pose.position.x = x; // Position is implicitly defined by the points
            // marker.pose.position.y = y;
            // marker.pose.position.z = 0;

            // Set line width
            marker.scale.x = 0.02; // Line width
            // marker.scale.y = 0; // Not used for LINE_LIST
            // marker.scale.z = 0; // Not used for LINE_LIST

            marker_array.markers.push_back(marker);
        }

        marker_arrays_[vehicle_path_id] = marker_array;
        marker_array_pub_.publish(marker_array);
    }

    void VisualizationTool::deleteObject(const std::string &id)
    {
        // 删除单个marker
        if (markers_.find(id) != markers_.end())
        {
            auto marker = markers_[id];
            marker.action = visualization_msgs::Marker::DELETE;
            marker_pub_.publish(marker);
            markers_.erase(id);
        }

        // 删除marker数组
        if (marker_arrays_.find(id) != marker_arrays_.end())
        {
            auto marker_array = marker_arrays_[id];
            for (auto &marker : marker_array.markers)
            {
                marker.action = visualization_msgs::Marker::DELETE;
            }
            marker_array_pub_.publish(marker_array);
            marker_arrays_.erase(id);
        }
    }

    void VisualizationTool::clearAll()
    {
        // 清除所有markers
        for (const auto &pair : markers_)
        {
            auto marker = pair.second;
            marker.action = visualization_msgs::Marker::DELETE;
            marker_pub_.publish(marker);
        }
        markers_.clear();

        // 清除所有marker arrays
        for (const auto &pair : marker_arrays_)
        {
            auto marker_array = pair.second;
            for (auto &marker : marker_array.markers)
            {
                marker.action = visualization_msgs::Marker::DELETE;
            }
            marker_array_pub_.publish(marker_array);
        }
        marker_arrays_.clear();
    }

    void VisualizationTool::visualizeCorridorBox(
        const std::string &id, const std::vector<Eigen::Vector2d> &box_corner_points,
        const std::string &frame_id, const std::string &color)
    {
        // 绘制线段
        auto line_marker =
            createMarker(frame_id, "box", visualization_msgs::Marker::LINE_LIST, getColor(color));
        line_marker.lifetime = ros::Duration(0.00);
        line_marker.id = std::hash<std::string>{}(id);
        line_marker.scale.x = 0.06; // 线宽
        line_marker.scale.y = 0.06; // 线宽
        line_marker.color.a = 0.75;

        // 添加线段和角点
        for (size_t i = 0; i < box_corner_points.size(); ++i)
        {
            auto point_marker = createMarker(frame_id, "box_point_" + id + std::to_string(i),
                                             visualization_msgs::Marker::SPHERE, getColor("gold"));
            geometry_msgs::Point p1, p2;
            p1.x = box_corner_points[i].x();
            p1.y = box_corner_points[i].y();
            p1.z = 0.0;

            p2.x = box_corner_points[(i + 1) % box_corner_points.size()].x();
            p2.y = box_corner_points[(i + 1) % box_corner_points.size()].y();
            p2.z = 0.0;

            point_marker.lifetime = ros::Duration(0.0);
            point_marker.pose.position.x = p1.x;
            point_marker.pose.position.y = p1.y;
            point_marker.pose.position.z = 0;
            point_marker.scale.x = 0.08;
            point_marker.scale.y = 0.08;
            point_marker.scale.z = 0.08;

            line_marker.points.push_back(p1);
            line_marker.points.push_back(p2);
            // point_marker.points.push_back(p1);
            markers_[id + std::to_string(i)] = point_marker;
            marker_pub_.publish(point_marker);
        }

        marker_pub_.publish(line_marker);
        // marker_pub_.publish(point_marker);
    }

    void VisualizationTool::visualizeCorridorBoxes(
        const std::string &id, const std::vector<std::vector<Eigen::Vector2d>> &boxes,
        const std::string &frame_id, const std::string &color)
    {
        for (size_t i = 0; i < boxes.size(); ++i)
        {
            // if (i % 3 == 0)
            // if (i == boxes.size() - 11)
            visualizeCorridorBox(id + "_" + std::to_string(i), boxes[i], frame_id, color);
        }
    }

    void VisualizationTool::visualizeObstaclePolygons(
        const std::string &id, const std::vector<geometry_msgs::PolygonStamped> &polygons,
        const std::string &color)
    {
        visualization_msgs::MarkerArray marker_array;

        for (size_t i = 0; i < polygons.size(); ++i)
        {
            // 创建线条标记
            auto line_marker =
                createMarker("map", "obstacle_polygon_" + id + "_" + std::to_string(i),
                             visualization_msgs::Marker::LINE_STRIP, getColor(color));
            line_marker.id = i;
            line_marker.scale.x = 0.10;                // 线宽
            line_marker.lifetime = ros::Duration(0.1); // 持续时间

            // 添加多边形的点
            for (const auto &point : polygons[i].polygon.points)
            {
                geometry_msgs::Point p;
                p.x = point.x;
                p.y = point.y;
                p.z = 0.0;
                line_marker.points.push_back(p);
            }

            // 闭合多边形
            if (!polygons[i].polygon.points.empty())
            {
                geometry_msgs::Point p;
                p.x = polygons[i].polygon.points[0].x;
                p.y = polygons[i].polygon.points[0].y;
                p.z = 0.0;
                line_marker.points.push_back(p);
            }

            marker_array.markers.push_back(line_marker);
        }

        marker_arrays_[id] = marker_array;
        marker_array_pub_.publish(marker_array);
    }

    visualization_msgs::MarkerArray VisualizationTool::buildPathWithBoxMarkers(
        const std::string &path_id,
        const nav_msgs::Path &path,
        const std::string &frame_id,
        const double path_width,
        const std::string &path_color,
        const std::string &box_color,
        int box_mode // 0: no box, 1: flat box, 2: full 3D 3: flat wireframe only
    )
    {
        // visualization_msgs::Marker line_marker =
        //     createMarker(frame_id, "nav_path_" + path_id, visualization_msgs::Marker::LINE_STRIP, getColor(path_color));
        // line_marker.scale.x = path_width;
        // line_marker.color.a = 1.0;

        visualization_msgs::MarkerArray box_array;
        visualization_msgs::MarkerArray arrow_array;

        double v_min = 0.1;
        double v_max = 5.0;

        for (size_t i = 1; i < path.poses.size(); ++i)
        {
            const auto &prev_pose = path.poses[i - 1];
            const auto &curr_pose = path.poses[i];

            const auto &p1 = prev_pose.pose.position;
            const auto &p2 = curr_pose.pose.position;

            double dx = p2.x - p1.x;
            double dy = p2.y - p1.y;
            double dz = p2.z - p1.z;
            double dist = std::sqrt(dx * dx + dy * dy + dz * dz);

            ros::Time t1 = prev_pose.header.stamp;
            ros::Time t2 = curr_pose.header.stamp;
            double dt = (t2 - t1).toSec();
            if (dt <= 1e-3)
                dt = 1e-3; // 防止除零
            double speed = dist / dt;

            // --- 归一化映射 ---
            double t = std::min(1.0, std::max(0.0, (speed - v_min) / (v_max - v_min)));
            // ROS_INFO("dst = %.2f, dt = %.6f, i=%zu, speed=%.2f, t=%.2f", dist, dt, i, speed, t);

            // --- 创建箭头 marker ---
            visualization_msgs::Marker arrow_marker =
                createMarker(frame_id, "arrow_" + path_id + "_" + std::to_string(i),
                             visualization_msgs::Marker::ARROW, getColor("white"));
            arrow_marker.lifetime = ros::Duration(0);
            arrow_marker.id = i;
            arrow_marker.scale.x = path_width * 1.0;
            arrow_marker.scale.y = path_width * 0.4;
            arrow_marker.scale.z = path_width * 0.3;

            // 设置位置为中点
            arrow_marker.pose.position.x = (p1.x + p2.x) / 2.0;
            arrow_marker.pose.position.y = (p1.y + p2.y) / 2.0;
            arrow_marker.pose.position.z = (p1.z + p2.z) / 2.0;

            // 设置朝向
            double yaw = std::atan2(dy, dx);
            tf2::Quaternion q;
            q.setRPY(0, 0, yaw);
            arrow_marker.pose.orientation.x = q.x();
            arrow_marker.pose.orientation.y = q.y();
            arrow_marker.pose.orientation.z = q.z();
            arrow_marker.pose.orientation.w = q.w();

            // --- 渐变色（速度越大越红）---
            t = 0.2;
            arrow_marker.color.r = t;       // 红
            arrow_marker.color.g = 0.2;     // 固定一点点绿
            arrow_marker.color.b = 1.0 - t; // 蓝
            arrow_marker.color.a = 1.0;

            arrow_array.markers.push_back(arrow_marker);
        }

        for (size_t i = 0; i < path.poses.size(); ++i)
        {
            const auto &pose = path.poses[i].pose.position;
            geometry_msgs::Point p;
            p.x = pose.x;
            p.y = pose.y;
            p.z = pose.z;
            // line_marker.points.push_back(p);

            if (box_mode == 0)
                continue;

            double theta = 0.0;
            if (i < path.poses.size() - 1)
            {
                const auto &next_pose = path.poses[i + 1].pose.position;
                theta = std::atan2(next_pose.y - pose.y, next_pose.x - pose.x);
            }
            else if (i > 0)
            {
                const auto &prev_pose = path.poses[i - 1].pose.position;
                theta = std::atan2(pose.y - prev_pose.y, pose.x - prev_pose.x);
            }

            // -------------------------
            // MODE 3: 纯2D矩形线框
            // -------------------------
            if (box_mode == 3)
            {
                visualization_msgs::Marker flat_wire_marker =
                    createMarker(frame_id, "flat_wire_" + path_id + "_" + std::to_string(i),
                                 visualization_msgs::Marker::LINE_STRIP, getColor("white"));
                flat_wire_marker.lifetime = ros::Duration(0);
                flat_wire_marker.id = i + 20000;
                flat_wire_marker.color.a = 1.0;
                flat_wire_marker.scale.x = 0.1;

                const double half_len = vehicle_length_ / 2.0;
                const double half_wid = vehicle_width_ / 2.0;

                Eigen::Matrix2d R;
                R << std::cos(theta), -std::sin(theta),
                    std::sin(theta), std::cos(theta);

                std::vector<Eigen::Vector2d> corners_local = {
                    {+half_len, +half_wid}, {+half_len, -half_wid}, {-half_len, -half_wid}, {-half_len, +half_wid}};

                for (const auto &pt_local : corners_local)
                {
                    Eigen::Vector2d pt_world = R * pt_local + Eigen::Vector2d(pose.x, pose.y);
                    geometry_msgs::Point pt;
                    pt.x = pt_world.x();
                    pt.y = pt_world.y();
                    pt.z = pose.z;
                    flat_wire_marker.points.push_back(pt);
                }
                // 闭合矩形
                flat_wire_marker.points.push_back(flat_wire_marker.points.front());

                box_array.markers.push_back(flat_wire_marker);
                continue; // 跳过后面 CUBE/3D绘制
            }

            // -------------------------
            // MODE 1 & 2: 创建 CUBE
            // -------------------------
            double box_height = (box_mode == 1) ? 0.01 : 0.5;

            visualization_msgs::Marker box_marker =
                createMarker(frame_id, "box_" + path_id + "_" + std::to_string(i),
                             visualization_msgs::Marker::CUBE, getColor(box_color));
            box_marker.id = i;
            box_marker.color.a = 0.4;
            box_marker.scale.x = vehicle_length_;
            box_marker.scale.y = vehicle_width_;
            box_marker.scale.z = box_height;
            box_marker.pose.position.x = pose.x;
            box_marker.pose.position.y = pose.y;
            box_marker.pose.position.z = pose.z + box_height / 2.0;

            tf2::Quaternion q;
            q.setRPY(0, 0, theta);
            box_marker.pose.orientation.x = q.x();
            box_marker.pose.orientation.y = q.y();
            box_marker.pose.orientation.z = q.z();
            box_marker.pose.orientation.w = q.w();

            box_array.markers.push_back(box_marker);

            // -------------------------
            // MODE 2 ONLY: 添加3D线框
            // -------------------------
            if (box_mode == 2)
            {
                visualization_msgs::Marker wire_marker =
                    createMarker(frame_id, "wire_" + path_id + "_" + std::to_string(i),
                                 visualization_msgs::Marker::LINE_LIST, getColor("white"));
                wire_marker.id = i + 10000;
                wire_marker.color.a = 1.0;
                wire_marker.scale.x = 0.03;

                std::vector<Eigen::Vector3d> local_corners = {
                    {+0.5, +0.5, +0.5}, {+0.5, -0.5, +0.5}, {-0.5, -0.5, +0.5}, {-0.5, +0.5, +0.5}, {+0.5, +0.5, -0.5}, {+0.5, -0.5, -0.5}, {-0.5, -0.5, -0.5}, {-0.5, +0.5, -0.5}};

                Eigen::Matrix3d R3 = Eigen::AngleAxisd(theta, Eigen::Vector3d::UnitZ()).toRotationMatrix();
                for (auto &corner : local_corners)
                {
                    corner = corner.cwiseProduct(Eigen::Vector3d(vehicle_length_, vehicle_width_, box_height));
                    corner = R3 * corner;
                    corner += Eigen::Vector3d(pose.x, pose.y, pose.z + box_height / 2.0);
                }

                auto toPoint = [](const Eigen::Vector3d &v)
                {
                    geometry_msgs::Point pt;
                    pt.x = v.x();
                    pt.y = v.y();
                    pt.z = v.z();
                    return pt;
                };

                int edges[12][2] = {
                    {0, 1}, {1, 2}, {2, 3}, {3, 0}, {4, 5}, {5, 6}, {6, 7}, {7, 4}, {0, 4}, {1, 5}, {2, 6}, {3, 7}};

                for (const auto &edge : edges)
                {
                    wire_marker.points.push_back(toPoint(local_corners[edge[0]]));
                    wire_marker.points.push_back(toPoint(local_corners[edge[1]]));
                }

                box_array.markers.push_back(wire_marker);
            }
        }
        visualization_msgs::MarkerArray all_markers;
        all_markers.markers.insert(all_markers.markers.end(),
                                   arrow_array.markers.begin(), arrow_array.markers.end());
        all_markers.markers.insert(all_markers.markers.end(),
                                   box_array.markers.begin(), box_array.markers.end());
        // marker_array_pub_.publish(all_markers);
        // marker_array_pub_.publish(box_array);
        // marker_arrays_[path_id + "_boxes"] = box_array;
        // markers_[path_id + "_line"] = line_marker;
        return all_markers;
    }

    visualization_msgs::MarkerArray VisualizationTool::buildPathWithBoxMarkers(
        const std::string &path_id,
        const std::vector<Eigen::Vector4d> &path_vec,
        const std::string &frame_id,
        const double path_width,
        const std::string &path_color,
        const std::string &box_color,
        int box_mode // 0: no box, 1: flat box, 2: full 3D 3: flat wireframe only
    )
    {
        // visualization_msgs::Marker line_marker =
        //     createMarker(frame_id, "nav_path_" + path_id, visualization_msgs::Marker::LINE_STRIP, getColor(path_color));
        // line_marker.scale.x = path_width;
        // line_marker.color.a = 1.0;

        visualization_msgs::MarkerArray box_array;
        visualization_msgs::MarkerArray arrow_array;

        double v_min = 0.1;
        double v_max = 5.0;
        double last_yaw = 0.0;

        for (size_t i = 1; i < path_vec.size(); ++i)
        {
            const auto &p1 = path_vec[i - 1];
            const auto &p2 = path_vec[i];

            double dx = p2.x() - p1.x();
            double dy = p2.y() - p1.y();
            double dz = p2.z() - p1.z();
            double dist = std::sqrt(dx * dx + dy * dy + dz * dz);

            double dt = 0.1; // 默认时间间隔，或传入参数可配置
            double speed = dist / dt;

            // 归一化映射
            double t = std::min(1.0, std::max(0.0, (speed - v_min) / (v_max - v_min)));

            visualization_msgs::Marker arrow_marker =
                createMarker(frame_id, "arrow_" + path_id + "_" + std::to_string(i),
                             visualization_msgs::Marker::ARROW, getColor("white"));
            arrow_marker.lifetime = ros::Duration(0);
            arrow_marker.id = i;
            arrow_marker.scale.x = path_width * 2.0;
            arrow_marker.scale.y = path_width * 0.6;
            arrow_marker.scale.z = path_width * 0.8;

            arrow_marker.pose.position.x = (p1.x() + p2.x()) / 2.0;
            arrow_marker.pose.position.y = (p1.y() + p2.y()) / 2.0;
            arrow_marker.pose.position.z = (p1.z() + p2.z()) / 2.0;

            double yaw = std::atan2(dy, dx);
            std::cout << "yaw: " << yaw  << std::endl;
            if(last_yaw != 0.0 && std::abs(yaw - last_yaw) > 0.6){
                continue;
            }
            last_yaw = yaw;
            tf2::Quaternion q;
            q.setRPY(0, 0, yaw);
            arrow_marker.pose.orientation.x = q.x();
            arrow_marker.pose.orientation.y = q.y();
            arrow_marker.pose.orientation.z = q.z();
            arrow_marker.pose.orientation.w = q.w();

            t = 0.2;
            arrow_marker.color.r = t;
            arrow_marker.color.g = 0.2;
            arrow_marker.color.b = 1.0 - t;
            arrow_marker.color.a = 1.0;

            arrow_array.markers.push_back(arrow_marker);
        }

        double last_theta = 0.0;
        for (size_t i = 0; i < path_vec.size(); ++i)
        {
            const auto &pose = path_vec[i];
            geometry_msgs::Point p;
            p.x = pose.x();
            p.y = pose.y();
            p.z = pose.z();

            if (box_mode == 0)
                continue;

            double theta = 0.0;
            if (i < path_vec.size() - 1)
            {
                const auto &next_pose = path_vec[i + 1];
                theta = std::atan2(next_pose.y() - pose.y(), next_pose.x() - pose.x());
            }
            else if (i > 0)
            {
                const auto &prev_pose = path_vec[i - 1];
                theta = std::atan2(pose.y() - prev_pose.y(), pose.x() - prev_pose.x());
            }
            if(last_theta != 0.0 && std::abs(theta - last_theta) > 0.6){
                continue;
            }
            last_theta = theta;

            // -------------------------
            // MODE 3: 纯2D矩形线框
            // -------------------------
            if (box_mode == 3)
            {
                visualization_msgs::Marker flat_wire_marker =
                    createMarker(frame_id, "flat_wire_" + path_id + "_" + std::to_string(i),
                                 visualization_msgs::Marker::LINE_STRIP, getColor("white"));
                flat_wire_marker.lifetime = ros::Duration(0);
                flat_wire_marker.id = i + 20000;
                flat_wire_marker.color.a = 1.0;
                flat_wire_marker.scale.x = 0.1;

                const double half_len = vehicle_length_ / 2.0;
                const double half_wid = vehicle_width_ / 2.0;

                Eigen::Matrix2d R;
                R << std::cos(theta), -std::sin(theta),
                    std::sin(theta), std::cos(theta);

                std::vector<Eigen::Vector2d> corners_local = {
                    {+half_len, +half_wid}, {+half_len, -half_wid}, {-half_len, -half_wid}, {-half_len, +half_wid}};

                for (const auto &pt_local : corners_local)
                {
                    Eigen::Vector2d pt_world = R * pt_local + Eigen::Vector2d(pose.x(), pose.y());
                    geometry_msgs::Point pt;
                    pt.x = pt_world.x();
                    pt.y = pt_world.y();
                    pt.z = pose.z();
                    flat_wire_marker.points.push_back(pt);
                }
                // 闭合矩形
                flat_wire_marker.points.push_back(flat_wire_marker.points.front());

                box_array.markers.push_back(flat_wire_marker);
                continue; // 跳过后面 CUBE/3D绘制
            }

            // -------------------------
            // MODE 1 & 2: 创建 CUBE
            // -------------------------
            double box_height = (box_mode == 1) ? 0.01 : 0.5;

            visualization_msgs::Marker box_marker =
                createMarker(frame_id, "box_" + path_id + "_" + std::to_string(i),
                             visualization_msgs::Marker::CUBE, getColor(box_color));
            box_marker.id = i;
            box_marker.color.a = 0.4;
            box_marker.scale.x = vehicle_length_;
            box_marker.scale.y = vehicle_width_;
            box_marker.scale.z = box_height;
            box_marker.pose.position.x = pose.x();
            box_marker.pose.position.y = pose.y();
            box_marker.pose.position.z = pose.z() + box_height / 2.0;

            tf2::Quaternion q;
            q.setRPY(0, 0, theta);
            box_marker.pose.orientation.x = q.x();
            box_marker.pose.orientation.y = q.y();
            box_marker.pose.orientation.z = q.z();
            box_marker.pose.orientation.w = q.w();

            box_array.markers.push_back(box_marker);

            // -------------------------
            // MODE 2 ONLY: 添加3D线框
            // -------------------------
            if (box_mode == 2)
            {
                visualization_msgs::Marker wire_marker =
                    createMarker(frame_id, "wire_" + path_id + "_" + std::to_string(i),
                                 visualization_msgs::Marker::LINE_LIST, getColor("white"));
                wire_marker.id = i + 10000;
                wire_marker.color.a = 1.0;
                wire_marker.scale.x = 0.03;

                std::vector<Eigen::Vector3d> local_corners = {
                    {+0.5, +0.5, +0.5}, {+0.5, -0.5, +0.5}, {-0.5, -0.5, +0.5}, {-0.5, +0.5, +0.5}, {+0.5, +0.5, -0.5}, {+0.5, -0.5, -0.5}, {-0.5, -0.5, -0.5}, {-0.5, +0.5, -0.5}};

                Eigen::Matrix3d R3 = Eigen::AngleAxisd(theta, Eigen::Vector3d::UnitZ()).toRotationMatrix();
                for (auto &corner : local_corners)
                {
                    corner = corner.cwiseProduct(Eigen::Vector3d(vehicle_length_, vehicle_width_, box_height));
                    corner = R3 * corner;
                    corner += Eigen::Vector3d(pose.x(), pose.y(), pose.z() + box_height / 2.0);
                }

                auto toPoint = [](const Eigen::Vector3d &v)
                {
                    geometry_msgs::Point pt;
                    pt.x = v.x();
                    pt.y = v.y();
                    pt.z = v.z();
                    return pt;
                };

                int edges[12][2] = {
                    {0, 1}, {1, 2}, {2, 3}, {3, 0}, {4, 5}, {5, 6}, {6, 7}, {7, 4}, {0, 4}, {1, 5}, {2, 6}, {3, 7}};

                for (const auto &edge : edges)
                {
                    wire_marker.points.push_back(toPoint(local_corners[edge[0]]));
                    wire_marker.points.push_back(toPoint(local_corners[edge[1]]));
                }

                box_array.markers.push_back(wire_marker);
            }
        }
        visualization_msgs::MarkerArray all_markers;
        all_markers.markers.insert(all_markers.markers.end(),
                                   arrow_array.markers.begin(), arrow_array.markers.end());
        all_markers.markers.insert(all_markers.markers.end(),
                                   box_array.markers.begin(), box_array.markers.end());
        // marker_array_pub_.publish(all_markers);
        // marker_array_pub_.publish(box_array);
        // marker_arrays_[path_id + "_boxes"] = box_array;
        // markers_[path_id + "_line"] = line_marker;
        return all_markers;
    }

    void VisualizationTool::publishPathMarkers(
        const visualization_msgs::MarkerArray &marker_array,
        const std::string &topic_name)
    {
        if (custom_publishers_.count(topic_name) == 0)
        {
            custom_publishers_[topic_name] = nh_.advertise<visualization_msgs::MarkerArray>(topic_name, 10, true);
        }
        custom_publishers_[topic_name].publish(marker_array);
    }
} // namespace planner_exe