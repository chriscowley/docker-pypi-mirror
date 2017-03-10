FROM python:2-alpine

RUN pip install -r https://bitbucket.org/pypa/bandersnatch/raw/stable/requirements.txt
COPY bandersnatch.conf /etc/bandersnatch.conf
COPY update_mirror /etc/periodic/daily/update_mirror
VOLUME ["/srv/pypi"]
EXPOSE 8000
ENV RUN_PYPI_CRON=true
WORKDIR /srv/pypi/
COPY entrypoint.sh /usr/local/bin/entrypoint.sh
CMD ["/usr/local/bin/entrypoint.sh"]
