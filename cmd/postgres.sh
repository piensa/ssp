#!/bin/bash
set -e;

function postgres_start(){ compose_exec up -d postgresd;}
function postgres_stop(){ compose_exec kill postgresd;}
function postgres_migrate(){
	compose_exec exec postgresd chmod +x /dump/initdb.sh
	compose_exec exec postgresd /dump/initdb.sh
}

register 'postgres' 'start' 'Start postgres database' postgres_start
register 'postgres' 'migrate' 'migrate fake users database' postgres_migrate
register 'postgres' 'stop' 'stop postgres database' postgres_stop