FROM ros:humble

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get -y --no-install-recommends install \
    ros-humble-fogros2 python3-pip nano ssh iproute2 \
    gosu sudo wget ca-certificates openssl \
    less bash-completion nano emacs-nox git
    
RUN python3 -m pip install -U wgconfig

ENV RMW_IMPLEMENTATION=rmw_cyclonedds_cpp
# ENV CYCLONEDDS_URI=file:///opt/ros/humble/share/fogros2/configs/cyclonedds.ubuntu.2204.xml

# Enable users in the sudo group to run without password.  This helps
# once logged in as a user using the entry point.
RUN echo "%sudo ALL=(ALL:ALL) NOPASSWD:ALL" > /etc/sudoers.d/90-sudo-group-nopasswd

RUN sed -i '/self\.apt_install(f"ros-{self.ros_distro}-desktop")/ { p ; s/desktop/fogros2/ }' /opt/ros/humble/lib/python3.10/site-packages/fogros2/cloud_instance.py

# Set up the entry point.
COPY ros_entrypoint.sh /ros_entrypoint.sh
RUN chmod a+x /ros_entrypoint.sh
ENTRYPOINT ["/ros_entrypoint.sh"]
CMD ["/bin/bash"]
