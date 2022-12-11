#!/bin/bash

BASE_DIR=(dirname $0)

cat data/data-20221211-101001.json |
  jq '.data |
  map_values(.[0]) |
  map_values(.description) |
  map_values(. |= sub("^.* (?<price>[^ ]+) USD.*$"; "\(.price)"))' \
  > temp.csv

#'.taskDefinition.containerDefinitions[].image |= sub("(?<repo>.*:).*"; "\(.repo)new")'
