import boto3

ec2 = boto3.resource('ec2')
client = boto3.client('ec2')
elbv2client = boto3.client('elbv2')

'''this is always needed for a python lambda function'''
def lambda_handler(event, context):
    
    response = client.describe_instances()
    for reservation in response["Reservations"]:
            for instance in reservation["Instances"]:
                if instance['State']['Name'] == 'running':
                    RunningInstances=instance["InstanceId"]
                    stopInstance=instance
    
    '''this block puts the value of RunningInstances into a new variable that will the hold the instance id and then remove the [ ] ' characters'''
    instanceID = str(RunningInstances)
    instanceID = instanceID.replace('[', '')
    instanceID = instanceID.replace(']', '')
    instanceID = instanceID.replace("'", '')
    
    '''deregisters an instance from an application load balancer, instanceID is holding a string value of the instance id,
    this function can also register an instance by changing deregister_targets to register_targets, deregistering can take up to 5 minutes'''
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
    
    '''variable to hold the call to stop the instances then the variable is printed to run the calls
    shutDown = ec2.instances.filter(InstanceIds=stopInstance).stop()
    print (shutDown)'''
    
    '''this block checks the current spot price for the us-west-2 availability zones for a Linux t2.micro instance'''
    prices=client.describe_spot_price_history(InstanceTypes=['t2.micro'],MaxResults=1,ProductDescriptions=['Linux/UNIX'],AvailabilityZone='us-west-2a')
    print (prices['SpotPriceHistory'][0])
    prices=client.describe_spot_price_history(InstanceTypes=['t2.micro'],MaxResults=1,ProductDescriptions=['Linux/UNIX'],AvailabilityZone='us-west-2b')
    print (prices['SpotPriceHistory'][0])
    prices=client.describe_spot_price_history(InstanceTypes=['t2.micro'],MaxResults=1,ProductDescriptions=['Linux/UNIX'],AvailabilityZone='us-west-2c')
    print (prices['SpotPriceHistory'][0])
    
    '''this block is a for loop to find any running instances in the US regions'''
    regions=['us-east-1','us-east-2','us-west-1','us-west-2']
    for i in regions:    
        regionclient = boto3.client('ec2',region_name=i)
        response = regionclient.describe_instances()
        for reservation in response["Reservations"]:
            for instance in reservation["Instances"]:
                if instance['State']['Name'] == 'running':
                    print(instance["InstanceId"], "is located in", instance["Placement"])
                else:
                    print("No instances running")
                    
    '''this block requests a new spot instance in a different availability zone'''
    response = client.request_spot_instances(
        DryRun=False,
        InstanceCount=1,
        Type='one-time',
        LaunchSpecification={
            'ImageId': 'ami-090717c950a5c34d3',
            'SecurityGroupIds': [
                'sg-fcbf81c4',
            ],
            'InstanceType': 't2.micro',
            'Placement': {
                'AvailabilityZone': 'us-west-2a'
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
