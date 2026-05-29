# Jetson Flashing Runbook

Use this runbook when preparing a Jetson development kit for ROS 2 perception, SLAM, or UAV edge workloads.

## Before flashing

1. Confirm the Jetson model, carrier board, storage target, and JetPack/L4T target.
2. Back up any files from the device.
3. Record the device serial number, hostname, MAC address, and intended static IP.
4. Prepare the host machine with NVIDIA SDK Manager or the Jetson Linux flashing tools.

## Flashing

Use the official NVIDIA flashing path for the board. Prefer SDK Manager for interactive development kits and initrd flash tooling for repeatable lab images. Keep board-specific commands in a private notes file if they contain serial numbers or lab-only paths.

## First boot checklist

1. Create the operations user.
2. Enable SSH.
3. Apply hostname and network settings.
4. Confirm internet access and package mirrors.
5. Run `scripts/jetson_post_flash_check.sh`.

## Post-flash provisioning

After SSH is available:

```bash
ansible-playbook -i inventory/hosts.ini playbooks/bootstrap_jetson.yml --check --diff
ansible-playbook -i inventory/hosts.ini playbooks/bootstrap_jetson.yml
ansible-playbook -i inventory/hosts.ini playbooks/verify_edge_node.yml
```

## Evidence to save

- JetPack/L4T version.
- CUDA and TensorRT versions.
- Docker runtime output.
- ROS 2 version.
- First perception benchmark result.