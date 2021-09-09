#!/bin/sh

ipaddr="`ifconfig | grep "inet " | grep -Fv 127.0.0.1 | awk '{print $2}' | head -n 1`"

echo "IP Address : $ipaddr"

docker run -p 8085:8081 -p 10251:10251 -p 10252:10252   \
  -p 10253:10253 -p 10254:10254                         \
  -m 3g --cpus=2.0 --name=test-linux-emulator           \
  -e AZURE_COSMOS_EMULATOR_PARTITION_COUNT=3            \
  -e AZURE_COSMOS_EMULATOR_ENABLE_DATA_PERSISTENCE=false \
  -e AZURE_COSMOS_EMULATOR_IP_ADDRESS_OVERRIDE=$ipaddr  \
  mcr.microsoft.com/cosmosdb/linux/azure-cosmos-emulator

