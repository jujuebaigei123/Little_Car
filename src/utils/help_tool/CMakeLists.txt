cmake_minimum_required(VERSION 3.0.2)
project(help_tool)

set(CMAKE_CXX_STANDARD 20)
########### 添加系统库
find_package(OpenCV REQUIRED)
find_package(catkin REQUIRED COMPONENTS
  cv_bridge
  geometry_msgs
  image_transport
  nav_msgs
  roscpp
  rospy
  std_msgs
  tf
  rviz_visual_tools
)

find_package(cmake_modules REQUIRED)
find_package(Eigen3 REQUIRED)
#find_package(OsqpEigen REQUIRED)

catkin_package(
 INCLUDE_DIRS include
 LIBRARIES help_tool
 CATKIN_DEPENDS cv_bridge geometry_msgs image_transport nav_msgs roscpp rospy std_msgs tf rviz_visual_tools
#  DEPENDS system_lib
)
include_directories(
  include
  ${catkin_INCLUDE_DIRS}
)
include_directories(${Eigen_INCLUDE_DIRS})

add_library(${PROJECT_NAME} src/transform_tool.cc src/visualize_tool.cc src/log_manager.cc)


#target_link_libraries(${PROJECT_NAME} ${catkin_LIBRARIES} ${OpenCV_LIBS} OsqpEigen::OsqpEigen osqp::osqp)