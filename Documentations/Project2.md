# Reducing Cost & Adding Monitoring

## Introduction

We'll concentrate on lowering overall AWS costs by adding spot EC2 instances in this section of the project. 
Second, we'll integrate improved infrastructure monitoring.

# Tasks
1. Spot Instances
2. Serverless Tasks (LAMBDA)
3. Monitoring

## 1. Spot Instances

We updated our terraform to use spot EC2 instances instead of on-demand instances.
We did this because spot instances let you bid on unused capacity, which will save us money on AWS costs in the long run.

While updating our EC2 file to work with spot instances, we reworked the ansible playbook process to be included directly in the creation of the EC2 instance. This allows us to have a quicker deployment with no manual input aside from running the Terraform init, Terraform plan, and Terraform apply commands. 

## 2. Serverless Tasks (LAMBDA)

We created a Lambda function that will be called in the event of a two-minute warning and will perform the following actions:

1. Check current spot price.
2. Remove the instance from the Application Load Balancer (ALB).
3. Place request for new spot instance in a second availability zone.
4. Register the new instance with the Application Load Balancer (ALB).
5. Check what regions are running an instance.

There is also a CloudWatch Event Rule that will run the Lambda function when it detects the two-minute warning.

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

## TLC Certificate

SSH into the instance and run the follow commands to:

Install Snap: sudo snap install core; sudo snap refresh core
Install Certbot: sudo snap install --classic certbot 
Run Certbot: sudo certbot --apache

The Certbot packages that were installed comes with a cron job that renews the certificates automatically before they expire. Thus, we can then test automatic renewal for our certificates by running:

sudo certbot renew --dry-run

