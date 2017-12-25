#!/bin/bash
# Shows btc price from Coindesk.com

clear
echo "Coindesk BTC: "
echo "  USD             EUR             GBP "

while [ 1 ] 
do
curl -s http://api.coindesk.com/v1/bpi/currentprice.json |  python -c "import json, sys; bitcoin=json.load(sys.stdin); print bitcoin['bpi']['USD']['rate'] + '\t' + bitcoin['bpi']['EUR']['rate'] + '\t' + bitcoin['bpi']['GBP']['rate']"
printf "\033[A" 
sleep 5
done

