import azure.cosmos.documents as documents
import azure.cosmos.cosmos_client as cosmos_client
import azure.cosmos.exceptions as exceptions
from azure.cosmos.partition_key import PartitionKey
import datetime

import config

HOST = config.settings['host']
MASTER_KEY = config.settings['master_key']
DATABASE_ID = config.settings['database_id']
CONTAINER_ID = config.settings['container_id']

client = cosmos_client.CosmosClient(HOST, {'masterKey': MASTER_KEY}, user_agent="CosmosDBDotnetQuickstart", user_agent_overwrite=True)
database_name = 'trainingdb'
database = client.create_database_if_not_exists(id=database_name)

container_name = 'TrainingContainer'
container = database.create_container_if_not_exists(
    id=container_name, 
    partition_key=PartitionKey(path="/value"),
    offer_throughput=400
)

kv_item = {
    'id': 'Lastname',
    'value': 'Kukreja'
}

container.create_item(body=kv_item)
