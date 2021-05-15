resource "aws_security_group" "sg_22" {
  name = "sg_22"
  vpc_id = aws_vpc.main.id
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



resource "aws_instance" "proj2" {
ami = "ami-0ca5c3bd5a268e7db "
instance_type = "t2.micro"
subnet_id = aws_subnet.subnet4.id
associate_public_ip_address = "true"
vpc_security_group_ids = ["${aws_security_group.sg_22.id}"]
tags = { name = "proj2"}
}
