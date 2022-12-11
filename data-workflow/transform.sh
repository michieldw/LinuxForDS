#!/bin/bash

BASE_DIR=$(dirname "$0")





# cat data/data-20221211-101001.json |
#   jq -r '.data |
#   map_values(.[0]) |
#   map_values(.description) |
#   map_values(. |= sub("^.* (?<price>[^ ]+) USD.*$"; "\(.price)")) |
#   .[]' |
#   tr '\n' ';' \
#   > temp.csv

#'.taskDefinition.containerDefinitions[].image |= sub("(?<repo>.*:).*"; "\(.repo)new")'
