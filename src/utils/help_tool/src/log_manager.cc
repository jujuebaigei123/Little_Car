#include "help_tool/log_manager.h"
#include <Eigen/Core>
#include <chrono>
#include <ctime>
#include <iomanip>
#include <sstream>
#include <vector>
namespace planner_exe {

    LogManager* LogManager::instance_ = nullptr;

    LogManager* LogManager::GetInstance() {
        if (instance_ == nullptr) {
            instance_ = new LogManager();
        }
        return instance_;
    }

    void LogManager::Init() {
        if (!is_initialized_) {
            std::string time_str = GetCurrentTimeStr();

            log_files_[LogLevel::INFO1].open(directory_path + "/LOG/" + time_str + ".LOG",
                                             std::ios::out | std::ios::app);
            log_files_[LogLevel::WARNING1].open(
                directory_path + "/WARNING/" + time_str + ".WARNING",
                std::ios::out | std::ios::app);
            log_files_[LogLevel::ERROR1].open(directory_path + "/ERROR/" + time_str + ".ERROR",
                                              std::ios::out | std::ios::app);
            is_initialized_ = true;
            std::cout << directory_path + "/LOG/" + time_str + ".LOG" << std::endl;
        }
    }

    LogManager::~LogManager() {
        for (auto& file : log_files_) {
            if (file.second.is_open()) {
                file.second.close();
            }
        }
    }

    std::string LogManager::GetCurrentTimeStr() {
        auto now = std::chrono::system_clock::now();
        auto now_c = std::chrono::system_clock::to_time_t(now);
        std::stringstream ss;
        ss << std::put_time(std::localtime(&now_c), "%Y-%m-%d %H:%M:%S");
        return ss.str();
    }

    std::string LogManager::GetLevelStr(LogLevel level) {
        switch (level) {
        case LogLevel::INFO1:
            return "[INFO]";
        case LogLevel::WARNING1:
            return "[WARNING]";
        case LogLevel::ERROR1:
            return "[ERROR]";
        default:
            return "[UNKNOWN]";
        }
    }

    void LogManager::Log(const std::string& message, LogLevel level) {
        std::string level_str = GetLevelStr(level);
        std::string log_message = " " + level_str + " " + message;

        // 根据开关控制终端输出
        if (console_output_enabled) {
            std::cout << log_message << std::endl;
        }

        // 输出到对应级别的日志文件
        if (log_files_[level].is_open()) {
            log_files_[level] << log_message << std::endl;
            log_files_[level].flush();
        }
    }

    void LogManager::Warning(const std::string& message) { Log(message, LogLevel::WARNING1); }

    void LogManager::Error(const std::string& message) { Log(message, LogLevel::ERROR1); }

    void LogManager::SavePathToFile(const std::vector<Eigen::Vector2d>& path_points,
                                    const std::string& filename) {
        std::ofstream path_file(directory_path + "/path/" + filename + ".txt");
        for (const auto& point : path_points) {
            path_file << std::fixed << std::setprecision(8);
            path_file << point(0) << " " << point(1) << "\n";
        }
        path_file.close();
        Log("Path saved successfully");
    }
    void LogManager::SaveStatePathToFile(const std::vector<Eigen::Vector4d>& path_state_points,
                                         const std::string& filename) {
        std::ofstream path_file(directory_path + "/path/" + filename + ".txt");
        for (const auto& point : path_state_points) {
            path_file << std::fixed << std::setprecision(8);
            path_file << point(0) << " " << point(1) << " " << point(2) << " " << point(3) << "\n";
        }
        path_file.close();
        Log("State Path saved successfully");
    }

    void LogManager::SaveControlPathToFile(const std::vector<Eigen::Vector2d>& path_control_points,
                                           const std::string& filename) {
        std::ofstream path_file(directory_path + "/path/" + filename + ".txt");
        for (const auto& point : path_control_points) {
            path_file << std::fixed << std::setprecision(8);
            path_file << point(0) << " " << point(1) << "\n";
        }
        path_file.close();
        Log("Control Path saved successfully");
    }

    void LogManager::SaveCostVectorToFile(
        const std::vector<std::pair<double, std::vector<double>>>& cost_pair_vector,
        const std::string& filename) {
        std::ofstream path_file(directory_path + "/cost/" + filename + ".txt");
        for (const auto& cost_pair : cost_pair_vector) {
            path_file << std::fixed << std::setprecision(8);
            path_file << cost_pair.first << "\n";
            path_file << " ";
            for (const auto& cost : cost_pair.second) {
                path_file << cost << " ";
            }
            path_file << "\n";
        }
        path_file.close();
        Log("Cost Vector saved successfully");
    }

}  // namespace planner_exe