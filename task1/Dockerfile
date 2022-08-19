FROM python:3.8-slim-buster

RUN apt-get update -y && apt-get install -y vim cron

WORKDIR /workdir

COPY ./requirements.txt /workdir/
RUN pip install -r requirements.txt

COPY ./src /workdir/src/
COPY ./datasource /workdir/datasource/
COPY ./cron.txt /workdir/
COPY ./entrypoint.sh /workdir/

ENTRYPOINT [ "./entrypoint.sh" ]