```
docker buildx create --name mybuilder
```

```
docker buildx use mybuilder
```

```
docker buildx inspect --bootstrap
```

```
mkdir test && cd test && cat <<EOF > Dockerfile
FROM ubuntu
RUN apt-get update && apt-get install -y curl
WORKDIR /src
COPY . .
EOF
```

```
docker buildx build --platform linux/amd64,linux/arm64,linux/armv7,linux/armv8 -t hfribeiro/ubuntu-simple:latest --push .
```
