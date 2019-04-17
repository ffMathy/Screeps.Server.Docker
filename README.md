```
docker rm screeps-server
docker rmi screeps-server
docker build . -t screeps-server
docker run -d -it --name=screeps-server screeps-server
docker start screeps-server
```