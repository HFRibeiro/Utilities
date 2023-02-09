# Tutoriais
Changes check
Tutoriais

## ska-tango-taranta-pipeline
```
docker run -it -v /home/code/ska-tango-taranta-pipeline/taranta:/app node:alpine sh
apk add --update bash coreutils git jq make docker-compose tar
```

```bash
grep -rnw '/home/code/esp/esp-idf' -e 'Brownout'
grep -rnw --exclude-dir=node_modules '.' -e 'executeCommand.*'
```

```bash
g++ `pkg-config --cflags opencv` houghlines.cpp `pkg-config --libs opencv` -o hough
```

### Webjive limite of files

```
echo fs.inotify.max_user_watches=524288 | sudo tee -a /etc/sysctl.conf && sudo sysctl -p
```
#### Docker comands

```
docker exec -it webjive /bin/bash
```

### Stop all containers

```
docker stop $(docker ps -a -q)
```

#### To delete all containers including its volumes use,
```
docker rm -vf $(docker ps -a -q)
```
#### To delete all the images,
```
docker rmi -f $(docker images -a -q)
```

#### echo on make
```
$(info   DOCKER_COMPOSE_ARGS are $(DOCKER_COMPOSE_ARGS))

DISPLAY=:0 XAUTHORITY=/run/user/1000/gdm/Xauthority TANGO_HOST=databaseds:10000 NETWORK_MODE=tangonet XAUTHORITY_MOUNT=/tmp/.X11-unix:/tmp/.X11-unix MYSQL_HOST=tangodb:3306 CONTAINER_NAME_PREFIX= COMPOSE_IGNORE_ORPHANS=true TMC_VERSION=latest

```

#### current branch
```
git branch | grep \* | cut -d ' ' -f2
```


######
```
kubectl logs -n integration oet-ssh
```

``` 
kubectl exec -it oet-ssh -n integration -- /bin/bash
```

To run OET need to pass from root to tango user
$su tango

```
docker run -it oet-ssh /bin/bash
```

```
ssh tango@10.104.116.225 -p 2022 -t 'bash -ic "bash"'
```

### build docs

```
docker run --rm -d -v $(pwd):/tmp -w /tmp/docs netresearch/sphinx-buildbox sh -c "make html"
```
### build power supply

```
DISPLAY=:0 XAUTHORITY=/run/user/1000/gdm/Xauthority TANGO_HOST=databaseds:10000 NETWORK_MODE=tangonet XAUTHORITY_MOUNT=/tmp/.X11-unix:/tmp/.X11-unix MYSQL_HOST=tangodb:3306 CONTAINER_NAME_PREFIX= COMPOSE_IGNORE_ORPHANS=true TMC_VERSION=latest docker-compose -f tango-example.yml up -d
```

### npm install
```
curl -sL https://deb.nodesource.com/setup_16.x | sudo bash -
```

#### Here is a way to install packages globally for a given user.
1. Create a directory for global packages
```
mkdir "${HOME}/.npm-packages"
```
2. Tell npm where to store globally installed packages
```
npm config set prefix "${HOME}/.npm-packages"
```
3. Ensure npm will find installed binaries and man pages
Add the following to your .bashrc/.zshrc:
```
NPM_PACKAGES="${HOME}/.npm-packages"
export PATH="$PATH:$NPM_PACKAGES/bin"
export MANPATH="${MANPATH-$(manpath)}:$NPM_PACKAGES/share/man"
```
#### gopro2json

- Install Go (https://golang.org/doc/install)
- Create a directory $HOME/go/src/github.com/stilldavid/
- Clone the repo into the dir created in #2
- export GOPATH=$HOME/go
- go get github.com/stilldavid/gopro-utils/bin/gopro2json
go install github.com/stilldavid/gopro-utils/bin/gopro2json


#### Expand Virtual Box Disk 100GB
```
cd "C:\Program Files\Oracle\VirtualBox"
VBoxManage modifyhd "C:\Users\code\VirtualBox VMs\k8s_t\k8s-disk001.vdi" --resize 102400
```

### K8s system output
```
kubectl get svc -n kube-system
```

### export/import dashboards
```
docker exec -i mongodb mongoexport --db dashboards --collection dashboards > data/mongo/dashboards.json
docker exec -i mongodb mongoimport --db dashboards --collection dashboards < data/mongo/dashboards.json
```


### teensy 4.0
```
sudo apt-get install avr-libc gcc-avr
```

### HID NAME

```
Computer\HKEY_CURRENT_USER\System\CurrentControlSet\Control\MediaProperties\PrivateProperties\Joystick\OEM
```

### Find files 

```
find /path/to/file/ -iname filename
```

### Permissions

```
sudo chown -R $USER /usr/src/skampi
```

### Taint

```
kubectl taint nodes --all node-role.kubernetes.io/master-

sudo swapoff -a
strace -eopenat kubectl version
```

### auto hotspot

nmcli con show

nmcli con mod Hotspot connection.autoconnect yes

### GO PRO TO BIN 
ffmpeg -y -i GOPR1960.MP4 -codec copy -map 0:m:handler_name:"	GoPro MET" -f rawvideo GOPR1960.bin

### Python 
```
sudo update-alternatives --install /usr/bin/python python /usr/bin/python3 1
sudo update-alternatives --install /usr/bin/python python /usr/bin/python3.8 2

sudo update-alternatives  --set python /usr/bin/python3.8


sudo update-alternatives --config python
```

### Docker login
```
cat ~/my_password.txt | docker login --username hfribeiro --password-stdin
```

### Docker remove none images
```
docker rmi $(docker images | grep "<none>" | awk "{print $3}")
```

###Chrome remote
```
mkdir ~/.config/chrome-remote-desktop
```

##Node
```
curl -fsSL https://deb.nodesource.com/setup_17.x | sudo -E bash -
sudo apt-get install -y nodejs
```

###Yarn
```
curl --compressed -o- -L https://yarnpkg.com/install.sh | bash
```

###Disk inspector ubuntu
```
sudo baobab
```
