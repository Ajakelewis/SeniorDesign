terraform {
    backend  "s3" {
    region         = "us-west-2"
    bucket         = "cit481proj1bt"
    key            = "ec2/terraform.tfstate" 
    dynamodb_table = "tf-state-lockcit481bt"
    }
} 

provider "aws" {
  region = "us-west-2"
}

resource "aws_security_group" "sg_22" {
  name = "sg_22"
  vpc_id = "vpc-09de4e397d4794ffb"
  ingress {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
  }
 egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
}



resource "aws_instance" "proj1" {
ami = "ami-0ca5c3bd5a268e7db "
instance_type = "t2.micro"

vpc_security_group_ids = ["${aws_security_group.sg_22.id}"]
tags = { name = "proj1"}
}