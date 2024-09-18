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

echo_and_run cd "/home/woods/uuv/dave_ws/src/uuv_simulator/uuv_control/uuv_trajectory_control"

# ensure that Python install destination exists
echo_and_run mkdir -p "$DESTDIR/usr/local/lib/python2.7/dist-packages"

# Note that PYTHONPATH is pulled from the environment to support installing
# into one location when some dependencies were installed in another
# location, #123.
echo_and_run /usr/bin/env \
    PYTHONPATH="/usr/local/lib/python2.7/dist-packages:/home/woods/uuv/dave_ws/src/uuv_simulator/uuv_control/uuv_trajectory_control/cmake-build-debug/lib/python2.7/dist-packages:$PYTHONPATH" \
    CATKIN_BINARY_DIR="/home/woods/uuv/dave_ws/src/uuv_simulator/uuv_control/uuv_trajectory_control/cmake-build-debug" \
    "/usr/bin/python2" \
    "/home/woods/uuv/dave_ws/src/uuv_simulator/uuv_control/uuv_trajectory_control/setup.py" \
     \
    build --build-base "/home/woods/uuv/dave_ws/src/uuv_simulator/uuv_control/uuv_trajectory_control/cmake-build-debug" \
    install \
    --root="${DESTDIR-/}" \
    --install-layout=deb --prefix="/usr/local" --install-scripts="/usr/local/bin"
