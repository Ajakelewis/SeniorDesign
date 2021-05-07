# Reducing Cost & Adding Monitoring

## Introduction

We'll concentrate on lowering overall AWS costs by adding spot EC2 instances in this section of the project. 
Second, we'll integrate improved infrastructure monitoring.

# Tasks
1. Spot Instances
2. Serverless Tasks (LAMBDA)
3. Monitoring

## 1. Spot Instances

Spot instances are a perfect way to cut the AWS down on costs. 
More Info: https://aws.amazon.com/ec2/spot/?cards.sort-by=item.additionalFields.startDateTime&cards.sort-order=asc

AWS has the replacement computer power available for a fraction of the on-demand cost of instances. 
The one caveat to this solution is that AWS may decide at any time that they require the compute power back. 
When this occurs, they send a two-minute warning that the resource will be reclaimed.



## 2. Serverless Tasks (LAMBDA)

We created a Lambda function that will be called in the event of a two-minute warning and will perform the following actions:

1. Check current spot price.
2. Remove the instance from the Application Load Balancer (ALB).
3. Place request for new spot instance in a second availability zone.
4. Register the new instance with the Application Load Balancer (ALB).
5. Check what regions are running an instance




## 3. Monitoring

