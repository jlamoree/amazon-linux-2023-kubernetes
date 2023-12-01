## Usage

```shell
tag=2023120101
docker run --rm -it --hostname al2023kube --name al2023kube \
  lamoreesoftware/amazon-linux-2023-kubernetes:$tag
```

## Build Setup

### Testing
```shell
tag=2023120101
docker build --tag lamoreesoftware/amazon-linux-2023-kubernetes:$tag .
```

### Multi-Architecture
```shell
docker buildx create --name local --node local --platform linux/arm64,linux/amd64
docker buildx use local
docker login

tag=2023120101
docker buildx build --platform=linux/amd64,linux/arm64 --push \
  --tag lamoreesoftware/amazon-linux-2023-kubernetes:$tag .
```
