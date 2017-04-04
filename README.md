Run Plancton from a Docker container
=====================================

Container image containing the [Plancton](https://github.com/mconcas/plancton)
daemon.  It is based on `alpine` Linux.

It uses a forwarded Docker socket exposed in `/var/run/docker.sock`.

The `entrypoint.sh` script periodically downolads configuration pointed in
`URL` and puts it in `CONFDIR`.  It runs in foreground mode inside the
container afterwards.


## Build

```
docker build -t plancton [--build-arg arg=<value>] .
```

## Run

Run in interactively:

```
docker run --rm -it -v/var/run/docker.sock:/var/run/docker.sock --name plancton-nodaemon plancton
```

Run detached:

```
docker run -d -v/var/run/docker.sock:/var/run/docker.sock --name plancton-nodaemon plancton
```

## Build variables

_You can provide such variables to Docker via the `--build-arg` switch._

* `BRANCH`: Name of the branch you want to pull Plancton from during build phase.

## Runtime variables

_You can provide such variables to Docker via the `-e` switch._

* `PLANCTON_CONF_URL`: URL pointing to the Plancton configuration file.
  Plancton will not start if the configuration is not found.
* `PLANCTON_CONF_UPDATE`: How frequently, in seconds, the configuration is
  updated. Failures will not destroy the current configuration and are not
  fatal.
* `PLANCTON_CONF_NOSSLVERIFY`: Set it to `1` to skip SSL certificate
  verification when downloading the configuration file.
