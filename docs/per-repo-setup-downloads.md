# Per-Repo Setup Downloads

This file covers every repository folder currently under `D:\Repositories`, one by one. The broader category checklist is in `LOCAL_SETUP_DOWNLOADS.md`; this file is the literal per-repo version.

## Shared Downloads You Will Reuse

Install these once, then use the per-repo sections below.

| Tool | Needed for |
| --- | --- |
| Git for Windows | All repos |
| Python 3.12 plus pip/venv | Python repos |
| Node.js LTS plus npm | Browser/Node repos |
| Docker Desktop with WSL 2 integration | Dockerized repos, Jenkins, Jetson-like builds |
| WSL 2 + Ubuntu 22.04 | ROS 2, Gazebo, Ansible, C++ robotics builds |
| ROS 2 Humble | All ROS 2 repos |
| CMake + C++ compiler | C++ and ament_cmake repos |
| Visual Studio Build Tools | Windows-native C++ and Python packages with native extensions |
| VS Code | Editing and terminal workflow |

Common Windows Python setup inside any Python repo:

```powershell
py -3.12 -m venv .venv
.\.venv\Scripts\Activate.ps1
python -m pip install --upgrade pip setuptools wheel
```

Common WSL ROS 2 setup:

```bash
source /opt/ros/humble/setup.bash
rosdep install --from-paths . --ignore-src -r -y
colcon build --symlink-install
```

---

## 1. `camera-calibration-panorama-stitching`

Download/install:

- Python 3.12
- `numpy`
- `opencv-python`

Run setup:

```powershell
cd D:\Repositories\camera-calibration-panorama-stitching
py -3.12 -m venv .venv
.\.venv\Scripts\Activate.ps1
python -m pip install --upgrade pip setuptools wheel
python -m pip install -r requirements.txt
```

---

## 2. `camera-calibration-pose-demo`

Download/install:

- Python 3.12
- ROS 2 Humble on Ubuntu 22.04/WSL
- Gazebo ROS packages
- Python packages: `numpy`, `opencv-python`, `PyYAML`
- ROS packages: `ament_python`, `cv_bridge`, `geometry_msgs`, `gazebo_ros`, `rclpy`, `robot_state_publisher`, `sensor_msgs`, `xacro`

Windows Python setup:

```powershell
cd D:\Repositories\camera-calibration-pose-demo
py -3.12 -m venv .venv
.\.venv\Scripts\Activate.ps1
python -m pip install --upgrade pip setuptools wheel
python -m pip install -r requirements.txt
```

WSL/ROS setup:

```bash
cd /mnt/d/Repositories/camera-calibration-pose-demo
source /opt/ros/humble/setup.bash
rosdep install --from-paths . --ignore-src -r -y
colcon build --packages-select camera_pose_demo --symlink-install
```

---

## 3. `classical-image-processing-algorithms`

Download/install:

- Python 3.12
- `numpy`
- `opencv-python`
- `matplotlib`

Run setup:

```powershell
cd D:\Repositories\classical-image-processing-algorithms
py -3.12 -m venv .venv
.\.venv\Scripts\Activate.ps1
python -m pip install --upgrade pip setuptools wheel
python -m pip install -r requirements.txt
```

---

## 4. `cpp-grid-path-planner`

Download/install:

- CMake
- C++ compiler: Visual Studio Build Tools on Windows, or `build-essential` on Ubuntu/WSL

Windows build:

```powershell
cd D:\Repositories\cpp-grid-path-planner
cmake -S . -B build
cmake --build build --config Release
```

WSL build:

```bash
cd /mnt/d/Repositories/cpp-grid-path-planner
cmake -S . -B build
cmake --build build
```

---

## 5. `cpp-mobile-robot-kinematics`

Download/install:

- CMake
- C++ compiler: Visual Studio Build Tools on Windows, or `build-essential` on Ubuntu/WSL

Build:

```powershell
cd D:\Repositories\cpp-mobile-robot-kinematics
cmake -S . -B build
cmake --build build --config Release
```

---

## 6. `dji-ros2-aerial-mapping-pipeline`

Download/install:

- Python 3.12
- `pytest`
- Optional ROS 2 Humble if you want to build it as a ROS package
- No live DJI SDK is required for the offline manifest workflow
- Later, for real hardware integration: DJI SDK matching your aircraft/controller path from DJI Developer

Python setup:

```powershell
cd D:\Repositories\dji-ros2-aerial-mapping-pipeline
py -3.12 -m venv .venv
.\.venv\Scripts\Activate.ps1
python -m pip install --upgrade pip setuptools wheel
python -m pip install -e .
python -m pip install -r requirements.txt
```

Optional ROS setup:

```bash
cd /mnt/d/Repositories/dji-ros2-aerial-mapping-pipeline
source /opt/ros/humble/setup.bash
rosdep install --from-paths . --ignore-src -r -y
colcon build --symlink-install
```

---

## 7. `explainable-vision-demo`

Download/install:

- Python 3.10+ or 3.12
- `matplotlib`
- `numpy`
- `pandas`
- `Pillow`
- `scikit-learn`
- `streamlit`
- `torch`
- `torchvision`
- `tqdm`
- Optional dev tools: `pytest`, `ruff`

CPU PyTorch setup:

```powershell
cd D:\Repositories\explainable-vision-demo
py -3.12 -m venv .venv
.\.venv\Scripts\Activate.ps1
python -m pip install --upgrade pip setuptools wheel
python -m pip install torch torchvision --index-url https://download.pytorch.org/whl/cpu
python -m pip install -e .
python -m pip install pytest ruff
```

Use the official PyTorch selector if you want CUDA GPU wheels.

---

## 8. `gnss-denied-visual-inertial-localization`

Download/install:

- Python 3.10+ or 3.12
- `numpy`
- `pillow`
- Docker Desktop, optional
- ROS 2 Humble, optional for the C++ ROS package
- CMake and C++ compiler, optional for the ROS package
- `libeigen3-dev` in WSL for the C++ package
- ROS packages: `ament_cmake`, `geometry_msgs`, `nav_msgs`, `rclcpp`, `sensor_msgs`

Python setup:

```powershell
cd D:\Repositories\gnss-denied-visual-inertial-localization
py -3.12 -m venv .venv
.\.venv\Scripts\Activate.ps1
python -m pip install --upgrade pip setuptools wheel
python -m pip install -e .
```

ROS/C++ setup:

```bash
cd /mnt/d/Repositories/gnss-denied-visual-inertial-localization/ros2
sudo apt install -y libeigen3-dev
source /opt/ros/humble/setup.bash
rosdep install --from-paths . --ignore-src -r -y
colcon build --packages-select gnss_denied_vio_cpp --symlink-install
```

---

## 9. `grid-path-planning-astar`

Download/install:

- Python 3.12
- `matplotlib`
- `numpy`

Setup:

```powershell
cd D:\Repositories\grid-path-planning-astar
py -3.12 -m venv .venv
.\.venv\Scripts\Activate.ps1
python -m pip install --upgrade pip setuptools wheel
python -m pip install -r requirements.txt
```

---

## 10. `hough-mean-shift-segmentation`

Download/install:

- Python 3.12
- `numpy`
- `opencv-python`
- `matplotlib`

Setup:

```powershell
cd D:\Repositories\hough-mean-shift-segmentation
py -3.12 -m venv .venv
.\.venv\Scripts\Activate.ps1
python -m pip install --upgrade pip setuptools wheel
python -m pip install -r requirements.txt
```

---

## 11. `interactive-graph-cut-segmentation`

Download/install:

- Python 3.12
- `numpy`
- `opencv-python`
- `matplotlib`
- `scikit-learn`
- `PyMaxflow`
- Visual Studio Build Tools if `PyMaxflow` needs to compile on Windows

Setup:

```powershell
cd D:\Repositories\interactive-graph-cut-segmentation
py -3.12 -m venv .venv
.\.venv\Scripts\Activate.ps1
python -m pip install --upgrade pip setuptools wheel
python -m pip install -r requirements.txt
```

---

## 12. `jetson-ready-ros2-object-detection`

Download/install:

- ROS 2 Humble on Ubuntu 22.04/WSL
- Docker Desktop
- Python packages: `torch`, `torchvision`, optional `ultralytics`
- ROS packages: `ament_python`, `cv_bridge`, `diagnostic_msgs`, `rclpy`, `sensor_msgs`, `std_msgs`, `vision_msgs`
- Jenkins via Docker, optional for CI
- Ansible in WSL, optional for deployment
- Jetson hardware only: NVIDIA SDK Manager, JetPack/Jetson Linux, CUDA, cuDNN, TensorRT, NVIDIA Container Toolkit, Jetson-compatible PyTorch/TorchVision wheels

ROS setup:

```bash
cd /mnt/d/Repositories/jetson-ready-ros2-object-detection
source /opt/ros/humble/setup.bash
rosdep install --from-paths . --ignore-src -r -y
colcon build --symlink-install
```

Docker setup:

```powershell
cd D:\Repositories\jetson-ready-ros2-object-detection
docker build -t ros2-object-detection:humble .
```

Optional YOLO:

```powershell
python -m pip install ultralytics
```

---

## 13. `kalman-filter-tracking`

Download/install:

- Python 3.12
- `numpy`
- `matplotlib`

Setup:

```powershell
cd D:\Repositories\kalman-filter-tracking
py -3.12 -m venv .venv
.\.venv\Scripts\Activate.ps1
python -m pip install --upgrade pip setuptools wheel
python -m pip install -r requirements.txt
```

---

## 14. `KarimAmer45`

Download/install:

- Git
- Markdown editor or VS Code

This is a profile/README repo. There are no runtime dependencies to download.

---

## 15. `llm_to_ros`

Download/install:

- ROS 2 Humble on Ubuntu 22.04/WSL
- Gazebo Classic ROS packages
- `turtlesim`
- ROS packages: `ament_python`, `rclpy`, `std_msgs`, `geometry_msgs`, `nav_msgs`, `launch`, `launch_ros`, `gazebo_ros`, `gazebo_plugins`, `robot_state_publisher`
- No LLM API key is required for the included mock planner
- Optional later: any LLM SDK/API you choose to integrate behind the planner interface

Setup:

```bash
cd /mnt/d/Repositories/llm_to_ros
source /opt/ros/humble/setup.bash
rosdep install --from-paths . --ignore-src -r -y
colcon build --symlink-install
```

---

## 16. `machining-digital-twin-microservice`

Download/install:

- Python 3.12
- `fastapi`
- `uvicorn[standard]`
- `pydantic`
- Dev/test: `pytest`, `httpx`
- Docker Desktop, optional

Setup:

```powershell
cd D:\Repositories\machining-digital-twin-microservice
py -3.12 -m venv .venv
.\.venv\Scripts\Activate.ps1
python -m pip install --upgrade pip setuptools wheel
python -m pip install -r requirements-dev.txt
```

Docker option:

```powershell
docker build -t machining-digital-twin .
docker run --rm -p 8000:8000 machining-digital-twin
```

---

## 17. `machining-vibration-ml`

Download/install:

- Python 3.12
- `numpy`
- `pandas`
- `scipy`
- `scikit-learn`
- `matplotlib`
- `joblib`
- `fastapi`
- `uvicorn`
- `pydantic`

Setup:

```powershell
cd D:\Repositories\machining-vibration-ml
py -3.12 -m venv .venv
.\.venv\Scripts\Activate.ps1
python -m pip install --upgrade pip setuptools wheel
python -m pip install -r requirements.txt
```

---

## 18. `mdp-value-iteration-planner`

Download/install:

- Python 3.12
- `matplotlib`
- `numpy`

Setup:

```powershell
cd D:\Repositories\mdp-value-iteration-planner
py -3.12 -m venv .venv
.\.venv\Scripts\Activate.ps1
python -m pip install --upgrade pip setuptools wheel
python -m pip install -r requirements.txt
```

---

## 19. `mobile-robotics-bayes-filter`

Download/install:

- Python 3.12
- `numpy`
- `matplotlib`

Setup:

```powershell
cd D:\Repositories\mobile-robotics-bayes-filter
py -3.12 -m venv .venv
.\.venv\Scripts\Activate.ps1
python -m pip install --upgrade pip setuptools wheel
python -m pip install -r requirements.txt
```

---

## 20. `mobile-robotics-ekf-localization`

Download/install:

- Python 3.12
- `numpy`
- `matplotlib`

Setup:

```powershell
cd D:\Repositories\mobile-robotics-ekf-localization
py -3.12 -m venv .venv
.\.venv\Scripts\Activate.ps1
python -m pip install --upgrade pip setuptools wheel
python -m pip install -r requirements.txt
```

---

## 21. `mobile-robotics-fastslam`

Download/install:

- Python 3.12
- `numpy`
- `matplotlib`
- `pillow`

Setup:

```powershell
cd D:\Repositories\mobile-robotics-fastslam
py -3.12 -m venv .venv
.\.venv\Scripts\Activate.ps1
python -m pip install --upgrade pip setuptools wheel
python -m pip install -r requirements.txt
```

---

## 22. `mobile-robotics-landmark-observation-model`

Download/install:

- Python 3.12
- `numpy`
- `matplotlib`

Setup:

```powershell
cd D:\Repositories\mobile-robotics-landmark-observation-model
py -3.12 -m venv .venv
.\.venv\Scripts\Activate.ps1
python -m pip install --upgrade pip setuptools wheel
python -m pip install -r requirements.txt
```

---

## 23. `mobile-robotics-monte-carlo-localization`

Download/install:

- Python 3.12
- `numpy`
- `matplotlib`
- `pillow`
- `ipython`

Setup:

```powershell
cd D:\Repositories\mobile-robotics-monte-carlo-localization
py -3.12 -m venv .venv
.\.venv\Scripts\Activate.ps1
python -m pip install --upgrade pip setuptools wheel
python -m pip install -r requirements.txt
```

---

## 24. `mobile-robotics-occupancy-grid-mapping`

Download/install:

- Python 3.12
- `numpy`
- `matplotlib`

Setup:

```powershell
cd D:\Repositories\mobile-robotics-occupancy-grid-mapping
py -3.12 -m venv .venv
.\.venv\Scripts\Activate.ps1
python -m pip install --upgrade pip setuptools wheel
python -m pip install -r requirements.txt
```

---

## 25. `mobile-robotics-odometry-motion-model`

Download/install:

- Python 3.12
- `numpy`
- `matplotlib`

Setup:

```powershell
cd D:\Repositories\mobile-robotics-odometry-motion-model
py -3.12 -m venv .venv
.\.venv\Scripts\Activate.ps1
python -m pip install --upgrade pip setuptools wheel
python -m pip install -r requirements.txt
```

---

## 26. `mog-people-tracking`

Download/install:

- Python 3.12
- `numpy`
- `opencv-python`
- `scipy`

Setup:

```powershell
cd D:\Repositories\mog-people-tracking
py -3.12 -m venv .venv
.\.venv\Scripts\Activate.ps1
python -m pip install --upgrade pip setuptools wheel
python -m pip install -r requirements.txt
```

---

## 27. `occupancy-grid-astar-visualizer`

Download/install:

- Node.js LTS
- npm
- Optional ROS 2 Humble/Gazebo for `sim/ros2_astar_gazebo`
- Optional ROS packages: `ament_python`, `geometry_msgs`, `launch`, `launch_ros`, `nav_msgs`, `rclpy`

Browser app setup:

```powershell
cd D:\Repositories\occupancy-grid-astar-visualizer
npm install
npm test
npm start
```

Optional ROS/Gazebo setup:

```bash
cd /mnt/d/Repositories/occupancy-grid-astar-visualizer
source /opt/ros/humble/setup.bash
rosdep install --from-paths sim/ros2_astar_gazebo --ignore-src -r -y
colcon build --base-paths sim/ros2_astar_gazebo
```

---

## 28. `robotics-edge-infra-lab`

Download/install:

- WSL 2 + Ubuntu 22.04
- Python 3 in WSL
- `ansible`
- `ansible-lint`
- `yamllint`
- Docker Desktop
- Jenkins via Docker, optional
- Jetson hardware only: NVIDIA SDK Manager, JetPack/Jetson Linux, NVIDIA Container Toolkit

Setup in WSL:

```bash
cd /mnt/d/Repositories/robotics-edge-infra-lab
python3 -m venv .venv
source .venv/bin/activate
python -m pip install --upgrade pip setuptools wheel
python -m pip install -r requirements.txt
```

---

## 29. `ros2-cpp-teleop-safety-node`

Download/install:

- ROS 2 Humble on Ubuntu 22.04/WSL
- CMake
- C++ compiler
- ROS packages: `ament_cmake`, `geometry_msgs`, `rclcpp`, `sensor_msgs`, `std_msgs`, `launch`, `launch_ros`, `ament_lint_auto`, `ament_lint_common`

Setup:

```bash
cd /mnt/d/Repositories/ros2-cpp-teleop-safety-node
source /opt/ros/humble/setup.bash
rosdep install --from-paths . --ignore-src -r -y
colcon build --packages-select ros2_cpp_teleop_safety_node --symlink-install
```

---

## 30. `ros2-multi-robot-coordination-demo`

Download/install:

- ROS 2 Humble on Ubuntu 22.04/WSL
- Gazebo / ros_gz packages
- ROS packages: `ament_python`, `ament_index_python`, `geometry_msgs`, `launch`, `launch_ros`, `nav_msgs`, `python3-yaml`, `rclpy`, `ros_gz_bridge`, `ros_gz_sim`, `rosgraph_msgs`, `std_msgs`, `python3-pytest`

Setup:

```bash
cd /mnt/d/Repositories/ros2-multi-robot-coordination-demo
source /opt/ros/humble/setup.bash
rosdep install --from-paths . --ignore-src -r -y
colcon build --packages-select multi_robot_coordination_demo --symlink-install
```

---

## 31. `statistical-shape-modeling`

Download/install:

- Python 3.12
- `numpy`
- `opencv-python`
- `matplotlib`

Setup:

```powershell
cd D:\Repositories\statistical-shape-modeling
py -3.12 -m venv .venv
.\.venv\Scripts\Activate.ps1
python -m pip install --upgrade pip setuptools wheel
python -m pip install -r requirements.txt
```

---

## 32. `surface-roughness-signal-prediction`

Download/install:

- Python 3.10+ or 3.12
- `numpy`
- `pandas`
- `scipy`
- `scikit-learn`
- `matplotlib`
- `openpyxl`

Setup:

```powershell
cd D:\Repositories\surface-roughness-signal-prediction
py -3.12 -m venv .venv
.\.venv\Scripts\Activate.ps1
python -m pip install --upgrade pip setuptools wheel
python -m pip install -e .
```

---

## 33. `teleoperation-safety-interface`

Download/install:

- Node.js LTS
- npm
- Browser
- Optional Python 3 if you prefer `python -m http.server`
- Optional ROS 2 Humble/Gazebo/rosbridge for simulation bridge mode
- Optional ROS packages: `rclpy`, `std_msgs`, `nav_msgs`, `sensor_msgs`, `rosbridge_server`, `ros_gz_bridge`

Browser setup:

```powershell
cd D:\Repositories\teleoperation-safety-interface
npm install
npm run check
npm start
```

Optional simple server without Node:

```powershell
cd D:\Repositories\teleoperation-safety-interface
python -m http.server 4173
```

---

## 34. `uav-building-footprint-extraction`

Download/install:

- Python 3.12
- `numpy`
- `opencv-python`
- `matplotlib`
- `scikit-image`
- Optional real UAV data/orthomosaic exports for non-demo runs

Setup:

```powershell
cd D:\Repositories\uav-building-footprint-extraction
py -3.12 -m venv .venv
.\.venv\Scripts\Activate.ps1
python -m pip install --upgrade pip setuptools wheel
python -m pip install -r requirements.txt
```

---

## 35. `visual-slam-evaluation-kitti-euroc`

Download/install:

- Python 3.9+ or 3.12
- `numpy`
- `matplotlib`
- `opencv-python-headless`
- Optional dev tools: `pytest`, `ruff`
- Docker Desktop, optional
- Optional datasets: KITTI Odometry, EuRoC MAV

Setup:

```powershell
cd D:\Repositories\visual-slam-evaluation-kitti-euroc
py -3.12 -m venv .venv
.\.venv\Scripts\Activate.ps1
python -m pip install --upgrade pip setuptools wheel
python -m pip install -e .
python -m pip install pytest ruff
```

Docker option:

```powershell
docker build -t slam-eval .
```

---

## One-Shot Package Summary

If you want a single Python package shopping list for the non-ROS Python repos, it is:

```text
ansible ansible-lint fastapi httpx ipython joblib matplotlib numpy opencv-python opencv-python-headless openpyxl pandas Pillow pydantic PyMaxflow PyYAML pytest ruff scikit-image scikit-learn scipy setuptools streamlit torch torchvision tqdm ultralytics uvicorn[standard] wheel yamllint
```

Prefer installing from each repo's own `requirements.txt`, `requirements-dev.txt`, or `pyproject.toml` instead of installing that entire list globally.