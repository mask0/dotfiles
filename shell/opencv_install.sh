##################################
## File             : opencv_install.sh
## Enviroment : Mac OS X (High Sierra)
## Module       : install-opencv 3.1.0 C++
#------------------------------------------------#
##  Atuhrer      : Takashi Higasa
## Date            : 2017 / 12 / 24
##################################


##   0.install cmake
##-----------------------------------------------------------------------------
echo  "\033[1;35mInstall cmake :\033[0;39m"
brew install cmakebrew install cmake


# generate temporary directory
mkdir /tmp/opencv/
cd /tmp/opencv/

##  1. get source files.
echo -e "\033[1;35m\t[1/2] Getting source files.\033[0;39m"
echo ""
git clone https://github.com/Itseez/opencv.git
git clone https://github.com/Itseez/opencv_contrib.git

# make install directory
cd opencv
mkdir release
cd release

##  2. compile and install.
echo -e "\033[1;35m[1/2] Build and install OpenCV.\033[0;39m"
echo ""
cmake -D CMAKE_BUILD_TYPE=Release -D CMAKE_INSTALL_PREFIX=/usr/local ..
make -j7
sudo make install
