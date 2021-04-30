variable "aws_access_key" {}
variable "aws_secret_key" {}

variable "aws_region" {
    description = "EC2 Region for the VPC"
    default = "us-west-2"
}
variable "availability_zone1" {
    description = "Avaialbility Zones"
    default = "us-west-2a"
}

variable "availability_zone2" {
    description = "Avaialbility Zones"
    default = "us-west-2b"
}

variable "availability_zone3" {
    description = "Avaialbility Zones"
    default = "us-west-2c"
}

variable "main_vpc_cidr" {
    description = "CIDR of the VPC"
    default = "10.0.0.0/16"
}

