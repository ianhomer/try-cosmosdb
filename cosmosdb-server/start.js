// See https://www.npmjs.com/package/@zeit/cosmosdb-server
// for an example
//

const { default: cosmosServer } = require("@zeit/cosmosdb-server");
const { CosmosClient } = require("@azure/cosmos");
const https = require("https");

cosmosServer().listen(3000, () => {
  console.log(`Cosmos DB server running at https://localhost:3000`);

  runClient().catch(console.error);
});

async function runClient() {
  const client = new CosmosClient({
    endpoint: `https://localhost:3000`,
    key: "pass",
    // disable SSL verification
    // since the server uses self-signed certificate
    agent: https.Agent({ rejectUnauthorized: false })
  });

  // initialize databases since the server is always empty when it boots
  const { database } = await client.databases.createIfNotExists({ id: 'test' });
  const { container } = await database.containers.createIfNotExists({ id: 'test' });
}
