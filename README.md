# Run Plancton inside a Docker contaiener
Container image containing the [Plancton](https://github.com/mconcas/plancton) daemon.
It is based on `alpine` Linux.
It uses a forwarded Docker socket exposed in `/var/run/docker.sock`.

The `entrypoint.sh` script periodically downolads configuration pointed in `URL` and puts it in `CONFDIR`.
It runs in foreground mode inside the container afterwards. 

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
