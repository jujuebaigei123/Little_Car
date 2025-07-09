#pragma once

#include <ros/package.h>
#include <ros/ros.h>
#include <Eigen/Core>
#include <fstream>
#include <iostream>
#include <map>
#include <memory>
#include <sstream>
#include <string>
#include <vector>
namespace planner_exe {
    // 日志级别枚举
    enum class LogLevel { INFO1, WARNING1, ERROR1 };

    // 将全局变量移到类内部作为静态成员
    class LogManager {
    public:
        static const std::string directory_path;
        static const bool console_output_enabled;

        // 获取单例实例
        static LogManager* GetInstance();

        // 删除拷贝构造和赋值操作
        LogManager(const LogManager&) = delete;
        LogManager& operator=(const LogManager&) = delete;

        // 初始化日志文件，base_path为日志文件的基础路径
        void Init();

        // 日志输出接口 - 基础字符串版本
        void Log(const std::string& message, LogLevel level = LogLevel::INFO1);
        void Warning(const std::string& message);
        void Error(const std::string& message);

        // 模板版本的日志输出接口
        template <typename T>
        void Log(const T& message, LogLevel level = LogLevel::INFO1) {
            std::stringstream ss;
            ss << message;
            Log(ss.str(), level);
        }

        template <typename T>
        void Warning(const T& message) {
            Log(message, LogLevel::WARNING1);
        }

        template <typename T>
        void Error(const T& message) {
            Log(message, LogLevel::ERROR1);
        }

        // 支持链式调用的日志流
        class LogStream {
        public:
            LogStream(LogManager* manager, LogLevel level) : manager_(manager), level_(level) {}
            LogStream(LogStream&& other) noexcept
                : manager_(other.manager_),
                  level_(other.level_),
                  stream_(std::move(other.stream_)) {}
            ~LogStream() { manager_->Log(stream_.str(), level_); }

            template <typename T>
            LogStream& operator<<(const T& value) {
                stream_ << value;
                return *this;
            }

        private:
            LogManager* manager_;
            LogLevel level_;
            std::stringstream stream_;
        };

        LogStream operator()() { return LogStream(this, LogLevel::INFO1); }
        LogStream operator()(LogLevel level) { return LogStream(this, level); }

        void SavePathToFile(const std::vector<Eigen::Vector2d>& path_points,
                            const std::string& filename);
        void SaveStatePathToFile(const std::vector<Eigen::Vector4d>& path_state_points,
                                 const std::string& filename);
        void SaveControlPathToFile(const std::vector<Eigen::Vector2d>& path_control_points,
                                   const std::string& filename);

        void SaveCostVectorToFile(
            const std::vector<std::pair<double, std::vector<double>>>& cost_pair_vector,
            const std::string& filename);

    private:
        LogManager() = default;
        ~LogManager();

        // 获取当前时间字符串
        std::string GetCurrentTimeStr();
        // 获取日志级别字符串
        std::string GetLevelStr(LogLevel level);
        std::string GetLogFileName(LogLevel level);

        static LogManager* instance_;
        std::map<LogLevel, std::ofstream> log_files_;
        bool is_initialized_ = false;
        std::string base_path_;
    };

    // 在头文件中声明静态成员
    inline const std::string LogManager::directory_path = ros::package::getPath("planner") + "/log";
    inline const bool LogManager::console_output_enabled = true;

#define LOG LogManager::GetInstance()->operator()()
#define WARNING LogManager::GetInstance()->operator()(LogLevel::WARNING1)
#define ERROR LogManager::GetInstance()->operator()(LogLevel::ERROR1)
}  // namespace planner_exe
