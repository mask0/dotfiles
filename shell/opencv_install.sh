sudo apt-get -y update
sudo apt-get -y upgrade
sudo apt-get -y autoclean
sudo apt-get -y autoremove

sudo apt-get -y install build-essential cmake git

sudo apt-get -y libgtk2.0-dev libdc1394-22 libdc1394-22-dev libjpeg-dev libpng12-dev libtiff5-dev libjasper-dev libavcodec-dev libavformat-dev libswscale-dev libxine2-dev libgstreamer0.10-dev libgstreamer-plugins-base0.10-dev libv4l-dev libtbb-dev libqt4-dev libfaac-dev libmp3lame-dev libopencore-amrnb-dev libopencore-amrwb-dev libtheora-dev libvorbis-dev libxvidcore-dev

sudo apt-get -y python-dev python-numpy  x264 v4l-utils unzip pkg-config


sudo apt-get purge libopencv*

echo '\033[0;34mcomplete download necesarry package'
echo '\033[0;32mplease download opencv-2.4.13.zip and opencv-3.1.0.zip for Download'

mkdir ~/libs

