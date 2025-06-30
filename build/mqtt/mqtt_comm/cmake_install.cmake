# Install script for directory: /home/cqy/projects/Little_Car_ws/src/mqtt/mqtt_comm

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/home/cqy/projects/Little_Car_ws/install")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/mqtt_comm/msg" TYPE FILE FILES
    "/home/cqy/projects/Little_Car_ws/src/mqtt/mqtt_comm/msg/path_point_action.msg"
    "/home/cqy/projects/Little_Car_ws/src/mqtt/mqtt_comm/msg/path_point.msg"
    "/home/cqy/projects/Little_Car_ws/src/mqtt/mqtt_comm/msg/mqtt_task.msg"
    "/home/cqy/projects/Little_Car_ws/src/mqtt/mqtt_comm/msg/mqtt_controls.msg"
    "/home/cqy/projects/Little_Car_ws/src/mqtt/mqtt_comm/msg/resp_agvstate.msg"
    "/home/cqy/projects/Little_Car_ws/src/mqtt/mqtt_comm/msg/resp_task.msg"
    "/home/cqy/projects/Little_Car_ws/src/mqtt/mqtt_comm/msg/resp_video.msg"
    "/home/cqy/projects/Little_Car_ws/src/mqtt/mqtt_comm/msg/resp_ctrl.msg"
    "/home/cqy/projects/Little_Car_ws/src/mqtt/mqtt_comm/msg/task.msg"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/mqtt_comm/cmake" TYPE FILE FILES "/home/cqy/projects/Little_Car_ws/build/mqtt/mqtt_comm/catkin_generated/installspace/mqtt_comm-msg-paths.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE DIRECTORY FILES "/home/cqy/projects/Little_Car_ws/devel/include/mqtt_comm")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/roseus/ros" TYPE DIRECTORY FILES "/home/cqy/projects/Little_Car_ws/devel/share/roseus/ros/mqtt_comm")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/common-lisp/ros" TYPE DIRECTORY FILES "/home/cqy/projects/Little_Car_ws/devel/share/common-lisp/ros/mqtt_comm")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gennodejs/ros" TYPE DIRECTORY FILES "/home/cqy/projects/Little_Car_ws/devel/share/gennodejs/ros/mqtt_comm")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  execute_process(COMMAND "/usr/bin/python3" -m compileall "/home/cqy/projects/Little_Car_ws/devel/lib/python3/dist-packages/mqtt_comm")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python3/dist-packages" TYPE DIRECTORY FILES "/home/cqy/projects/Little_Car_ws/devel/lib/python3/dist-packages/mqtt_comm")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/cqy/projects/Little_Car_ws/build/mqtt/mqtt_comm/catkin_generated/installspace/mqtt_comm.pc")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/mqtt_comm/cmake" TYPE FILE FILES "/home/cqy/projects/Little_Car_ws/build/mqtt/mqtt_comm/catkin_generated/installspace/mqtt_comm-msg-extras.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/mqtt_comm/cmake" TYPE FILE FILES
    "/home/cqy/projects/Little_Car_ws/build/mqtt/mqtt_comm/catkin_generated/installspace/mqtt_commConfig.cmake"
    "/home/cqy/projects/Little_Car_ws/build/mqtt/mqtt_comm/catkin_generated/installspace/mqtt_commConfig-version.cmake"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/mqtt_comm" TYPE FILE FILES "/home/cqy/projects/Little_Car_ws/src/mqtt/mqtt_comm/package.xml")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/mqtt_comm/mqtt_comm" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/mqtt_comm/mqtt_comm")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/mqtt_comm/mqtt_comm"
         RPATH "")
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/mqtt_comm" TYPE EXECUTABLE FILES "/home/cqy/projects/Little_Car_ws/devel/lib/mqtt_comm/mqtt_comm")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/mqtt_comm/mqtt_comm" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/mqtt_comm/mqtt_comm")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/mqtt_comm/mqtt_comm"
         OLD_RPATH "/opt/ros/noetic/lib:/home/cqy/projects/Little_Car_ws/devel/lib:"
         NEW_RPATH "")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/mqtt_comm/mqtt_comm")
    endif()
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/mqtt_comm/launch" TYPE FILE FILES "/home/cqy/projects/Little_Car_ws/src/mqtt/mqtt_comm/launch/run_test.launch")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/mqtt_comm/config" TYPE FILE FILES "/home/cqy/projects/Little_Car_ws/src/mqtt/mqtt_comm/config/params.yaml")
endif()

