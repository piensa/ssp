#!/bin/bash
set -e;

function postgres_start(){ compose_exec up -d postgres;}
function postgres_migrate(){
	echo "[INFO] Creating database ${DB_USERS}";
	
	# compose_exec exec postgres 

}

register 'postgres' 'start' 'Start postgres database' postgres_start
register 'postgres' 'migrate' 'migrate fake users database' postgres_migrate