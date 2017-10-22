#!/bin/bash

while true; do
	read -p "Do you want to start v4l2loopback? (y/n) " yn
	case $yn in
        	[Yy]* ) echo "Starting v4l2loopback..."; sudo modprobe v4l2loopback exclusive_caps=0; break;;
	        [Nn]* ) break;;
		* ) echo "Please answer yes or no.";;
	esac
done

echo "Checking for camera..."
gphoto2 -a

if [ $? -eq 0 ]
then
	echo "Starting gphoto2..."
	echo "Capturing footage and converting it..."

	gphoto2 --stdout --capture-movie | gst-launch-1.0 videotestsrc ! v4l2sink device=/dev/video0
	#gphoto2 --stdout --capture-movie | gst-launch-1.0 fdsrc ! decodebin3 name=dec ! queue ! videoconvert ! v4l2sink device=/dev/video0 
else
	echo "No camera found..."
fi
