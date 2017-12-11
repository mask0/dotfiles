#! /usr/bin/env bash

## ----------------------------------------------------------------------------
## file    : 03-config-dual-env.sh
## brief   : pkg-config configuration for dual OpenCV environment.
## module  : install-opencv
##
## author  : Teppei Kobayashi <reinstantiation@gmail.com>
## date    : 2016/11/14
## ----------------------------------------------------------------------------


# script configuration
set -ue
export LANG=C


# main processing
echo -e "\033[1;32m[Start] Generating symbolic-link for pkg-config.\033[0;39m"
echo ""

# generate symbolic-link
cd ~
#mkdir .pkg-config
cd .pkg-config

if [ -e ~/lib/opencv-2.4.13/ ]; then
    echo "[message] OpenCV 2.4.13 found."
    ln -s ~/lib/opencv-2.4.13/lib/pkgconfig/opencv.pc ./opencv2.pc
else
    echo "[message] OpenCV 2.4.13 isn't installed."
fi

if [ -e ~/lib/opencv-3.1.0/ ]; then
    echo "[message] OpenCV 3.1.0 found."
    ln -s ~/lib/opencv-3.1.0/lib/pkgconfig/opencv.pc ./opencv3.pc
else
    echo "[message] OpenCV 3.1.0 isn't installed."
fi
echo ""

# message
echo -e "\033[1;35mPLEASE add following environment variables:\033[0;39m"
echo "----"
echo -e 'export CV2_LIB_PATH=$HOME/lib/opencv-2.4.13/lib'
echo -e 'export CV3_LIB_PATH=$HOME/lib/opencv-3.1.0/lib'
echo -e 'export PKG_CONFIG_PATH=$HOME/.pkg-config'
echo -e 'export LD_LIBRARY_PATH=$CV2_LIB_PATH:$CV3_LIB_PATH'
echo "----"
echo ""

echo -e "\033[1;32m[Finish] Symbolic-link generated.\033[0;39m"
