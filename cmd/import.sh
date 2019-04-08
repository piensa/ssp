#!/bin/bash
set -e;

# per-source imports
function import_wof(){ compose_run 'whosonfirst' './bin/start'; }
function import_oa(){ compose_run 'openaddresses' "./bin/parallel ${OPENADDRESSES_PARALLELISM:-1}"; }
function import_osm(){ compose_run 'openstreetmap' './bin/start'; }
function import_polylines(){ compose_run 'polylines' './bin/start'; }
function import_geonames(){ compose_run 'geonames' './bin/start'; }
function import_transit(){ compose_run 'transit' './bin/start'; }
function import_csv(){ compose_run 'csv-importer' './bin/start'; }

function import_keto(){
  # Parse keto config from main json.
  compose_run json_parser -M '.keto' /config/ssp.json > keto-policies.json

	compose_exec exec keto keto engines acp ory policies import \
	regex --endpoint http://localhost:4466 /config/keto-policies.json;
}

function import_oathkeeper(){
  compose_run json_parser -M '.oathkeeper' /config/ssp.json > ok-rules.json

	compose_exec exec ok-api oathkeeper rules import \
	--endpoint http://localhost:4456 /config/ok-rules.json
}

register 'import' 'wof' '(re)import whosonfirst data' import_wof
register 'import' 'oa' '(re)import openaddresses data' import_oa
register 'import' 'osm' '(re)import openstreetmap data' import_osm
register 'import' 'polylines' '(re)import polylines data' import_polylines
register 'import' 'geonames' '(re)import geonames data' import_geonames
register 'import' 'transit' '(re)import transit data' import_transit
register 'import' 'csv' '(re)import csv data' import_csv
register 'import' 'keto' '(re)import keto policies from keto-policies.json file' import_keto
register 'import' 'oathkeeper' '(re)import oathkeeper policies from ok-rules.json file' import_oathkeeper

# import all the data to be used by imports
# note: running importers in parallel can cause issues due to high CPU & RAM requirements.
function import_all(){
  import_wof
  import_oa
  import_osm
  import_polylines

  if [[ "$ENABLE_GEONAMES" == "true" ]]; then
    import_geonames
  fi

  import_transit
  import_csv
}

register 'import' 'all' '(re)import all data' import_all
