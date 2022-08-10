## PART 1 : SETUP AND BASIC ROS

1. Clone Github Repository
```
git clone https://github.com/SimeonOA/FogROS2_bootcamp.git
```
2. Build docker image and start the docker container

From the checked out directory, run:

MacOS
```
./docker-build.sh
```

Windows
```
docker-build.cmd
```

This process may take a few minutes, and you'll see a lot of information scroll by.  If there is no error message, move on to the next step.  If there was an error message, it can usually be resolved by waiting a minute and running `./docker-build.sh` again until it works--most common problems are related to internet connections, either on your computer/wifi or on the server from which docker is downloading software.


To test if the docker build worked, try running:

MacOS
```
./docker-run.sh
```

Windows
```
docker-run.cmd
```

You should get the following output similar to the following:
```
$ ./docker-run.sh 
Starting with USER: jeffi, UID: 501, GID: 20
jeffi@docker-desktop:~/FogROS2_bootcamp$ 
```
If you got that, congrats!  Everything is working.  At this point type `CTRL-D` to exit.


If you get:
```
docker: Cannot connect to the Docker daemon at unix:///var/run/docker.sock. Is the docker daemon running?.
```
Then it means you need to start Docker Desktop and wait until the Docker Deskop window shows that it has started.


3. Make a workspace:
```
mkdir -p ./fog_ws/src
cd fog_ws/src
```

4. Create a package
```
ros2 pkg create --build-type ament_python fogros_camp
```

5. Build
```
cd ~/fog_ws
colcon build
```