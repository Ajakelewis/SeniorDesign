import boto3

ec2 = boto3.resource('ec2')
client = boto3.client('ec2')
elbv2client = boto3.client('elbv2')

def lambda_handler(event, context):


    response = client.describe_instances()
    for reservation in response["Reservations"]:
            for instance in reservation["Instances"]:
                if instance['State']['Name'] == 'running':
                    RunningInstances=instance["InstanceId"]
    
    
    instanceID = str(RunningInstances)
    instanceID = instanceID.replace('[', '')
    instanceID = instanceID.replace(']', '')
    instanceID = instanceID.replace("'", '')
    
    
    response = elbv2client.deregister_targets(
        TargetGroupArn='arn:aws:elasticloadbalancing:us-west-2:290943450292:targetgroup/project2/f44c702a0068c942',
        Targets=[
            {
                'Id': instanceID,
            },
        ],
    )
    
    
    import time
    time.sleep(270)
    
    
    prices=client.describe_spot_price_history(InstanceTypes=['t2.micro'],MaxResults=1,ProductDescriptions=['Linux/UNIX'],AvailabilityZone='us-west-2a')
    print (prices['SpotPriceHistory'][0])
    prices=client.describe_spot_price_history(InstanceTypes=['t2.micro'],MaxResults=1,ProductDescriptions=['Linux/UNIX'],AvailabilityZone='us-west-2b')
    print (prices['SpotPriceHistory'][0])
    prices=client.describe_spot_price_history(InstanceTypes=['t2.micro'],MaxResults=1,ProductDescriptions=['Linux/UNIX'],AvailabilityZone='us-west-2c')
    print (prices['SpotPriceHistory'][0])
    
    
    regions=['us-east-1','us-east-2','us-west-1','us-west-2']
    for i in regions:    
        regionclient = boto3.client('ec2',region_name=i)
        response = regionclient.describe_instances()
        for reservation in response["Reservations"]:
            for instance in reservation["Instances"]:
                if instance['State']['Name'] == 'running':
                    print(instance["InstanceId"], "is located in", instance["Placement"])
                    
                    
    response = client.request_spot_instances(
        DryRun=False,
        InstanceCount=1,
        Type='one-time',
        LaunchSpecification={
            'ImageId': 'ami-0e32ffd303312650c',
            'SecurityGroupIds': [
                'sg-fcbf81c4',
            ],
            'InstanceType': 't2.micro',
            'Placement': {
                'AvailabilityZone': 'us-west-2c'
            },
        }
    )
    
    
    time.sleep(120)
    
    
    response = client.describe_instances()
    for reservation in response["Reservations"]:
            for instance in reservation["Instances"]:
                if instance['State']['Name'] == 'running':
                    RunningInstances=instance["InstanceId"]
                    
                    
    instanceID = str(RunningInstances)
    instanceID = instanceID.replace('[', '')
    instanceID = instanceID.replace(']', '')
    instanceID = instanceID.replace("'", '')
    
    
    response = elbv2client.register_targets(
        TargetGroupArn='arn:aws:elasticloadbalancing:us-west-2:290943450292:targetgroup/project2/f44c702a0068c942',
        Targets=[
            {
                'Id': instanceID,
            },
        ],
    )