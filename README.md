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
$(error   VAR is $(VAR))
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
