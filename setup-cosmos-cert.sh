#!/bin/sh

ipaddr="`ifconfig | grep "inet " | grep -Fv 127.0.0.1 | awk '{print $2}' | head -n 1`"

curl -k https://$ipaddr:8085/\_explorer/emulator.pem \
  > emulatorcert.crt

sudo security add-trusted-cert -d -r trustRoot \
  -k /Library/Keychains/System.keychain emulatorcert.crt
