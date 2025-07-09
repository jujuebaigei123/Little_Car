#include "help_tool/transform_tool.h"
#include <Eigen/src/Core/Matrix.h>

namespace planner_exe {

    TransformTool::TransformTool() {
        // 初始化 TF listener
        tf_ = std::make_shared<tf::TransformListener>();

        // 给TF系统一些时间初始化
        ros::Duration(0.1).sleep();
    }

    bool TransformTool::getTransform(const std::string& source_frame,
                                     const std::string& target_frame,
                                     tf::StampedTransform& transform) {
        std::string cache_key = getCacheKey(source_frame, target_frame);
        // 检查缓存
        auto cache_it = transform_cache_.find(cache_key);
        if (cache_it != transform_cache_.end()) {
            if ((ros::Time::now() - cache_it->second.timestamp).toSec() <
                TRANSFORM_CACHE_DURATION) {
                transform = cache_it->second.transform;
                return true;
            }
        }
        try {
            if (!tf_->waitForTransform(target_frame, source_frame, ros::Time(0),
                                       ros::Duration(0.01))) {
                ROS_WARN_STREAM("Transform not available from " << source_frame << " to "
                                                                << target_frame);
                return false;
            }
            tf_->lookupTransform(target_frame, source_frame, ros::Time(0), transform);

            // 更新缓存
            transform_cache_[cache_key] = {transform, ros::Time::now()};
            return true;
        } catch (tf::TransformException& ex) {
            ROS_WARN_STREAM("Transform failed: " << ex.what());
            return false;
        }
    }

    std::string TransformTool::getCacheKey(const std::string& source_frame,
                                           const std::string& target_frame) {
        return source_frame + "_to_" + target_frame;
    }

    void TransformTool::TransformPosition(const std::string& source_frame,
                                          const std::string& target_frame, Eigen::Vector2d& in_pos,
                                          Eigen::Vector2d& out_pos) {
        geometry_msgs::PoseStamped pose_source;
        geometry_msgs::PoseStamped pose_out;

        pose_source.header.stamp = ros::Time(0);
        pose_source.header.frame_id = source_frame;
        pose_source.pose.position.x = in_pos(0);
        pose_source.pose.position.y = in_pos(1);
        pose_source.pose.position.z = 0;
        pose_source.pose.orientation.w = 1.0;

        tf::StampedTransform transform;
        if (getTransform(source_frame, target_frame, transform)) {
            try {
                tf_->transformPose(target_frame, pose_source, pose_out);
                out_pos(0) = pose_out.pose.position.x;
                out_pos(1) = pose_out.pose.position.y;
            } catch (tf::TransformException& ex) {
                ROS_WARN_STREAM("Transform pose failed: " << ex.what());
            }
        } else {
            ROS_WARN_STREAM("Transform get failed");
        }
    }
    void TransformTool::TransformPosition(const std::string& source_frame,
                                          const std::string& target_frame, Eigen::Vector3d& in_pos,
                                          Eigen::Vector3d& out_pos) {
        geometry_msgs::PoseStamped pose_source;
        geometry_msgs::PoseStamped pose_out;

        pose_source.header.stamp = ros::Time(0);
        pose_source.header.frame_id = source_frame;
        pose_source.pose.position.x = in_pos(0);
        pose_source.pose.position.y = in_pos(1);
        pose_source.pose.position.z = in_pos(2);
        pose_source.pose.orientation.w = 1.0;

        tf::StampedTransform transform;
        if (getTransform(source_frame, target_frame, transform)) {
            try {
                tf_->transformPose(target_frame, pose_source, pose_out);
                out_pos(0) = pose_out.pose.position.x;
                out_pos(1) = pose_out.pose.position.y;
                out_pos(2) = pose_out.pose.position.z;
            } catch (tf::TransformException& ex) {
                ROS_WARN_STREAM("Transform pose failed: " << ex.what());
            }
        } else {
            ROS_WARN_STREAM("Transform get failed");
        }
    }

    void TransformTool::TransformPath(const std::string& source_frame,
                                      const std::string& target_frame,
                                      const std::vector<Eigen::Vector2d>& in_path,
                                      std::vector<Eigen::Vector2d>& out_path) {
        tf::StampedTransform transform;
        if (getTransform(source_frame, target_frame, transform)) {
            out_path.clear();
            for (const auto& path_point : in_path) {
                Eigen::Vector2d out_point;
                geometry_msgs::PoseStamped pose_source;
                geometry_msgs::PoseStamped pose_out;
                pose_source.header.stamp = ros::Time(0);
                pose_source.header.frame_id = source_frame;
                pose_source.pose.position.x = path_point(0);
                pose_source.pose.position.y = path_point(1);
                pose_source.pose.position.z = 0;
                pose_source.pose.orientation.w = 1.0;
                try {
                    tf_->transformPose(target_frame, pose_source, pose_out);
                    out_point(0) = pose_out.pose.position.x;
                    out_point(1) = pose_out.pose.position.y;
                } catch (tf::TransformException& ex) {
                    ROS_WARN_STREAM("Transform pose in path failed: " << ex.what());
                }
                out_path.emplace_back(out_point);
            }
        } else {
            ROS_WARN_STREAM("Transform path get failed");
        }
    }

    void TransformTool::TransformBox(const std::string& source_frame,
                                     const std::string& target_frame,
                                     const std::vector<Eigen::Vector2d>& in_box,
                                     std::vector<Eigen::Vector2d>& out_box) {
        tf::StampedTransform transform;
        if (getTransform(source_frame, target_frame, transform)) {
            out_box.clear();
            for (const auto& box_point : in_box) {
                Eigen::Vector2d out_point;
                geometry_msgs::PoseStamped pose_source;
                geometry_msgs::PoseStamped pose_out;
                pose_source.header.stamp = ros::Time(0);
                pose_source.header.frame_id = source_frame;
                pose_source.pose.position.x = box_point(0);
                pose_source.pose.position.y = box_point(1);
                pose_source.pose.position.z = 0;
                pose_source.pose.orientation.w = 1.0;
                try {
                    tf_->transformPose(target_frame, pose_source, pose_out);
                    out_point(0) = pose_out.pose.position.x;
                    out_point(1) = pose_out.pose.position.y;
                } catch (tf::TransformException& ex) {
                    ROS_WARN_STREAM("Transform pose in box failed: " << ex.what());
                }
                out_box.emplace_back(out_point);
            }
        } else {
            ROS_WARN_STREAM("Transform box get failed");
        }
    }
}  // namespace planner_exe