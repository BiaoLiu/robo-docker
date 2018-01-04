# fz

### 包含以下镜像的Dockerfile与uwsgi.ini文件

- 内置python3.6的alpine
- mysql
- postgreps
- redis
- nginx


### docker容器互联

1.创建网络
docker network create -d bridge custom (network_name)

2.在docker-compose.yml中使用networks节点，配置创建的网络