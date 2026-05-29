# Lab Topology

```text
developer laptop
  |
  | SSH / Ansible / Jenkins agent
  v
Jetson edge node
  |
  | ROS 2 topics
  v
camera, perception container, SLAM or mapping workload
```

Keep device-specific addresses in `inventory/hosts.ini`, which is intentionally ignored by Git.