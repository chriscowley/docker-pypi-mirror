#!/bin/sh

mkdir -pv /srv/pypi/web && cd /srv/pypi/web
python -m SimpleHTTPServer
