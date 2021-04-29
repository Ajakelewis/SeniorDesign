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

We will modify the previous VPC that we built on Project 0, by making the private subnets more useful. To do this we will need to allow instances and other services running in those subnets to initiate connections with the outside world but not allow the outside world to directly access those instances.
To complete this, we will set up a Network Address Translation (NAT) instance in a public subnet and provide it with an elastic IP address (EIP). The NAT's EIP will then be added as the default route to the private subnets' routing tables. In this manner, instances can easily download information such as OS updates. It is recommended that you use a standard instance rather than a NAT Gateway because they are more expensive, but AWS does provide an easy way for you to set up this instance.

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
You will now create more than one instance in EC2. You will create the following instances:

1. NAT Instance (explained as part of the VPC above) 
  -You have the option to use a NAT instance or NAT Gateway. As noted above, there is a higher cost associated with using a NAT Gateway. 
2. Bastion of jump instance
3. Service instances





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

To use remote state, you must first create the S3 bucket and DynamoDB table. To begin, make a directory with a main.tf file and include the following code: <br>
`resource "aws_s3_bucket" "tf-remote-state" {` <br>
  `bucket = "name of bucket to create"  Cannot contain capital letters` <br>

  `versioning {` <br>
    `enabled = true` <br>
  `}` <br>

  `lifecycle {`<br>
    `prevent_destroy = true`<br>
  `}`<br>
`}` <br>

`resource "aws_dynamodb_table" "dynamodb-tf-state-lock" {`<br>
  `name            = "tf-state-lock"` <br> This can be any name you want
  `hash_key        = "LockID"`<br>
  `read_capacity   = 20`<br>
  `write_capacity = 20`<br>

  `attribute {`<br>
    `name = "LockID"`<br>
    `type = "S"`<br>
  `}`<br>

  `tags {`<br>
    `Name = "DynamoDB tf state locking"`<br>
  `}`<br>
`}`<br>
Then Run to see what the expected outcome will be: 
$ `terraform plan` 

If satisfied run: $ `terraform apply`

Now that your bucket and lock have been created add the following to the top of the file: <br>
`terraform {` <br>
    `backend  "s3" {` <br>
    `region         = "us-west-2"` <br>
    `bucket         = "the name of the bucket you created"` <br>
    `key            = "<any name>/terraform.tfstate"` <br> Key can be anything you want
    `dynamodb_table = "tf-state-lock"` <br> Name of lock created above 
    `}`
`}`
Run $ `terraform apply` to apply the changes.

Note: Make sure you never directly enter any secrets into a Terraform file. They will be stored in plain text in the state file, which is never desired. All secrets should be kept in an encrypted storage system and only decrypted when necessary.






