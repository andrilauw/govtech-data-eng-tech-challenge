#!/usr/bin/env bash

SQL_FILE_PATH=$1

psql -h 127.0.0.1 -U postgres -d postgres -a -f ${SQL_FILE_PATH}