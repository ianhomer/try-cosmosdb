# Try Cosmos DB

Start up a Cosmos DB server

    cd cosmosdb-server
    ./register-cert.sh
    npm start

In another shell call the Cosmos DB SDK

    cd azure-sdk-for-python
    pip3 install -r requirements.txt
    ./cosmosdb.py
