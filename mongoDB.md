### Install compass
```
wget https://downloads.mongodb.com/compass/mongodb-compass_1.20.5_amd64.deb
sudo apt-get install ./mongodb-compass_1.20.5_amd64.deb
```

### Run compass
```
mongodb-compass
```

### Check mongoDB IP
```
docker network inspect tangonet
```

#### Connect to mongoDB example: 172.19.0.5:27017, no UserName no Password
