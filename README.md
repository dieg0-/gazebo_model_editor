# Gazebo Model Editor

Recent versions of Gazebo (Harmonic and higher, compatible with ROS2 Jazzy and higher) do not provide a Model Editor as older Gazebo versions used to. That functionality is now exclusive of [Gazebo (Classic)](https://classic.gazebosim.org/) which is E.O.L.

Nevertheless, this simple package allows running Gazebo (Classic) in a Ubuntu 20.04 - based Docker container. Models produced with Gazebo (Classic) should still be largely compatible with more recent versions of Gazebo.

## Usage

1. ``cd gazebo_model_editor``
2. Build and run the container with: ``./ build_and_run.sh``
3. Gazebo should now be launched with its GUI forwarded.
    - Store your models in **.gazebo/models** which is mounted as a volume.