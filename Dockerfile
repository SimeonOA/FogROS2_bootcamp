FROM ros:humble
RUN apt-get update && apt-get install -y ros-humble-fogros2 
RUN apt-get update && apt-get install -y python3-pip nano ssh iproute2
RUN  python3 -m pip install -U wgconfig