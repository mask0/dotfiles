#! /usr/bin/env bash

## ----------------------------------------------------------------------------
## file    : 02-install-3.1.0.sh
## brief   : install OpenCV 3.1.0
## module  : install-opencv
##
## author  : Teppei Kobayashi <reinstantiation@gmail.com>
## date    : 2016/11/14
## ----------------------------------------------------------------------------


# script configuration
set -ue
export LANG=C

# generate temporary directory
atexit() {
      [[ -n $tempdir ]] && rm -rf "$tempdir"
}
tempdir=`mktemp -d`
trap atexit EXIT
trap 'trap - EXIT; atexit; exit -1' SIGHUP SIGINT SIGTERM

echo -e "\033[1;33m[Start] OpenCV 3.1.0 installation.\033[0;39m"
echo ""


## ----------------------------------------------------------------------------
## brief   : 1. get source files.
## note    : -
## ----------------------------------------------------------------------------
echo -e "\033[1;35m\t[1/2] Getting source files.\033[0;39m"
echo ""

cd $tempdir

git clone https://github.com/Itseez/opencv.git                          # source files
git clone https://github.com/Itseez/opencv_contrib.git                  # extra modules
git clone https://github.com/tesseract-ocr/tessdata.git                 # Tesseract-ocr learning data
echo ""


## ----------------------------------------------------------------------------
## brief   : 2. compile and install.
## note    : -
## ----------------------------------------------------------------------------
echo -e "\033[1;35m[1/2] Build and install OpenCV.\033[0;39m"
echo ""

# move to working directory
cd $tempdir/opencv
mkdir build
cd build

# cmake check
cmake -D CMAKE_BUILD_TYPE=RELEASE -D CMAKE_INSTALL_PREFIX=~/lib/opencv-3.1.0 \
      -D OPENCV_EXTRA_MODULES_PATH=$tempdir/opencv_contrib/modules \
      -D WITH_V4L=ON \
      -D INSTALL_C_EXAMPLES=OFF -D INSTALL_PYTHON_EXAMPLES=OFF \
      -D WITH_1394=OFF -D WITH_QT=OFF WITH_CUDA=OFF WITH_EIGEN=OFF \
      -D WITH_MATLAB=OFF -D WITH_OPENCL=OFF -D WITH_TBB=OFF \
      ..

# build OpenCV
make -j $(nproc)
sudo make install
sudo ldconfig

# copy tesseract-ocr learning data.
cd $tempdir/tessdata
sudo cp -i jpn.traineddata /usr/share/tesseract-ocr/tessdata
sudo cp -i eng.traineddata /usr/share/tesseract-ocr/tessdata
echo ""


echo -e "\033[1;33m[Finish] OpenCV 3.1.0 installation.\033[0;39m"
