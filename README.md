# Robotics Edge Infra Lab

Infrastructure lab for provisioning and deploying ROS 2 workloads to edge robotics devices. This repo is intentionally separate from the algorithm demos so Jenkins, Ansible, Jetson flashing notes, Docker runtime setup, and device inventory stay in one clean operations project.

## What this demonstrates

- Ansible inventory and playbooks for Jetson-class edge nodes.
- Post-flash validation after a Jetson is imaged with NVIDIA tooling.
- Docker and NVIDIA runtime setup for ROS 2 workloads.
- Jenkins pipeline stages for linting, Ansible syntax checks, dry runs, and deploy gates.
- A repeatable deployment pattern that can target the existing perception and robotics repos.

## Repository layout

```text
ansible.cfg
inventory/hosts.example.ini
group_vars/
playbooks/
roles/
scripts/
docs/
Jenkinsfile
```

## Quick start

Install the Python tooling on the control machine:

```bash
python -m pip install -r requirements.txt
```

Copy the sample inventory and edit host addresses:

```bash
cp inventory/hosts.example.ini inventory/hosts.ini
ansible all -i inventory/hosts.ini -m ping
```

Run a syntax check:

```bash
ansible-playbook -i inventory/hosts.ini playbooks/bootstrap_jetson.yml --syntax-check
```

Run a dry run before touching a device:

```bash
ansible-playbook -i inventory/hosts.ini playbooks/bootstrap_jetson.yml --check --diff
```

## Target repo integrations

- `jetson-ready-ros2-object-detection`: build and deploy a ROS 2 perception container to a Jetson.
- `ros2-multi-robot-coordination-demo`: provision shared ROS 2 networking and deployment conventions.
- `visual-slam-evaluation-kitti-euroc`: run repeatable evaluation jobs on edge or workstation hardware.
- `uav-building-footprint-extraction`: process UAV imagery outputs from a DJI mapping workflow.

## Safety note

This repo does not flash hardware directly. Flashing remains a hands-on process through NVIDIA SDK Manager or the Jetson Linux initrd flash tools. The runbook captures the steps, checks, and post-flash automation that make the process repeatable.