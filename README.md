# Run Plancton inside a Docker contaiener
Container image containing the [Plancton](https://github.com/mconcas/plancton) daemon.
It is based on `alpine` Linx and it uses the native Docker socket at exposed at `/var/run/docker.sock`.
It runs in foreground mode inside the container. 

## Build
```
docker build -t plancton .
```

## Run
Run in interactively
```
docker run --rm -it -v/var/run/docker.sock:/var/run/docker.sock --name plancton-nodaemon plancton
```

Run detached
```
docker run --rm -d -v/var/run/docker.sock:/var/run/docker.sock --name plancton-nodaemon plancton
```
