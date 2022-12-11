#!/bin/bash

# Michiel De Wilde

# Tijd in juiste formaat opslaan in variabele
date=$(date +"%Y%m%d-%H%M%S")

# api request uitvoeren en data opslaan in juiste bestand met datum
curl \
  -H "X-CMC_PRO_API_KEY: $CMC_API_KEY" \
  -H "Accept: application/json" \
  -d "symbol=BTC,ETH,USDT,BNB,USDC" \
  -o "data/data-$date.json" \
  -G https://pro-api.coinmarketcap.com/v2/cryptocurrency/info \
  -s >logbestand.txt 2>&1 #naar logbestand, curl progress bar hier niet aan toevoegen

# bestand read-only maken
chmod 444 "data/data-$date.json" >logbestand.txt 2>&1

