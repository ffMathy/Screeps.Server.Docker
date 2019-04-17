Environment variable `STEAMKEY` must be set to the Steam web app API key.

https://hub.docker.com/r/ffmathy/screeps-server

# Manual build
```
docker-compose build
docker-compose up
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