provider "aws" {
  region = "us-west-2"
}

resource "aws_security_group" "port80" {
  name        = "Alex test port80 rule"
  description = "Port 80 open for traffic"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

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

  tags = {
    Name = "port80"
  }
}

resource "aws_instance" "test" {
  depends_on = [aws_security_group.port80]
  ami = "ami-02701bcdc5509e57b"
  instance_type = "t2.micro"
  key_name = "pairTeamBlue"
  iam_instance_profile = "TeamBlueIAM"
  vpc_security_group_ids = [aws_security_group.port80.id]
  tags = {
    Name = "Alex test Ubuntu instance"
  }
}

module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "Alex test Proj0-VPC"
  cidr = "172.31.0.0/16"

  azs             = ["us-west-2a", "us-west-2b", "us-west-2c"]
  private_subnets = ["172.31.32.0/19", "172.31.160.0/19", "172.31.96.0/19"]
  public_subnets  = ["172.31.128.0/19", "172.31.64.0/19", "172.31.0.0/19"]

  enable_nat_gateway = true
  enable_vpn_gateway = true

  tags = {
    Terraform = "true"
    Environment = "dev"
  }
}
