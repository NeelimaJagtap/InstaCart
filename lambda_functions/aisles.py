import boto3
import csv

def lambda_handler(event, context):
    region='us-west-1'
    recList=[]
    try:            
        s3=boto3.client('s3')            
        dyndb = boto3.client('dynamodb', region_name=region)
        confile= s3.get_object('s3://instacartdata225/Instacart/aisles/', Key='aisles.csv')
        recList = confile['Body'].read().split('\n')
        firstrecord=True
        csv_reader = csv.reader(recList, delimiter=',', quotechar='"')
        for row in csv_reader:
            if (firstrecord):
                firstrecord=False
                continue
            order_id = row[0]
            user_id = row[1].replace(',','') if row[1] else 0
            eval_set = row[2].replace(',','') if row[2] else '-'
            order_number = row[3].replace(',','') if row[3] else 0
            order_dow = row[4].replace(',','') if row[4] else 0
            order_hour_of_day = row[5].replace(',','') if row[5] else 0

            response = dyndb.put_item(
                TableName='emplist',
                Item={
                'aisle_id' : {'N':str(aisle_id)},
                'aisle': {'S':str(aisle)}
                }
            )
        print('Put succeeded:')
    except:
        print ("error")