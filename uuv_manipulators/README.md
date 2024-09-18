# Underwater Manipulators

[![Build Status](https://travis-ci.org/uuvsimulator/uuv_manipulators.svg?branch=master)](https://travis-ci.org/uuvsimulator/uuv_manipulators)

This repository contains the robot description and necessary nodes to simulate underwater 
manipulators integrated to underwater vehicles. This repository is complementary
to the [Unmanned Underwater Vehicle Simulator (UUV Simulator)](https://github.com/uuvsimulator/uuv_simulator),
an open-source project extending the simulation capabilities of the robotics
simulator Gazebo to underwater vehicles and environments. For installation and
usage instructions, please refer to the [documentation pages](https://uuvsimulator.github.io/).

[![SWARMs Manipulation Demonstration](https://img.youtube.com/vi/vKMR8-7WRF4/0.jpg)](https://www.youtube.com/watch?v=vKMR8-7WRF4 "SWARMs - Semi-autonomous manipulation of simulated ROV")

## Purpose of the project

This software is a research prototype, originally developed for the EU ECSEL
Project 662107 [SWARMs](http://swarms.eu/).

The software is not ready for production use. However, the license conditions of the
applicable Open Source licenses allow you to adapt the software to your needs.
Before using it in a safety relevant setting, make sure that the software
fulfills your requirements and adjust it according to any applicable safety
standards (e.g. ISO 26262).

## Requirements

To simulate underwater manipulators, please refer to the [UUV Simulator](https://github.com/uuvsimulator/uuv_simulator)
repository and follow the installation instructions of the package. Then you can clone
this package in the `src` folder of you catkin workspace

```
cd ~/catkin_ws/src
git clone https://github.com/uuvsimulator/uuv_manipulators.git
```

and then build your catkin workspace

```bash
cd ~/catkin_ws
catkin_make # or <catkin build>, if you are using catkin_tools
```

## License

The `uuv_manipulators` package is open-sourced under the Apache-2.0 license. See the
[LICENSE](LICENSE) file for details.
