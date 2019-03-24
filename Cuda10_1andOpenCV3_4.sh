#!/bin/bash
wget https://developer.nvidia.com/compute/cuda/10.1/Prod/local_installers/cuda-repo-ubuntu1804-10-1-local-10.1.105-418.39_1.0-1_amd64.deb
sudo dpkg -i cuda-repo-ubuntu1804-10-1-local-10.1.105-418.39_1.0-1_amd64.deb
sudo apt-key add /var/cuda-repo-10-1-local-10.1.105-418.39/7fa2af80.pub
sudo apt-get update
sudo apt-get install cuda
sudo apt-get -y install build-essential cmake unzip pkg-config libjpeg-dev libpng-dev libtiff-dev
libavcodec-dev libavformat-dev libswscale-dev libv4l-dev libxvidcore-dev libx264-dev libgtk-3-dev libatlas-base-dev gfortran python3-dev
git clone git@github.com:opencv/opencv.git
cd opencv
git checkout 3.4
git clone git@github.com:opencv/opencv_contrib.git
cd ../opencv_contrib/
git checkout 3.4
cd opencv
mkdir build
cd build
cmake -D CMAKE_BUILD_TYPE=RELEASE \
-D CMAKE_INSTALL_PREFIX=/usr/local \
-D PYTHON_LIBRARY=/usr/lib/x86_64-linux-gnu/libpython3.6m.so \
-D PYTHON3_LIBRARY=/usr/lib/x86_64-linux-gnu/libpython3.6m.so \
-D PYTHON3_INSTALL=/usr/local/lib/python3.6/site-packages/cv2/python-3.6 \
-D PYTHON3_EXECUTABLE=/usr/bin/python3.6 \
-D BUILD_opencv_python3=ON \
-D PYTHON_DEFAULT_EXECUTABLE=$(which python3) \
-D WITH_TBB=ON \
-D WITH_CUDA=ON \
-D WITH_V4L=ON \
-D WITH_QT=ON \
-D WITH_OPENGL=ON WITH_GSTREAMER=ON WITH_FFMPEG=ON \
-D OPENCV_EXTRA_MODULES_PATH=~/opencv_contrib/modules \
-D BUILD_opencv_cudacodec=OFF \
-D OPENCV_ENABLE_NONFREE:BOOL=ON \
-D ENABLE_PRECOMPILED_HEADERS=OFF \
-D INSTALL_PYTHON_EXAMPLES=ON ..
make -j $(nproc)
sudo make install
sudo /bin/bash -c 'echo "/usr/local/lib" > /etc/ld.so.conf.d/opencv.conf'
sudo ldconfig
