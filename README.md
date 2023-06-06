# uuv_sim

**uuv_sim** is a package including  eca_a9 equiped with multi-beam sonar


* **voxblox:**

   Using voxblox as map representation and modules specific to voxblox. Dependencies:
    * `voxblox` ([https://github.com/ethz-asl/voxblox](https://github.com/ethz-asl/voxblox))

## Installation
Installation instructions for Linux.

**Prerequisites**

1. If not already done so, install [ROS](http://wiki.ros.org/ROS/Installation) (Desktop-Full is recommended).

2. If not already done so, create a catkin workspace with [catkin tools](https://catkin-tools.readthedocs.io/en/latest/):

```shell script
sudo apt-get install python-catkin-tools
mkdir -p ~/catkin_ws/src
cd ~/catkin_ws
catkin init
catkin config --extend /opt/ros/melodic  # exchange melodic for your ros distro if necessary
catkin config --cmake-args -DCMAKE_BUILD_TYPE=Release
catkin config --merge-devel
```

**Installation**

1. Move to your catkin workspace: 
```shell script
cd ~/catkin_ws/src
```

2. Install system dependencies: 
```shell script
sudo apt-get install python-wstool python-catkin-tools
```

3. Download repo using a SSH key or via HTTPS: 
```shell script
git clone git@github.com:9woods123/mav_unknown_exploration.git # SSH
git clone https://github.com/9woods123/mav_unknown_exploration.git # HTTPS
```

4. Download and install the dependencies of the packages you intend to use.

   * **Full Install:** dependencies of **all** packages can be installed using rosinstall:
   ```shell script
   # system dependencies, replace melodic with your ros distro if necessary:
   sudo apt-get install ros-melodic-cmake-modules ros-melodic-control-toolbox ros-melodic-joy ros-melodic-octomap-ros ros-melodic-mavlink ros-melodic-geographic-msgs autoconf libyaml-cpp-dev protobuf-compiler libgoogle-glog-dev liblapacke-dev libgeographic-dev
   pip install future unrealcv

   # If you already intialized ws tool use 'wstool merge -t'
   wstool init . ./mav_active_3d_planning/mav_active_3d_planning_ssh.rosinstall # SSH
   wstool init . ./mav_active_3d_planning/mav_active_3d_planning_https.rosinstall # HTTPS
   wstool update
   ```
   * **Partial Install:** Install dependencies of the packages you intend to use ([listed above](#Dependencies)) and remove unwanted packages from `mav_active_3d_planning/package.xml` as well as their source folders.

5. Source and compile: 
```shell script
source ../devel/setup.bash
catkin build mav_active_3d_planning # Builds this package only
catkin build # Builds entire workspace, recommended for full install.
```

## Run an Experiment
In order to record data of the example planner, run 
```
roslaunch active_3d_planning_app_reconstruction example_gazebo.launch
```
and run 
```
rosservice call /planner/planner_node/toggle_running 1
```
after mav turning to hovering to start the exploration.
