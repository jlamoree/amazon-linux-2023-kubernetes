## Usage

```shell
tag=2023100404
docker run --rm -it --hostname al2023kube --name al2023kube \
  jlamoree/amazon-linux-2023-kubernetes:$tag
```

## Build Setup

### Testing
```shell
tag=2023100404
docker build --tag jlamoree/amazon-linux-2023-kubernetes:$tag . 
```

### Multi-Architecture
```shell
docker buildx create --name local --node local --platform linux/arm64,linux/amd64
docker buildx use local
docker login

tag=2023100404
docker buildx build --platform=linux/amd64,linux/arm64 --push \
  --tag jlamoree/amazon-linux-2023-kubernetes:$tag .
```
