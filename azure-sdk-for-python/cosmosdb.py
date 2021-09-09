#!/usr/bin/env python3

# See
# https://github.com/Azure/azure-sdk-for-python/blob/main/sdk/cosmos/azure-cosmos/samples/examples.py
# for examples

from azure.cosmos import exceptions, CosmosClient
import urllib3

urllib3.disable_warnings()

url = "https://localhost:3000"
key = "pass"
client = CosmosClient(url, key)

database_name = "test"
container_name = "test"

try:
    database = client.create_database(id=database_name)
except exceptions.CosmosResourceExistsError:
    database = client.get_database_client(database=database_name)

database = client.get_database_client(database_name)
for container in database.list_containers():
    print("Container ID: {}".format(container["id"]))

container = database.get_container_client(container_name)
for i in range(1, 5):
    container.upsert_item({"id": f"item={i}", "foo": "bar"})

results = container.query_items(
    query="SELECT COUNT(1) FROM test",
    enable_cross_partition_query=True,
)
for item in results:
    print(item)

for item in container.query_items(
    query="SELECT * FROM test",
    enable_cross_partition_query=True,
):
    print(item)
