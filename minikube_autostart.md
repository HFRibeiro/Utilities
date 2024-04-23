```
sudo nano /etc/systemd/system/minikube.service
```

```
[Unit]
Description=Starts Minikube on Boot
After=network.target

[Service]
Type=oneshot
RemainAfterExit=yes
ExecStart=/usr/local/bin/minikube start
ExecStop=/usr/local/bin/minikube stop
User=code

[Install]
WantedBy=multi-user.target
```

```
sudo systemctl daemon-reload
sudo systemctl enable minikube.service
sudo systemctl start minikube.service
sudo systemctl status minikube.service
```
