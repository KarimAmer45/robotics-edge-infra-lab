# Robotics Portfolio Roadmap

## Keep focused

The existing algorithm repos should stay readable and focused on their core problem. Add tests, screenshots, and small CI hooks where useful, but avoid forcing infrastructure into every repo.

## Integrated repos to lead with

1. `jetson-ready-ros2-object-detection`
   - Existing perception project.
   - Now has Jenkins, Ansible deployment, and Jetson smoke-test docs.

2. `robotics-edge-infra-lab`
   - New infrastructure project.
   - Shows Ansible, Jenkins, Jetson post-flash validation, Docker runtime setup, and deployment patterns.

3. `dji-ros2-aerial-mapping-pipeline`
   - New UAV integration project.
   - Shows DJI imagery intake, geotag sidecars, GeoJSON export, and handoff to mapping/SLAM repos.

## Next build order

1. Commit and push the two new repos.
2. Commit the Jetson repo enhancements.
3. Add screenshots or terminal output from one local Jenkins run.
4. Add one real Jetson benchmark when hardware is available.
5. Add a real DJI sample export when aircraft/controller details are known.