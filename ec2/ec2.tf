provider "aws" {
  region = "us-west-2"
}
resource "aws_instance" "proj1" {
ami = "ami-0ca5c3bd5a268e7db "
instance_type = "t2.micro"
tags = { name = "proj1"}
}