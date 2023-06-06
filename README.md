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

## Run an Experiment

In order to launch a auv, firstly launch a gazebo world:

```
roslaunch uuv_gazebo_worlds ocean_waves.launch 
```

```
 roslaunch eca9_a9_gazebo eca9_a9_upload.launch
```
![2023-05-11 16-51-14 的屏幕截图](https://github.com/9woods123/uuv_sim/assets/78521063/e634767f-d5ca-432e-abdb-6521d450fa0d)

if you want to set the equiped attitude of multi-beam sonar, see the file`eca_a9_sensors_woods.xacro `

and change the params in:
```
  <xacro:include filename="$(find nps_uw_multibeam_sonar)/urdf/woods_multibeam.xacro"/>
    <xacro:blueview_sonar sensor_name="/sonar" parent_link="${namespace}/base_link" rate="30">
       <origin xyz="0.5  0 -0.1" rpy=" 0  0.05 0"/>
      </xacro:blueview_sonar>
```
