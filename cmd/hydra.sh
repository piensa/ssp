#!/bin/bash
set -e;

function hydra_start(){ compose_exec up -d hydra logico;}

function hydra_stop(){ compose_exec kill hydra; }

function hydra_client_create(){ compose_exec exec hydra hydra clients create "$@";}

function hydra_client_token(){ compose_exec exec hydra hydra token user "$@";}

register 'hydra' 'start' 'start hydra server' hydra_start
register 'hydra' 'stop' 'stop hydra server' hydra_stop
register 'hydra' 'create' 'create hydra client' hydra_client_create
register 'hydra' 'token' 'issue a client token' hydra_client_token