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
