# robo-docker

### 包含以下镜像的Dockerfile

- 内置python3.6的alpine
- mysql
- postgreps
- redis
- nginx


### docker容器互联

1.创建网络
docker network create -d bridge robo (network_name)

2.在docker-compose.yml中使用networks节点，配置互联的网络，如：

```ini
version: '3'
services:
  db:
    build: .
    networks:
      - robo
    container_name: docker_redis
    ports:
      - '6380:6379'

networks:
  robo:
    external: true
```