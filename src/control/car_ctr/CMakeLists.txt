cmake_minimum_required(VERSION 3.0.2)
project(car_ctr)


find_package(catkin REQUIRED)

SET(CMAKE_C_COMPILER gcc) 
SET(CMAKE_CXX_COMPILER g++) 
file(GLOB SOURCES "*.cpp") 
INCLUDE_DIRECTORIES(/usr/include) 

find_package(catkin REQUIRED COMPONENTS
  message_generation
  roscpp
  tf
  common
  mqtt_comm
)

add_message_files(FILES
  car_ctr.msg
  car_state.msg
)

## Generate added messages and services with any dependencies listed here
generate_messages(DEPENDENCIES
  std_msgs
)

catkin_package(
  CATKIN_DEPENDS
  message_runtime
#  INCLUDE_DIRS include
#  LIBRARIES car_ctr
#  CATKIN_DEPENDS other_catkin_pkg
#  DEPENDS system_lib
)

include_directories(
  include ${catkin_INCLUDE_DIRS}
)

add_executable(car_ctr src/car_ctr.cpp)
add_dependencies(car_ctr ${${PROJECT_NAME}_EXPORTED_TARGETS} ${catkin_EXPORTED_TARGETS})
target_link_libraries(car_ctr  ${catkin_LIBRARIES})


