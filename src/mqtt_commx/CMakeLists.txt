cmake_minimum_required(VERSION 3.0.2)
#SET( CMAKE_CXX_FLAGS "-std=c++11 -O3")
# SET(CMAKE_CXX_FLAGS "-std=c++14 ${CMAKE_CXX_FLAGS}")
project(mqtt_commx)

## Compile as C++11, supported in ROS Kinetic and newer
# add_compile_options(-std=c++11)

## Find catkin macros and libraries
## if COMPONENTS list like find_package(catkin REQUIRED COMPONENTS xyz)
## is used, also find other catkin packages
find_package(catkin REQUIRED COMPONENTS
  roscpp
  std_msgs
  nav_msgs
  message_generation
  tf
  rospy
)

# catkin_python_setup()

find_package(Threads REQUIRED)
find_package(Boost REQUIRED COMPONENTS system thread) 

add_message_files(FILES 
cmd_Header.msg
path_point.msg 
iot_path_point.msg
controls.msg

task.msg
cmd_resp.msg

iot_controls.msg
iot_taskpath.msg
iot_tasks.msg

fault_info.msg
fault_info_array.msg
resp_iot.msg
charge_station_notify.msg
network_heartbeat.msg

Point.msg
act_status.msg
iot_act_status.msg
)

generate_messages(DEPENDENCIES std_msgs)

catkin_package(
  INCLUDE_DIRS
#  LIBRARIES sensors
  CATKIN_DEPENDS roscpp std_msgs message_runtime common
#  DEPENDS system_lib
)

add_custom_target(MAKE_PY_EXECUTABLE ALL
  COMMAND chmod a+x ${CMAKE_CURRENT_SOURCE_DIR}/src/*.py
)

include_directories(
 ${catkin_INCLUDE_DIRS}
)


# add_executable(iot_comm src/iot_comm.cpp)
# add_dependencies(iot_comm ${${PROJECT_NAME}_EXPORTED_TARGETS} ${catkin_EXPORTED_TARGETS})
# target_link_libraries(iot_comm ${catkin_LIBRARIES})

# add_executable(all_agv_check src/all_agv_check.cpp)
# add_dependencies(all_agv_check ${${PROJECT_NAME}_EXPORTED_TARGETS} ${catkin_EXPORTED_TARGETS})
# target_link_libraries(all_agv_check ${catkin_LIBRARIES} ${Boost_LIBRARIES})


#############
## Install ##
#############

# Mark executables for installation
# See http://docs.ros.org/melodic/api/catkin/html/howto/format1/building_executables.html
# install(TARGETS iot_comm all_agv_check RUNTIME DESTINATION ${CATKIN_PACKAGE_BIN_DESTINATION})
# install(FILES launch/run_iot.launch launch/test.launch DESTINATION ${CATKIN_PACKAGE_SHARE_DESTINATION}/launch)
# catkin_install_python(PROGRAMS src/agv_ros_sync.py src/bit_test.py DESTINATION ${CATKIN_PACKAGE_BIN_DESTINATION})


