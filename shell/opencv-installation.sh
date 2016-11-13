#
# opencv-3.1.0-installation.sh
# Shell script
# Version 1.0
#
# Created by T. Kobayashi
# Last Modified 2016/10/12
#

echo -e "\033[1;33m[Insert your sudo password for $USER]\033[0;39m"
sudo echo -e "\033[1;33m[OpenCV installation script started.]\033[0;39m"
echo -e "\033[1;33m[WARNING!! You will need to insert your sudo password one more time after compile.]\033[0;39m"
echo ""
echo ""


#
# 1. install required packages
#
echo -e "\033[1;35m\t[1/3] Required package installation started.\033[0;39m"
echo ""

echo -e "\033[4;36m[1/2] Upgrading packages.\033[0;39m"

sudo apt-get update
sudo apt-get upgrade -y
echo ""

echo -e "\033[4;36m[2/2] Installing dependency packages.\033[0;39m"
# 1.1 install develop environment to build OpenCV
sudo apt-get install -y build-essential cmake git pkg-config

# 1.2 install basic library
sudo apt-get install -y libgtk2.0-dev libopencv-dev

# 1.3 install video I/O libraries
sudo apt-get install -y libavcodec-dev libavformat-dev libswscale-dev libxine2-dev libgstreamer0.10-dev libgstreamer-plugins-base0.10-dev \
                        libxvidcore-dev libv4l-dev v4l-utils

# 1.4 install sound I/O libraries
sudo apt-get install -y libfaac-dev libmp3lame-dev

# 1.4 install image I/O libraries
sudo apt-get install -y libjpg-dev libpng-dev libtiff-dev libjasper-dev

# 1.5 install parallel processing libraries
sudo apt-get install -y libttb2 libttb-dev

# 1.6 install extra module libraries (OCR)
sudo apt-get install -y libtesseract-dev libleptonica-dev
sudo ldconfig
echo ""

echo -e "\033[1;32m\t[1/3] Required package installation completed.\033[0;39m"
echo ""
echo ""


#
# 2. get OpenCV and extra module source files
#
echo -e "\033[1;35m\t[2/3] Getting source files started.\033[0;39m"
echo ""

cd ~
mkdir tmp_opencv
cd tmp_opencv

echo -e "\033[4;36m[1/3] Getting OpenCV 3.1.0 source files.\033[0;39m"
git clone https://github.com/Itseez/opencv.git
echo ""

echo -e "\033[4;36m[2/3] Getting extra module source files.\033[0;39m"
git clone https://github.com/Itseez/opencv_contrib.git
echo ""

echo -e "\033[4;36m[3/3] Getting tessdata files for Tesseract-OCR.\033[0;39m"
git clone https://github.com/tesseract-ocr/tessdata.git
echo ""

echo -e "\033[1;32m\t[2/3] Package installation completed.\033[0;39m"
echo ""
echo ""


#
# 3. compile and install OpenCV
#
echo -e "\033[1;35m\t[3/3] Build and install OpenCV started.\033[0;39m"
echo ""

cd ~/tmp_opencv/opencv
mkdir build
cd build

echo -e "\033[4;36m[1/3] Running cmake.\033[0;39m"
cmake -D CMAKE_BUILD_TYPE=RELEASE -D CMAKE_INSTALL_PREFIX=/usr/local \
      -D OPENCV_EXTRA_MODULES_PATH=~/tmp_opencv/opencv_contrib/modules \
      -D WITH_V4L=ON \
      -D INSTALL_C_EXAMPLES=ON -D INSTALL_PYTHON_EXAMPLES=ON \
      -D WITH_1394=OFF -D WITH_QT=OFF WITH_CUDA=OFF WITH_EIGEN=OFF \
      -D WITH_MATLAB=OFF -D WITH_OPENCL=OFF -D WITH_TBB=OFF \
      ..
echo ""

echo -e "\033[4;36m[2/3] Compiling OpenCV.\033[0;39m"
make -j $(nproc)
sudo make install
sudo ldconfig
echo""

echo -e "\033[4;36m[3/3] Installing tessdata file for Tesseract-OCR.\033[0;39m"
cd ~/tmp_opencv/tessdata
sudo cp -i jpn.traineddata /usr/share/tesseract-ocr/tessdata
sudo cp -i eng.traineddata /usr/share/tesseract-ocr/tessdata
echo""

echo -e "\033[1;32m\t[3/3] Build OpenCV completed.\033[0;39m"
echo ""
echo ""
