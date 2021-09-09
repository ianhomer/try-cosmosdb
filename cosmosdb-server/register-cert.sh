#!/bin/sh

ipaddr="`ifconfig | grep "inet " | grep -Fv 127.0.0.1 | awk '{print $2}' | head -n 1`"

echo "IP Address : $ipaddr"

echo quit | openssl s_client -showcerts -servername $ipaddr \
    -connect $ipaddr:3000 > cosmosdb-server-cacert.pem

sudo security add-trusted-cert -d -r trustRoot \
  -k /Library/Keychains/System.keychain cosmosdb-server-cacert.pem

