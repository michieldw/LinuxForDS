#!/bin/bash

BASE_DIR=$(dirname "$0")

printf "# Reporting on cryptocurrency data. $(date)\n\n" > $BASE_DIR/out/report.md

printf "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\n\n" >> $BASE_DIR/report.md

printf "## BNB\n\n" >> $BASE_DIR/out/report.md
printf "![BNB](./BNB.png)\n\n" >> $BASE_DIR/out/report.md

printf "## BTC\n\n" >> $BASE_DIR/out/report.md
printf "![BTC](./BTC.png)\n\n" >> $BASE_DIR/out/report.md

printf "## ETH\n\n" >> $BASE_DIR/out/report.md
printf "![ETH](./ETH.png)\n\n" >> $BASE_DIR/out/report.md

printf "## USDC\n\n" >> $BASE_DIR/out/report.md
printf "![USDC](./USDC.png)\n\n" >> $BASE_DIR/out/report.md

printf "## USDT\n\n" >> $BASE_DIR/out/report.md
printf "![USDT](./USDT.png)\n\n" >> $BASE_DIR/out/report.md

printf "## Conclusion\n\n" >> $BASE_DIR/out/report.md

cat out/data.txt >> $BASE_DIR/out/report.md
