#! /usr/bin/env bash

## ----------------------------------------------------------------------------
## file    : 01-install-dependency.sh
## brief   : install packages dependency with OpenCV.
## module  : install-opencv
##
## author  : Teppei Kobayashi <reinstantiation@gmail.com>
## date    : 2016/11/14
## ----------------------------------------------------------------------------


# script configuration
set -ue
export LANG=C


# main processing
echo -e "\033[1;33m[Start] installing dependency packages.\033[0;39m"
echo ""

sudo apt-get update
sudo apt-get upgrade -y

sudo apt-get install -y build-essential cmake git pkg-config            # 1.1 install develop environment to build OpenCV
sudo apt-get install -y libgtk2.0-dev libopencv-dev                     # 1.2 install basic library
sudo apt-get install -y libavcodec-dev libavformat-dev libswscale-dev   # 1.3 install video I/O libraries
sudo apt-get install -y libxine2-dev libgstreamer0.10-dev
sudo apt-get install -y libgstreamer-plugins-base0.10-dev
sudo apt-get install -y libxvidcore-dev libv4l-dev v4l-utils
sudo apt-get install -y libfaac-dev libmp3lame-dev                      # 1.4 install sound I/O libraries
sudo apt-get install -y libjpg-dev libpng-dev libtiff-dev libjasper-dev # 1.5 install image I/O libraries
sudo apt-get install -y tesseract-ocr                                   # 1.6 install OCR tools
echo ""

echo -e "\033[1;33m[Finish] installing dependency packages.\033[0;39m"
