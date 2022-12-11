#!/bin/bash

BASE_DIR=$(dirname "$0") #zorgen dat paden juist werken indien script niet vanuit data-workflow/ uitgevoerd wordt

touch $BASE_DIR/out.csv #outputbestand aanmaken indien het nog niet bestaat
echo "DATETIME,BNB,BTC,ETH,USDC,USDT" > $BASE_DIR/out.csv #hoofding van csv bestand maken

for FILE in $BASE_DIR/data/*.json; #over paden van elke file onder data-workflow/data/ loopen
do
  DATETIME=$(echo $FILE | grep -Eo '[[:digit:]]{8}-[[:digit:]]{6}') # datetime uit filenaam halen (https://stackoverflow.com/questions/26881104/extract-date-from-a-file-name-in-unix-using-shell-scripting)
  cat $FILE | #jsonbestand pipen naar jq commando
    jq -r '.data | 
    map_values(.[0]) |
    map_values(.description) |
    map_values(. |= sub("^.* (?<price>[^ ]+) USD.*$"; "\(.price)")) |
    .[]' | #elke file omzetten naar een lijst van 5 prijzen in USD
    tr -d ',' | #komma's verwijderen
    tr '\n' ',' | #newlines omzetten in puntkomma's
    sed "s/^/$DATETIME,/" |
    sed "s/,$/\n/" \
    >> $BASE_DIR/out.csv #csv-lijn voor huidig bestand achteraan het outputbestand toevoegen
done

