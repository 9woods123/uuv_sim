

# UUV Simulation Setup Guide

This README provides step-by-step instructions to clone, install, and build the `uuv_sim` repository along with its dependencies.

---

## 1. Install Core Dependencies

On Ubuntu, run:

```bash
sudo apt-get update && sudo apt-get install -y \
   nvidia-cuda-toolkit \
   python3-vcstool \
   python3-catkin-tools
```

> Note: If your system does not require GPU support, you can omit `nvidia-cuda-toolkit`.

---

## 2. Create a Workspace and Import the Repository

It is recommended to create a dedicated ROS workspace:

```bash
mkdir -p ~/uuv_sim_ws/src
cd ~/uuv_sim_ws/src
git clone https://github.com/9woods123/uuv_sim.git
```

---

## 3. Build the Workspace

```bash
cd ~/uuv_sim_ws
catkin_make
```

After a successful build, source the workspace:

```bash
source devel/setup.bash
```

---

## 4. Example Usage

You can find an online motion planning project at [online_motion_planner](https://github.com/9woods123/online_motion_planner).
This project uses `uuv_sim` to simulate a torpedo-shaped AUV (ECA_9).


