# FogROS2_bootcamp

## Before bootcamp instructions

Install Docker Desktop (if not already installed).  Select the appropriate link below and follow the instructions.  For Mac and Windows, this amounts to following the download link, and installing the software.

* [Docker for Mac OS](https://docs.docker.com/desktop/install/mac-install/)
* [Docker for Windows](https://docs.docker.com/desktop/install/windows-install/)
* [Docker for Ubuntu](https://docs.docker.com/engine/install/ubuntu/)

## Setup AWS account

Before starting, you have an AWS account.  If you do not have one already, you can [create an AWS account](https://docs.aws.amazon.com/accounts/latest/reference/manage-acct-creating.html).  Note: this will require that you provide a credit card.  However, we will keep within the free-tier usage where possible.  If part of a formal session, you may be provided AWS credits as part of the session.

## Create API credentials

AWS provides [instructions on how to create an API key](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_access-keys.html#Using_CreateAccessKey).  Their best practices recommend using an [IAM account](https://aws.amazon.com/premiumsupport/knowledge-center/create-access-key/) first.  Feel free to follow the best practices.  However, for this bootcamp, if you create the API key for the session, then delete them at the end of the session, you should be okay.

From this process, you will need to obtain (1) an *Access key ID* (e.g., `AKIAIOSFODNN7EXAMPLE`), and (2) a *Secret Access Key* (e.g., `wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY`).  The two parts are similar to a username and password used for accessing a website, but in this case, are for accessing the interface that FogROS2 will use to talk to AWS.

(Note: API = Application Program Interface)

## Configure your AWS credentials



```
aws configure
```
AWS Access Key ID [None]: 

AWS Secret Access Key [None]: 

Default region name [None]: us-west-1

Default output format [None]:

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


## PART 2: BASIC TALKER AND LISTENER EXAMPLES IN FOGROS2

6. Create talker.py
7. Create listener.py

8. Build the workspace again:
```
cd ~/fog_ws
colcon build
```

9. Source the overlay
```
. install/setup.bash
```

10. Run local launch file.
```
cd ~/fog_ws/src/fogros_camp/launch
ros2 launch talker.local.launch.py
```

11. Set environment variables. 
```
cd /
export RMW_IMPLEMENTATION=rmw_cyclonedds_cpp
export CYCLONEDDS_URI=file://$(pwd)/opt/ros/humble/share/fogros2/configs/cyclonedds.ubuntu.$(lsb_release -rs | sed 's/\.//').xml
```

12. Edit package.xml (dependencies), setup.py(entry point), setup.cfg
cd ..
Fill name, email, license and description in package.xml
Add <depend>fogros2</depend> to package.xml

Fill name, email, license in setup.py
Add entry points.


13. Build the workspace again
```
colcon build
```


14. Create a launch folder and launch files : 
```
mkdir -p ~/fog_ws/src/fogros_camp/launch

nano talker.local.launch.py 
nano talker.aws.launch.py
```

15. Build the workspace again.


## PART 3: GQCNN IN FOGROS2
TODO
