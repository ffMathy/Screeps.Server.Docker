Environment variable `STEAMKEY` must be set to the Steam web app API key.

Built dockerfile: https://hub.docker.com/r/ffmathy/screeps-server

Meant to be started with `docker-compose.yml` here: https://raw.githubusercontent.com/ffMathy/Screeps.Server.Docker/master/docker-compose.yml

# Manual build
```
docker-compose run -e STEAMKEY=ENTER_KEY_HERE screeps
```

# CLI access
```
docker exec -it screeps npx screeps cli
```

## Resetting all data
```
system.resetAllData()
```

## Setting password for specific user
```
setPassword('Username', 'YourDesiredPassword')
```