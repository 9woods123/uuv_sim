

# UUV Simulation Setup Guide



This README provides step-by-step instructions to clone, install, and build the `uuv_sim` repository along with its dependencies.
I fixed some bugs in [uuv_simulator](https://github.com/uuvsimulator/uuv_simulator), enabling trajectory interaction. Using this, I successfully navigated the ECA_9 AUV to follow my planned trajectory.
Furthermore, I made additional adjustments to the previous `uuv_simulator` to make it compatible with Ubuntu 20.04.


## 1. Install Core Dependencies

On Ubuntu, run:

```bash
sudo apt-get update && sudo apt-get install -y \
   nvidia-cuda-toolkit \
   python3-catkin-tools

pip3 install scipy
```

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


