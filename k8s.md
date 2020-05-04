```
make delete_all KUBE_NAMESPACE=integration
```

```
make deploy_all KUBE_NAMESPACE=integration 
```

```
**INGRESS_HOST=`hostname`
```

```
$ kubectl describe pods -n integration databaseds-tango-base-test-0
```

```
make delete_traefik EXTERNAL_IP=192.168.1.71 && make traefik EXTERNAL_IP=192.168.1.91
```


```
sudo -E minikube start --vm-driver=none --extra-config=kubelet.resolv-conf=/var/run/systemd/resolve/resolv.conf
```

```
kubectl get svc -n kube-system
```


```
watch kubectl get all,pv,pvc,ingress -n integration
```
