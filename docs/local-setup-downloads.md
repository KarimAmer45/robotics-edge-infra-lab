# Local Setup Downloads For All Repositories

This checklist covers the repos under `D:\Repositories`. Use it as the master download/install list before running the projects locally.

## Recommended Local Layout

Use two environments:

1. Windows for pure Python, Node.js, Docker Desktop, Git, VS Code, and quick demos.
2. Ubuntu 22.04 in WSL 2 for ROS 2 Humble, Gazebo, Ansible, C++/CMake robotics builds, and Jetson deployment work.

From WSL, the repos are available at:

```bash
cd /mnt/d/Repositories
```

## 1. Core Windows Downloads

Download these first.

| Download | Why you need it | Official link |
| --- | --- | --- |
| Git for Windows | Repo cloning, commits, branches | https://git-scm.com/download/win |
| Python 3.10+ or 3.12+ | Most computer vision, ML, FastAPI, DJI, SLAM, and robotics scripts | https://www.python.org/downloads/windows/ |
| Node.js LTS | `occupancy-grid-astar-visualizer` and `teleoperation-safety-interface` | https://nodejs.org/en/download/ |
| Docker Desktop for Windows | Dockerized SLAM, Jetson-style container builds, Jenkins container | https://docs.docker.com/desktop/setup/install/windows-install/ |
| Visual Studio Build Tools with C++ workload | Native Windows C++ and Python packages with compiled extensions | https://visualstudio.microsoft.com/downloads/ |
| CMake | C++ projects and CMake-based robotics builds | https://cmake.org/download/ |
| VS Code | Editor, terminal, Python, Docker, ROS, and WSL workflow | https://code.visualstudio.com/download |
| GitHub CLI, optional | Terminal auth, repo creation, PR work | https://cli.github.com/ |

## 2. WSL / Ubuntu Downloads

Install WSL 2 and Ubuntu 22.04 LTS for ROS 2 and Ansible.

Official links:

- WSL install: https://learn.microsoft.com/en-us/windows/wsl/install
- Ubuntu on WSL distributions: https://documentation.ubuntu.com/wsl/en/stable/reference/distributions/
- ROS 2 Humble install docs: https://docs.ros.org/en/humble/Installation.html

Recommended WSL command from Windows PowerShell:

```powershell
wsl --install -d Ubuntu-22.04
```

Inside Ubuntu 22.04:

```bash
sudo apt update
sudo apt install -y \
  build-essential \
  cmake \
  git \
  python3-pip \
  python3-venv \
  python3-dev \
  curl \
  wget \
  lsb-release \
  gnupg \
  software-properties-common
```

## 3. ROS 2 / Gazebo Downloads

Use ROS 2 Humble on Ubuntu 22.04 for the ROS projects.

Install base ROS tooling after following the official ROS 2 Humble repository setup:

```bash
sudo apt install -y \
  ros-humble-desktop \
  python3-colcon-common-extensions \
  python3-rosdep \
  python3-vcstool
```

Initialize rosdep once:

```bash
sudo rosdep init
rosdep update
```

ROS/Gazebo packages used across the repos:

```bash
sudo apt install -y \
  ros-humble-ament-cmake \
  ros-humble-ament-cmake-auto \
  ros-humble-ament-lint-auto \
  ros-humble-ament-lint-common \
  ros-humble-ament-flake8 \
  ros-humble-ament-pep257 \
  ros-humble-cv-bridge \
  ros-humble-diagnostic-msgs \
  ros-humble-gazebo-plugins \
  ros-humble-gazebo-ros \
  ros-humble-geometry-msgs \
  ros-humble-launch \
  ros-humble-launch-ros \
  ros-humble-nav-msgs \
  ros-humble-rclcpp \
  ros-humble-rclpy \
  ros-humble-robot-state-publisher \
  ros-humble-ros-gz \
  ros-humble-ros-gz-bridge \
  ros-humble-ros-gz-sim \
  ros-humble-rosbridge-server \
  ros-humble-rosgraph-msgs \
  ros-humble-sensor-msgs \
  ros-humble-std-msgs \
  ros-humble-turtlesim \
  ros-humble-vision-msgs \
  ros-humble-xacro \
  libeigen3-dev
```

Then, for any ROS workspace, run:

```bash
source /opt/ros/humble/setup.bash
rosdep install --from-paths . --ignore-src -r -y
colcon build --symlink-install
```

Repos covered by ROS 2/Gazebo downloads:

- `camera-calibration-pose-demo`
- `dji-ros2-aerial-mapping-pipeline`
- `gnss-denied-visual-inertial-localization/ros2`
- `jetson-ready-ros2-object-detection`
- `llm_to_ros`
- `occupancy-grid-astar-visualizer/sim/ros2_astar_gazebo`
- `ros2-cpp-teleop-safety-node`
- `ros2-multi-robot-coordination-demo`
- `teleoperation-safety-interface/sim/ros2/tsi_bridge`

## 4. Python Package Downloads

Use one virtual environment per repo. From inside a repo:

```powershell
py -3.12 -m venv .venv
.\.venv\Scripts\Activate.ps1
python -m pip install --upgrade pip setuptools wheel
python -m pip install -r requirements.txt
```

For repos with `pyproject.toml` or `setup.py`, use:

```powershell
python -m pip install -e .
```

For dev/test extras where available:

```powershell
python -m pip install pytest ruff
```

Unique Python packages needed across the repos:

```text
ansible
ansible-lint
fastapi
httpx
ipython
joblib
matplotlib
numpy
opencv-python
opencv-python-headless
openpyxl
pandas
Pillow
pydantic
PyMaxflow
PyYAML
pytest
ruff
scikit-image
scikit-learn
scipy
setuptools
streamlit
torch
torchvision
tqdm
ultralytics
uvicorn[standard]
wheel
yamllint
```

Repos using Python requirements:

- `camera-calibration-panorama-stitching`
- `camera-calibration-pose-demo`
- `classical-image-processing-algorithms`
- `dji-ros2-aerial-mapping-pipeline`
- `explainable-vision-demo`
- `gnss-denied-visual-inertial-localization`
- `grid-path-planning-astar`
- `hough-mean-shift-segmentation`
- `interactive-graph-cut-segmentation`
- `kalman-filter-tracking`
- `machining-digital-twin-microservice`
- `machining-vibration-ml`
- `mdp-value-iteration-planner`
- `mobile-robotics-bayes-filter`
- `mobile-robotics-ekf-localization`
- `mobile-robotics-fastslam`
- `mobile-robotics-landmark-observation-model`
- `mobile-robotics-monte-carlo-localization`
- `mobile-robotics-occupancy-grid-mapping`
- `mobile-robotics-odometry-motion-model`
- `mog-people-tracking`
- `robotics-edge-infra-lab`
- `statistical-shape-modeling`
- `surface-roughness-signal-prediction`
- `uav-building-footprint-extraction`
- `visual-slam-evaluation-kitti-euroc`

## 5. PyTorch / Computer Vision Downloads

For CPU-only local runs:

```powershell
python -m pip install torch torchvision --index-url https://download.pytorch.org/whl/cpu
```

For NVIDIA GPU local runs, use the selector on the official PyTorch page:

- https://pytorch.org/get-started/locally/

Used by:

- `explainable-vision-demo`
- `jetson-ready-ros2-object-detection`

Optional YOLO backend for Jetson object detection:

```powershell
python -m pip install ultralytics
```

## 6. Node.js Downloads

After installing Node.js LTS, run inside each Node repo:

```powershell
npm install
npm start
```

The current Node repos have no third-party npm dependencies, but they still need Node.js to run the local servers and checks.

Repos covered:

- `occupancy-grid-astar-visualizer`
- `teleoperation-safety-interface`

## 7. Docker Downloads

Install Docker Desktop on Windows and enable WSL 2 integration.

Docker images that will download automatically when you build/run the repos:

```text
python:3.11-slim
python:3.12-slim
ros:humble-ros-base-jammy
jenkins/jenkins:lts
```

Repos using Docker:

- `gnss-denied-visual-inertial-localization`
- `jetson-ready-ros2-object-detection`
- `machining-digital-twin-microservice`
- `visual-slam-evaluation-kitti-euroc`
- `robotics-edge-infra-lab` for Jenkins/container deployment workflows

## 8. Jenkins Downloads

Recommended local path: run Jenkins in Docker instead of installing Java/Jenkins directly on Windows.

Official Jenkins download page:

- https://www.jenkins.io/download/

Docker run example:

```powershell
docker pull jenkins/jenkins:lts
docker run --name jenkins-local -p 8080:8080 -p 50000:50000 -v jenkins_home:/var/jenkins_home jenkins/jenkins:lts
```

Repos with Jenkinsfiles:

- `dji-ros2-aerial-mapping-pipeline`
- `jetson-ready-ros2-object-detection`
- `robotics-edge-infra-lab`

## 9. Ansible Downloads

Run Ansible from Ubuntu/WSL, not native Windows PowerShell.

Official Ansible install docs:

- https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html

Inside WSL:

```bash
python3 -m venv ~/.venvs/ansible
source ~/.venvs/ansible/bin/activate
python -m pip install --upgrade pip
python -m pip install ansible ansible-lint yamllint
```

Used by:

- `robotics-edge-infra-lab`
- `jetson-ready-ros2-object-detection/ansible`

## 10. C++ / CMake Downloads

For Windows-native C++:

- Visual Studio Build Tools with Desktop development with C++ workload
- CMake

For ROS 2 C++ in WSL:

```bash
sudo apt install -y build-essential cmake libeigen3-dev
```

Repos covered:

- `cpp-grid-path-planner`
- `cpp-mobile-robot-kinematics`
- `gnss-denied-visual-inertial-localization/ros2/gnss_denied_vio_cpp`
- `ros2-cpp-teleop-safety-node`

## 11. Jetson Downloads

Needed only if you will run the Jetson hardware projects on an NVIDIA Jetson.

Download/check from NVIDIA:

- NVIDIA SDK Manager: https://developer.nvidia.com/sdk-manager
- SDK Manager docs: https://docs.nvidia.com/sdk-manager/
- NVIDIA Container Toolkit install guide: https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/latest/install-guide.html

You will also need, matched to your exact Jetson board and JetPack/L4T version:

```text
JetPack / Jetson Linux image
CUDA
cuDNN
TensorRT
NVIDIA Container Toolkit
Jetson-compatible PyTorch wheel
Jetson-compatible TorchVision wheel
```

Repos covered:

- `jetson-ready-ros2-object-detection`
- `robotics-edge-infra-lab`

Important: do not download random PyTorch Jetson wheels. Match them to the JetPack/L4T version installed on the device.

## 12. DJI Downloads

The current DJI repo runs offline from exported mission metadata, so no live DJI SDK is required for the first local run.

For real drone/controller integration, use DJI Developer downloads that match the aircraft/controller/SDK path:

- DJI Developer products: https://developer.dji.com/products/
- DJI Onboard SDK docs/downloads: https://developer.dji.com/onboard-sdk/
- DJI Payload SDK, Mobile SDK, Windows SDK, or Cloud API as appropriate for your hardware and workflow.

Repos covered:

- `dji-ros2-aerial-mapping-pipeline`
- Downstream: `uav-building-footprint-extraction`
- Downstream: `visual-slam-evaluation-kitti-euroc`

## 13. Data / Dataset Downloads

Most repos include small examples, but these larger datasets are optional for real experiments:

```text
KITTI Odometry dataset
EuRoC MAV dataset
DJI flight image exports / orthomosaics
Jetson camera sample captures
Machining signal datasets
Building footprint validation labels
```

Dataset-oriented repos:

- `visual-slam-evaluation-kitti-euroc`
- `uav-building-footprint-extraction`
- `gnss-denied-visual-inertial-localization`
- `machining-vibration-ml`
- `surface-roughness-signal-prediction`

## 14. Minimal Install Order

Use this order to avoid pain:

1. Git for Windows.
2. Python 3.12.
3. Node.js LTS.
4. VS Code.
5. Docker Desktop with WSL 2 integration.
6. WSL 2 with Ubuntu 22.04.
7. ROS 2 Humble inside Ubuntu.
8. CMake and C++ build tools.
9. Python virtualenvs per repo.
10. Jenkins via Docker.
11. Ansible inside WSL.
12. Jetson SDK Manager only when Jetson hardware is ready.
13. DJI SDK only when aircraft/controller details are known.

## 15. Quick Health Checks

Windows PowerShell:

```powershell
git --version
py --version
node --version
npm --version
docker --version
cmake --version
```

WSL Ubuntu:

```bash
lsb_release -a
python3 --version
source /opt/ros/humble/setup.bash
ros2 --version
colcon --help
ansible --version
```