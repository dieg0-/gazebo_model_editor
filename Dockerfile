# Ubuntu 20.04 is compatible with Gazebo 11 (Classic)
FROM ubuntu:20.04

# Avoid interactive prompts and selects defaults during pkg installation
ENV DEBIAN_FRONTEND=noninteractive

# Install updates and packages needed
#
#  Packages used
#     software-properties-common --> PPAs
#     git curl wget ---------------> Downloading tools
#     build-essential -------------> Compiling tools, e.g. g++
#     cmake                            
#     x11-apps --------------------> GUI forwarding
#     mesa-utils ------------------> Required by OpenGL
#     libgl1-mesa-glx -------------> Required by OpenGL
#     libx11-dev ------------------> Required by x11
#     libxext-dev -----------------> Required by x11
#     libxt-dev -------------------> Required by Gazebo GUI
#     libxmu-dev ------------------> Utilities for Gazebo GUI
#     libgl1-mesa-dev -------------> Required by OpenGL
#     libglu1-mesa-dev ------------> Required by OpenGL
#     libglew-dev -----------------> Required by OpenGL
#     libgtk2.0-dev ---------------> Required by OpenGL
#     libboost-all-dev ------------> Gazebo relies on Boost
RUN apt update && apt install -y \
    software-properties-common \      
    git curl wget \                  
    build-essential \               
    cmake \                           
    x11-apps \
    mesa-utils \
    libgl1-mesa-glx \
    libx11-dev \
    libxext-dev \
    libxt-dev \
    libxmu-dev \
    libgl1-mesa-dev \
    libglu1-mesa-dev \
    libglew-dev \
    libgtk2.0-dev \
    libboost-all-dev

# Install Gazebo 11 (It still has a Model Editor)
RUN sh -c 'echo "deb http://packages.osrfoundation.org/gazebo/ubuntu-stable focal main" > /etc/apt/sources.list.d/gazebo-stable.list' && \
    wget https://packages.osrfoundation.org/gazebo.key -O - | apt-key add - && \
    apt update && apt install -y gazebo11

# Create default workspace
RUN mkdir -p /root/.gazebo/models

CMD ["/bin/bash"]
