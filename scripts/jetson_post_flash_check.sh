#!/usr/bin/env bash
set -euo pipefail

echo "== OS =="
lsb_release -a || true

echo "== Jetson release =="
cat /etc/nv_tegra_release || true

echo "== CUDA =="
nvcc --version || true

echo "== Docker =="
docker --version || true

echo "== NVIDIA container runtime =="
docker info 2>/dev/null | grep -i runtime || true

echo "== ROS 2 =="
if [ -f "/opt/ros/${ROS_DISTRO:-humble}/setup.bash" ]; then
  . "/opt/ros/${ROS_DISTRO:-humble}/setup.bash"
  ros2 --help >/dev/null
  echo "ROS 2 ${ROS_DISTRO:-humble} is available"
else
  echo "ROS 2 ${ROS_DISTRO:-humble} setup file not found"
fi