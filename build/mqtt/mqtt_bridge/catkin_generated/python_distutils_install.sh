#!/bin/sh

if [ -n "$DESTDIR" ] ; then
    case $DESTDIR in
        /*) # ok
            ;;
        *)
            /bin/echo "DESTDIR argument must be absolute... "
            /bin/echo "otherwise python's distutils will bork things."
            exit 1
    esac
fi

echo_and_run() { echo "+ $@" ; "$@" ; }

echo_and_run cd "/home/cqy/projects/Little_Car_ws/src/mqtt/mqtt_bridge"

# ensure that Python install destination exists
echo_and_run mkdir -p "$DESTDIR/home/cqy/projects/Little_Car_ws/install/lib/python3/dist-packages"

# Note that PYTHONPATH is pulled from the environment to support installing
# into one location when some dependencies were installed in another
# location, #123.
echo_and_run /usr/bin/env \
    PYTHONPATH="/home/cqy/projects/Little_Car_ws/install/lib/python3/dist-packages:/home/cqy/projects/Little_Car_ws/build/lib/python3/dist-packages:$PYTHONPATH" \
    CATKIN_BINARY_DIR="/home/cqy/projects/Little_Car_ws/build" \
    "/usr/bin/python3" \
    "/home/cqy/projects/Little_Car_ws/src/mqtt/mqtt_bridge/setup.py" \
    egg_info --egg-base /home/cqy/projects/Little_Car_ws/build/mqtt/mqtt_bridge \
    build --build-base "/home/cqy/projects/Little_Car_ws/build/mqtt/mqtt_bridge" \
    install \
    --root="${DESTDIR-/}" \
    --install-layout=deb --prefix="/home/cqy/projects/Little_Car_ws/install" --install-scripts="/home/cqy/projects/Little_Car_ws/install/bin"
