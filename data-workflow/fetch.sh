#!/bin/bash

# Michiel De Wilde

# directory waarin script opgeslagen is als variabele gebruiken voor later
BASE_DIR=$(dirname "$0")

# Tijd in juiste formaat opslaan in variabele
DATE=$(date +"%Y%m%d-%H%M%S")

# api request uitvoeren en data opslaan in juiste bestand met datum
curl \
  -H "X-CMC_PRO_API_KEY: $CMC_API_KEY" \
  -H "Accept: application/json" \
  -d "symbol=BTC,ETH,USDT,BNB,USDC" \
  -o "$BASE_DIR/data/data-$DATE.json" \
  -G https://pro-api.coinmarketcap.com/v2/cryptocurrency/info \
  -s > $BASE_DIR/logbestand.txt 2>&1 #output naar logbestand, curl progress bar hier niet aan toevoegen

# bestand read-only maken
chmod 444 "$BASE_DIR/data/data-$DATE.json" >$BASE_DIR/logbestand.txt 2>&1

