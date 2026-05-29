# Repo Integration Plan

## Existing repos to enhance

- `jetson-ready-ros2-object-detection`: primary Jetson deployment target.
- `ros2-multi-robot-coordination-demo`: multi-node networking and launch target.
- `visual-slam-evaluation-kitti-euroc`: repeatable evaluation and benchmarking target.
- `uav-building-footprint-extraction`: downstream imagery processing target.

## New repos

- `robotics-edge-infra-lab`: infrastructure, Jenkins, Ansible, Jetson provisioning.
- `dji-ros2-aerial-mapping-pipeline`: DJI imagery intake, mission metadata, GeoJSON export, ROS 2 mapping handoff.

## Guiding rule

Infrastructure belongs here unless a project truly needs its own deployment logic.