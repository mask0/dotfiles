#! /usr/bin/env bash

## ----------------------------------------------------------------------------
## file    : 02-install-2.4.13.sh
## brief   : install OpenCV 2.4.13 for Ubuntu.
## module  : install-opencv
##
## author  : Teppei Kobayashi <reinstantiation@gmail.com>
## date    : 2016/11/25
## ----------------------------------------------------------------------------


# script configuration
set -ue
export LANG=C

# create working directory
atexit() {
      [[ -n $tempdir ]] && rm -rf "$tempdir"
}
tempdir=`mktemp -d`
trap atexit EXIT
trap 'trap - EXIT; atexit; exit -1' SIGHUP SIGINT SIGTERM

echo -e "\033[1;33m[Start] OpenCV 2.4.13 installation.\033[0;39m"
echo ""


## ----------------------------------------------------------------------------
## brief   : 1. get source files.
## note    : -
## ----------------------------------------------------------------------------
echo -e "\033[1;35m[1/2] Getting source files.\033[0;39m"
echo ""

cd $tempdir

# get source archive and unzip it.
wget https://github.com/Itseez/opencv/archive/2.4.13.zip
unzip 2.4.13.zip
echo ""


## ----------------------------------------------------------------------------
## brief   : 2. compile and install.
## note    : -
## ----------------------------------------------------------------------------
echo -e "\033[1;35m[2/2] Build and install OpenCV.\033[0;39m"
echo ""

# move to working directory
cd $tempdir/opencv-2.4.13
mkdir build
cd build

# cmake check
cmake -D CMAKE_BUILD_TYPE=RELEASE -D CMAKE_INSTALL_PREFIX=~/lib/opencv-2.4.13 \
      -D WITH_V4L=ON \
      -D INSTALL_C_EXAMPLES=OFF -D INSTALL_PYTHON_EXAMPLES=OFF \
      -D WITH_1394=OFF -D WITH_QT=OFF WITH_CUDA=OFF WITH_EIGEN=OFF \
      -D WITH_OPENCL=OFF -D WITH_TBB=OFF \
      ..

# build OpenCV
make -j $(nproc)
sudo make install
sudo ldconfig
echo""


echo -e "\033[1;33m[Finish] OpenCV 2.4.13 installation.\033[0;39m"
