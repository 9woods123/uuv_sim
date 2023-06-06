# uuv_sim

**uuv_sim** is a package including  eca_a9 equiped with multi-beam sonar


**Prerequisites**

1. If not already done so, install [ROS](http://wiki.ros.org/ROS/Installation) (Desktop-Full is recommended).

2. If not already done so, create a catkin workspace with [catkin tools](https://catkin-tools.readthedocs.io/en/latest/):

```shell script
sudo apt-get install python-catkin-tools
mkdir -p ~/catkin_ws/src
git clone https://github.com/9woods123/uuv_sim.git
cd ~/catkin_ws
catkin_make
```

## Run An Experiment

In order to launch a auv, firstly launch a gazebo world:

```
roslaunch uuv_gazebo_worlds ocean_waves.launch 
```

```
 roslaunch eca9_a9_gazebo eca9_a9_upload.launch
```
![2023-05-11 16-51-14 的屏幕截图](https://github.com/9woods123/uuv_sim/assets/78521063/e634767f-d5ca-432e-abdb-6521d450fa0d)

You can obtain the point cloud information by subscribing to the topic /eca_a9/blueview_m450/point_cloud.

The point cloud can be visualized in RViz:
![2023-06-06 14-26-57 的屏幕截图](https://github.com/9woods123/uuv_sim/assets/78521063/7d74f133-129d-4184-ad6c-eab1d5f28ed5)


## Modify the Sonar 

If you want to adjust the orientation of the multi-beam sonar, you can modify the file eca_a9_sensors_woods.xacro and change the parameters in the following section:
```
  <xacro:include filename="$(find nps_uw_multibeam_sonar)/urdf/woods_multibeam.xacro"/>
    <xacro:blueview_sonar sensor_name="/sonar" parent_link="${namespace}/base_link" rate="30">
       <origin xyz="0.5  0 -0.1" rpy=" 0  0.05 0"/>
      </xacro:blueview_sonar>
```

## Input Contorl Trajectory 

if you wanna give the AUV a target trajectory which  is  calculated by your planning algorithm, and make the  AUV tracking it, a example code 
is given:

```
#include <uuv_control_msgs/Trajectory.h>

ros::Publisher  traj_pub=nh.advertise<uuv_control_msgs::Trajectory>("/eca_a9/input_trajectory", 1, true);

uuv_control_msgs::Trajectory planned_traj;
for(auto traj_point : your_target_traj)
{
     uuv_control_msgs::TrajectoryPoint traj_point;
     traj_point.header.stamp=traj_point.time;
     traj_point.header.frame_id=your_target_traj.frame_id;
     traj_point.pose=traj_point.pose;
     planned_traj.points.push_back(traj_point);
}

traj_pub.publish(planned_traj);
}
```

The AUV control code in uuv_simulator（ https://github.com/9woods123/uuv_sim/uuv_simulator ） is an updated version of the original uuv_simulator(https://github.com/uuvsimulator/uuv_simulator).

I made some modifications to enable the AUV to follow a new trajectory when the previous trajectory is not finished. Therefore, you can use an online planner to command the AUV.


