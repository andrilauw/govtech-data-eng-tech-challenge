FROM python:3.8-slim-buster

WORKDIR /workdir

COPY ./requirements.txt /workdir/
RUN pip install -r requirements.txt

COPY ./src /workdir/src/
COPY ./datasource /workdir/datasource/
COPY ./entrypoint.sh /workdir/

ENTRYPOINT [ "./entrypoint.sh" ]