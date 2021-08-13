#/bin/bash
sudo apt update
sudo apt install -y git cmake libjpeg8-dev
cd /home/pi
git clone https://github.com/jacksonliam/mjpg-streamer.git
cd mjpg-streamer/mjpg-streamer-experimental
make
sudo make install
export LD_LIBRARY_PATH=.
./mjpg_streamer -o "output_http.so -w ./www" -i "input_raspicam.so -fps 30 -x 640 -y 480 -quality 50"
