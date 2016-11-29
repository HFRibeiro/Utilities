##Mouse on Ubuntu
sudo apt-get install solaar
##AVRDude Command
avrdude -c avrisp -p atmega328p -P net:10.42.0.126:328 -U flash:w:one.ino.standard.hex
