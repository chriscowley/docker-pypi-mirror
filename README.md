Super simple image that runs [bandersnatch](https://pypi.python.org/pypi/bandersnatch)
and serves the files using Python's SimpleHTTPServer.

Quickstart:

```
docker run -d -n localpypi pypi-mirror
```

That is pretty useless though. To have your mirror persisted and actually
accesible (port 8000):

```
docker run -d -n localpypi -p 8000:8000 \
    -v /mnt/pypi-mirror:/srv/pypi pypi-mirror
```

There is a cronjob that runs every day to update the mirror. This can be
deactivated with the `RUN_PYPI_CRON` variable:

```
docker run -d -n localpypi -e RUN_PYPI_CRON=false pypi-mirror
```

If you want to force an update run:

```
docker exec -n localpypi bandersnatch mirror
```
