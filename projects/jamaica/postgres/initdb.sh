#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" postgres <<-EOSQL
    CREATE DATABASE $USER_DB OWNER $POSTGRES_USER;
EOSQL

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" $USER_DB < /dump/insert.sql
