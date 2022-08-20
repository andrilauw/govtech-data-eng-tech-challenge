FROM postgres:14.5

RUN apt-get update -y && apt-get install -y procps

WORKDIR /workdir

RUN mkdir -p /docker-entrypoint-initdb.d
COPY ./sql/* /docker-entrypoint-initdb.d/
COPY ./login.sh /workdir/
COPY ./entrypoint.sh /workdir/

ENTRYPOINT [ "./entrypoint.sh" ]