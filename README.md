# Tutoriais
Changes check
Tutoriais
```bash
grep -rnw '/home/code/esp/esp-idf' -e 'Brownout'
grep -rnw --exclude-dir=node_modules '.' -e 'executeCommand'
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
docker exec -it webjive sh
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
curl -sL https://deb.nodesource.com/setup_8.x | sudo bash -
```
