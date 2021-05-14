
################ VPC #################
resource "aws_vpc" "main" {
  cidr_block       = "${var.main_vpc_cidr}"
  instance_tenancy = "default"
  enable_dns_support = true
  enable_dns_hostnames = true

}

 ################# Subnets #############
resource "aws_subnet" "subnet1" {
  vpc_id     = "${aws_vpc.main.id}"
  cidr_block = "172.31.1.0/24"
  availability_zone = "${var.availability_zone1}"
  tags = {
    Name = "Private Subnet 1"
  }

}
resource "aws_subnet" "subnet2" {
  vpc_id     = "${aws_vpc.main.id}"
  cidr_block = "172.31.2.0/24"
  availability_zone = "${var.availability_zone2}"
  tags = {
    Name = "Private Subnet 2"
  }


}
resource "aws_subnet" "subnet3" {
  vpc_id     = "${aws_vpc.main.id}"
  cidr_block = "172.31.3.0/24"
  availability_zone = "${var.availability_zone3}"
tags = {
    Name = "Private Subnet 3"
  }


}
resource "aws_subnet" "subnet4" {
  vpc_id     = "${aws_vpc.main.id}"
  cidr_block = "172.31.4.0/24"
  availability_zone = "${var.availability_zone1}"
  map_public_ip_on_launch = true
tags = {
    Name = "Public Subnet 1"
  }


}
resource "aws_subnet" "subnet5" {
  vpc_id     = "${aws_vpc.main.id}"
  cidr_block = "172.31.5.0/24"
  availability_zone = "${var.availability_zone2}"
tags = {
    Name = "Public Subnet 2"
  }


}
resource "aws_subnet" "subnet6" {
  vpc_id     = "${aws_vpc.main.id}"
  cidr_block = "172.31.6.0/24"
  availability_zone = "${var.availability_zone3}"
  tags = {
    Name = "Public Subnet 3"
  }


}
resource "aws_subnet" "subnet7" {
  vpc_id     = "${aws_vpc.main.id}"
  cidr_block = "172.31.7.0/24"
  availability_zone = "${var.availability_zone1}"

  tags = {
    Name = "ALB Subnet"
  }


}
resource "aws_subnet" "subnet8" {
  vpc_id     = "${aws_vpc.main.id}"
  cidr_block = "172.31.8.0/24"
  availability_zone = "${var.availability_zone2}"
  tags = {
    Name = "NAT Subnet"
  }


}

######## IGW ###############
resource "aws_internet_gateway" "main-igw" {
  vpc_id = "${aws_vpc.main.id}"


}

########### NAT ##############
resource "aws_eip" "nat" {
vpc = true
}

resource "aws_nat_gateway" "main-natgw" {
  allocation_id = "${aws_eip.nat.id}"
  subnet_id     = "${aws_subnet.subnet8.id}"


}

############# Route Tables ##########

resource "aws_route_table" "main-public-rt" {
  vpc_id = "${aws_vpc.main.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.main-igw.id}"
  }


}

resource "aws_route_table" "main-private-rt" {
  vpc_id = "${aws_vpc.main.id}"
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_nat_gateway.main-natgw.id}"
  }


}

######### PUBLIC Subnet assiosation with route table    ######
resource "aws_route_table_association" "public-assoc-1" {
  subnet_id      = "${aws_subnet.subnet4.id}"
  route_table_id = "${aws_route_table.main-public-rt.id}"
}
resource "aws_route_table_association" "public-assoc-2" {
  subnet_id      = "${aws_subnet.subnet5.id}"
  route_table_id = "${aws_route_table.main-public-rt.id}"
}
resource "aws_route_table_association" "public-assoc-3" {
  subnet_id      = "${aws_subnet.subnet6.id}"
  route_table_id = "${aws_route_table.main-public-rt.id}"
}
resource "aws_route_table_association" "public-assoc-5" {
  subnet_id      = "${aws_subnet.subnet7.id}"
  route_table_id = "${aws_route_table.main-private-rt.id}"
}
resource "aws_route_table_association" "public-assoc-4" {
  subnet_id      = "${aws_subnet.subnet8.id}"
  route_table_id = "${aws_route_table.main-public-rt.id}"
}

########## PRIVATE Subnets assiosation with route table ######
resource "aws_route_table_association" "private-assoc-1" {
  subnet_id      = "${aws_subnet.subnet1.id}"
  route_table_id = "${aws_route_table.main-private-rt.id}"
}
resource "aws_route_table_association" "private-assoc-2" {
  subnet_id      = "${aws_subnet.subnet2.id}"
  route_table_id = "${aws_route_table.main-private-rt.id}"
}
resource "aws_route_table_association" "private-assoc-3" {
  subnet_id      = "${aws_subnet.subnet3.id}"
  route_table_id = "${aws_route_table.main-private-rt.id}"
}
