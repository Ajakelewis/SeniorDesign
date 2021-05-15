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
5. Check what regions are running an instance.


## 3. Monitoring

Monitoring is another essential component to include in your infrastructure. 
Though AWS CloudWatch does provide some simple free monitoring, it is far from adequate.
When it comes to monitoring, there are several choices. Here are a couple of options:

* https://www.elastic.co/what-is/elk-stack
* https://prometheus.io/
* Here is a link to setting up an ELK stack: https://phoenixnap.com/kb/how-to-install-elk-stack-on-ubuntu

* Here is a link to setting up Prometheus and Grafana Dashboard:
https://medium.com/devops-dudes/install-prometheus-on-ubuntu-18-04-a51602c6256b

There is an option to perform a manual installation to walk through the setup process. 
Finally, this configuration is already included in an Ansible playbook.

# Additional Setups

## Application Load Balancer

The load balancer distributes incoming application traffic across multiple targets, such as EC2 instances, in multiple Availability Zones.
 
 1. Configure a load balancer and a listener
 2. Configure security settings for an HTTPS listener + group
 3. Configure a target group


Presentation Slides: https://bit.ly/3tJ7F7B

