cmake_minimum_required(VERSION 3.0.2)
project(pathplan)

find_package(catkin REQUIRED)


find_package(catkin REQUIRED COMPONENTS
  roscpp
  std_msgs
  # serial
  message_generation
  # dynamic_reconfigure
  tf
  # rospy
  common
  help_tool
)

## Generate messages in the 'msg' folder
# add_message_files(
#   FILES
#   PointArray.msg
# )


generate_messages(
	DEPENDENCIES
	std_msgs 
	geometry_msgs # Or other packages containing msgs
  )



catkin_package(
#  INCLUDE_DIRS include
#  LIBRARIES imu
   CATKIN_DEPENDS roscpp std_msgs message_runtime
#  DEPENDS system_lib
)


include_directories(
  include ${catkin_INCLUDE_DIRS}
# include
# ${catkin_INCLUDE_DIRS}
)



add_executable(globalpathplan src/globalpathplan.cpp)
add_dependencies(globalpathplan ${${PROJECT_NAME}_EXPORTED_TARGETS} ${catkin_EXPORTED_TARGETS})
target_link_libraries(globalpathplan  kml_test
${catkin_LIBRARIES})

add_executable(localpathplan src/localpathplan.cpp)
add_dependencies(localpathplan ${${PROJECT_NAME}_EXPORTED_TARGETS} ${catkin_EXPORTED_TARGETS})
target_link_libraries(localpathplan ${catkin_LIBRARIES})


# add_executable(Interpolation_core
#  src/Interpolation_core.cpp src/Interpolation.cpp
# )
# # add_dependencies(Interpolation_core ugv_bit_gencpp ${${PROJECT_NAME}_EXPORTED_TARGETS} ${catkin_EXPORTED_TARGETS})
# add_dependencies(Interpolation_core  ${${PROJECT_NAME}_EXPORTED_TARGETS} ${catkin_EXPORTED_TARGETS})

# target_link_libraries(Interpolation_core
#  ${catkin_LIBRARIES}
# )