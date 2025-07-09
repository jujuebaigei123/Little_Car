#ifndef _TRANSFORM_TOOL_H_
#define _TRANSFORM_TOOL_H_

#include <geometry_msgs/PoseStamped.h>
#include <nav_msgs/Path.h>
#include <ros/ros.h>
#include <tf/tf.h>
#include <tf/transform_datatypes.h>
#include <tf/transform_listener.h>
#include <Eigen/Core>
#include <Eigen/Dense>
#include <Eigen/Sparse>
#include <memory>
#include <mutex>

namespace planner_exe {
    class TransformTool {
    public:
        // 获取单例实例
        static TransformTool& getInstance() {
            static TransformTool instance;
            return instance;
        }
        // 删除拷贝构造和赋值操作
        TransformTool(const TransformTool&) = delete;
        TransformTool& operator=(const TransformTool&) = delete;

        // 公共方法
        void TransformPath(const std::string& source_frame, const std::string& target_frame,
                           const std::vector<Eigen::Vector2d>& in_path,
                           std::vector<Eigen::Vector2d>& out_path);
        void TransformPosition(const std::string& source_frame, const std::string& target_frame,
                               Eigen::Vector2d& in_pos, Eigen::Vector2d& out_pos);
        void TransformPosition(const std::string& source_frame, const std::string& target_frame,
                               Eigen::Vector3d& in_pos, Eigen::Vector3d& out_pos);
        void TransformBox(const std::string& source_frame, const std::string& target_frame,
                          const std::vector<Eigen::Vector2d>& in_box,
                          std::vector<Eigen::Vector2d>& out_box);
        void TrajectoryTransform(const std::string& source_frame, const std::string& target_frame,
                                 std::vector<Eigen::Vector2d>& in_trajectory,
                                 std::vector<Eigen::Vector2d>& out_trajectory);

    private:
        // 私有构造函数
        TransformTool();
        ~TransformTool() = default;

        // TF相关成员
        std::shared_ptr<tf::TransformListener> tf_;

        // 缓存相关
        struct TransformCache {
            tf::StampedTransform transform;
            ros::Time timestamp;
        };
        std::map<std::string, TransformCache> transform_cache_;
        std::mutex cache_mutex_;
        const double TRANSFORM_CACHE_DURATION = 0.1;  // 100ms

        // 私有辅助方法
        bool getTransform(const std::string& source_frame, const std::string& target_frame,
                          tf::StampedTransform& transform);
        std::string getCacheKey(const std::string& source_frame, const std::string& target_frame);
    };
}  // namespace planner_exe

#endif