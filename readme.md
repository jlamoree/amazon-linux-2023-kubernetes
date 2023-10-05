## Usage

```shell
tag=2023100402
docker run --rm -it --hostname al2023kube --name amazon-linux-2023-kubernetes \
  jlamoree/amazon-linux-2023-kubernetes:$tag
```

## Build Setup

```shell
docker buildx create --name local --node local --platform linux/arm64,linux/amd64
docker buildx use local

docker login
tag=2023100402
docker buildx build --platform=linux/amd64,linux/arm64 --push \
  --tag jlamoree/amazon-linux-2023-kubernetes:$tag
```
