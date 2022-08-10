## PART 2: BASIC TALKER AND LISTENER EXAMPLES IN FOGROS2

6. Create talker.py
```
cd ~/FogROS2_bootcamp/fog_ws/src/fogros_camp/fogros_camp
nano talker.py
```
You can use any text editor of your choice but we use `nano` for the purposes of this workshop.

The `talker.py`  and `listener.py` files are provided in the Part 2 folder in the repository. We will take a look at the files. 


7. Create listener.py
```
cd ~/FogROS2_bootcamp/fog_ws/src/fogros_camp/fogros_camp
nano listener.py
```

8. Edit package.xml (dependencies), setup.py(entry point), setup.cfg
```
cd ~/FogROS2_bootcamp/fog_ws/src/fogros_camp
```

Add `<depend>fogros2</depend>` to `package.xml`. 
```
nano package.xml
```

Add entry points in setup.py.  After line 22, add the following: 

```
"talker = fogros_camp.talker:main",
"listener = fogros_camp.listener:main",
```

Optional: Fill name, email, license and description in `package.xml`.

Optional: Fill name, email, license, desciption in `setup.py`. 
Note that the name name, email, license, desciption in both files must be the same. 

In some cases, you may need to edit the `setup.cfg` but we do not need that for this workshop.


9. Build the workspace again:
```
cd ~/FogROS2_bootcamp/fog_ws
colcon build
```

10. Source the overlay
```
. install/setup.bash
```

At this point, if we wanted, we could run both the talker and listener nodes individually and see the nodes communicating. Instead, we are going to run these nodes using a launch file.

11.  Create a launch folder
```
mkdir -p ~/FogROS2_bootcamp/fog_ws/src/fogros_camp/launch
```

12. Create a local launch file
```
cd ~/FogROS2_bootcamp/fog_ws/src/fogros_camp/launch
nano talker.local.launch.py 
```
The `talker.local.launch.py` file is provided in the Part 2 folder in the repository. We will take a look at it. 


13. Run local launch file.
```
ros2 launch talker.local.launch.py
```
Here you can see both the talker node publishing and the listener node subscribing. 

14. Create a cloud launch file (using FogROS2 and AWS)

Now, we take the same local launch file and run the talker node on a provisioned aws cloud instance. FogROS2 handles the provisioning and setup of the cloud instance for us. 
```
nano talker.aws.launch.py 
```
The `talker.aws.launch.py` file is provided in the Part 2 folder in the repository. We will take a look at the files. 

15. Set environment variables. 
```
cd /
export CYCLONEDDS_URI=file:///opt/ros/humble/share/fogros2/configs/cyclonedds.ubuntu.2204.xml
```

16. Run cloud launch file.
```
cd ~/FogROS2_bootcamp/fog_ws/src/fogros_camp/launch

ros2 launch talker.aws.launch.py
```
This process will take a few minutes, and you'll see a lot of information scroll by as FogROS2 provisions the cloud instance and installs all required 