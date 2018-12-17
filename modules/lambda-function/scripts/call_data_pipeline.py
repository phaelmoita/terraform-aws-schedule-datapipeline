from __future__ import print_function

import json
import urllib
import boto3
import datetime
import os

client = boto3.client('datapipeline')
pipeline_id = os.environ.get('DATA_PIPELINE_IP')

def lambda_handler(event, context):
    response = client.activate_pipeline(pipelineId=pipeline_id, startTimestamp=datetime.datetime.now())
    print(response)
    return {
        'statusCode': 200,
        'body': response
    }