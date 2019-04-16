#!/bin/bash
set -e;

function hydra_start(){ compose_exec up -d hydra logico;}

function hydra_stop(){ compose_exec kill hydra; }

function hydra_client_token(){
	client=$(jq -r -M ".hydra.client_id" ssp.json)
	secret=$(jq -r -M ".hydra.client_secret" ssp.json)
	scopes=$(jq -r -M ".hydra.scope" ssp.json | sed 's/\ /,/g')

	compose_exec exec hydra hydra token user \
	--endpoint http://localhost:4444 \
	--client-id $client \
	--client-secret $secret \
	--scope $scopes \
	--port ${TOKEN_PORT}
}

register 'hydra' 'start' 'start hydra server' hydra_start
register 'hydra' 'stop' 'stop hydra server' hydra_stop
register 'hydra' 'token' 'issue a client token' hydra_client_token
