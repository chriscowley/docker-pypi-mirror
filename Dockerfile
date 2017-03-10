FROM python:2-alpine

RUN pip install -r https://bitbucket.org/pypa/bandersnatch/raw/stable/requirements.txt
WORKDIR /srv/pypi/web
COPY bandersnatch.conf /etc/bandersnatch.conf
COPY update_mirror /etc/periodic/daily/update_mirror
VOLUME ["/srv/pypi"]
EXPOSE 8000
ENV RUN_PYPI_CRON=true
CMD ["python", "-m", "SimpleHTTPServer"]
