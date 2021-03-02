import argparse
import time
import os
from azure.eventhub import EventHubProducerClient, EventData
from azure.eventhub.exceptions import EventHubError

parser = argparse.ArgumentParser()
parser.add_argument("EVENT_HUB_NAMESPACE")
parser.add_argument("NAMESPACE_CONNECTION_STRING")
args = parser.parse_args()
EVENT_HUB_NAMESPACE=args.EVENT_HUB_NAMESPACE
NAMESPACE_CONNECTION_STRING=args.NAMESPACE_CONNECTION_STRING

print(NAMESPACE_CONNECTION_STRING)
print(EVENT_HUB_NAMESPACE)


    
producer = EventHubProducerClient.from_connection_string(conn_str="Endpoint=sb://trainingns.servicebus.windows.net/;SharedAccessKeyName=RootManageSharedAccessKey;SharedAccessKey=RjkfPfkGNQ+gomMP7XU1+UKQJCsR/+kIGRRWUrBams0=", eventhub_name="trainingns")
try:
    event_data_batch_with_limited_size = producer.create_batch(max_size_in_bytes=10)
except EventHubError as eh_err:
    print("Sending error: ", eh_err)
