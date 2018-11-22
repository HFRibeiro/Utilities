#!bin/bash
#sudo apt-get update
#sudo apt-get -y install build-essential cmake unzip pkg-config libjpeg-dev libpng-dev libtiff-dev libavcodec-dev libavformat-dev libswscale-dev libv4l-dev libxvidcore-dev libx264-dev libgtk-3-dev libatlas-base-dev gfortran python3-dev htop gtkterm build-essential mesa-common-dev libgl1-mesa-dev "^libxcb.*" libx11-xcb-dev libglu1-mesa-dev libxrender-dev
#sudo usermod -a -G dialout $USER
#wget http://download.qt.io/official_releases/qt/5.11/5.11.2/qt-opensource-linux-x64-5.11.2.run
#sudo -s chmod u+x qt-opensource-linux-x64-5.11.2.run
#sudo mkdir /opt/Qt
#sudo -s chmod -R 777 /opt/Qt
#./qt-opensource-linux-x64-5.11.2.run
wget -O opencv.zip https://github.com/opencv/opencv/archive/3.4.1.zip
unzip opencv.zip
cd ~/opencv-3.4.1/
mkdir build
cd build
cmake -D CMAKE_BUILD_TYPE=RELEASE -D CMAKE_INSTALL_PREFIX=/usr/local -D WITH_TBB=ON -D WITH_CUDA=OFF -D WITH_V4L=ON -D WITH_QT=ON -D WITH_OPENGL=ON ..
make -j $(nproc)
sudo make install
sudo /bin/bash -c 'echo "/usr/local/lib" > /etc/ld.so.conf.d/opencv.conf'
sudo ldconfig

sudo apt-get install libqt5core5a libqt5script* qtscript5*
sudo apt-get install libxext-dev libgtk-3-dev libglade2* libpcap0.8 libcap2 ethtool
