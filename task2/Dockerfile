FROM postgres:14.5

RUN apt-get update -y && apt-get install -y procps vim

WORKDIR /workdir

RUN mkdir -p /docker-entrypoint-initdb.d
COPY ./sql/* /docker-entrypoint-initdb.d/
COPY ./sql-queries /workdir/sql-queries/
COPY ./login.sh /workdir/
COPY ./execute_sql_query.sh /workdir/
COPY ./entrypoint.sh /workdir/

ENTRYPOINT [ "./entrypoint.sh" ]