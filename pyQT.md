### Install instructions

`sudo apt-get install python3-venv`

`python3 -m venv fbsenv`

`source fbsenv/bin/activate`

`pip install fbs PyQt5==5.9.2 PyInstaller==3.4`

`fbs startproject`

### run app

`fbs run`

### generate executable

`fbs freeze`

### generate installer

`sudo apt-get install ruby ruby-dev rubygems build-essential`

`gem install --no-document fpm`

`fbs installer`
