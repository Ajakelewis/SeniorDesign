# Project 1 - Building a more robust site


## 1st Step:

## Requirment Software tools for this project:
- Ansible (https://www.ansible.com/resources/get-started)
- AWS CLI (https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-welcome.html)
- Terraform (https://www.terraform.io/downloads.html)

It may be useful to have a Linux VM on your machine to work on Ansible playbooks before the AWS infrastructure is completed. However, you can use Vagrant if you want a 
quick and easy way to launch VMs on your local laptop. More info (https://www.vagrantup.com/downloads.html)

The tasks listed below will be completed by creating a Terraform configuration to handle these tasks:
- VPC (subnets, route tables, Internet Gateways, NAT instances, etc)
- IAM (users, groups, policies, etc)
- Service infrastructure (EC2, Application Load Balancers (ALB), Route53, user keys on the instances, etc)

#### Note: It may still be necessary to manually generate a temporary password for other users for something like IAM users.


## Build AWS VPC Infrastructure:

1. To set up the working directory that contains Terraform configuration files, This is the first command to execute after creating a new Terraform configuration:<br>

$ `terraform init`

![](https://miro.medium.com/max/875/1*PLb-9IeHknJ8nuzS6mtaMQ.png)



2. To create an execution plan, use the `terraform plan` command. It displays the resources that constitute its provisions.

$ `terraform plan`

![](https://miro.medium.com/max/875/1*_3GN_BU1ZYoz4XMKo6_VoA.png)

3. The `terraform apply` command is used to make the changes needed to get the configuration to the desired state.<br>

$ `terraform apply -var-file vpc.tf`

![]()

## IAM Infrastructure:

![]()

- $ `terraform init`
- $ `terraform plan`
- $ `terraform apply`

## EC2, Load Balancer, and Route53

![]()

- $ `terraform init`
- $ `terraform plan`
- $ `terraform apply`



## 2nd Step:
## State and Locking

Terraform keeps track of the state of your infrastructure's changes over time. 
It is recommended that you avoid using local state files in favor of a remote backend such as AWS Simple Storage Service (S3). 
S3 will allow your team to track the state of the system over time without having to worry about one person overwriting the work of another.
You can also use AWS DynamoDB to prevent multiple people from making changes at the same time. It is recommended that you use locking with your remote state.
Just keep in mind that you should be able to use a single S3 bucket for all of your state, but DynamoDB locking may require separate tables.
Learn more here: (https://www.terraform.io/docs/backends/types/s3.html)

To use remote state, you must first create the S3 bucket and DynamoDB table. To begin, make a directory with a main.tf file and include the following code:
`resource "aws_s3_bucket" "tf-remote-state" {
  bucket = "name of bucket to create"  Cannot contain capital letters

  versioning {
    enabled = true
  }

  lifecycle {
    prevent_destroy = true
  }
}

resource "aws_dynamodb_table" "dynamodb-tf-state-lock" {
  name            = "tf-state-lock"  This can be any name you want
  hash_key        = "LockID"
  read_capacity   = 20
  write_capacity = 20

  attribute {
    name = "LockID"
    type = "S"
  }

  tags {
    Name = "DynamoDB tf state locking"
  }
}`
Then Run to see what the expected outcome will be: 
$ `terraform plan` 

If satisfied run:
$ `terraform apply`



