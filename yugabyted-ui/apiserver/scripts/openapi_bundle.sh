#!/usr/bin/env bash

export NPM_BIN=`npm bin -g 2>/dev/null`

pushd ../conf/openapi

echo "Processing paths component in openapi ..."
pushd paths
rm -rf _index.yaml
yq eval-all '. as $item ireduce ({}; . * $item )' *.yaml > _index.yaml
popd

echo "Running bundle on openapi spec ..."
$NPM_BIN/openapi bundle ./openapi.yaml --output ../openapi.yml

popd
