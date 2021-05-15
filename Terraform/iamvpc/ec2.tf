resource "aws_security_group" "sg_22" {
  name = "sg_22"
  vpc_id = aws_vpc.main.id
  
ingress {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
     ipv6_cidr_blocks = ["::/0"]
  }
ingress {
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
     ipv6_cidr_blocks = ["::/0"]
  } 
ingress {
      from_port   = 443
      to_port     = 443
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
     ipv6_cidr_blocks = ["::/0"]
  }
egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}



resource "aws_spot_instance_request" "proj2" {
ami = "ami-0ca5c3bd5a268e7db"
spot_price             = "0.056"
instance_type = "t2.micro"
key_name = "proj2"
spot_type              = "one-time"
wait_for_fulfillment   = "true"
subnet_id = aws_subnet.subnet4.id
associate_public_ip_address = "true"
vpc_security_group_ids = ["${aws_security_group.sg_22.id}"]
tags = { name = "proj2"}

  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = "${file("proj2.pem")}"
    host        = "${self.public_ip}"
  }
  provisioner "remote-exec" {
    inline = [
      "sudo apt-add-repository -y ppa:ansible/ansible",
      "sudo apt update",
      "sudo apt install -y ansible",
      "sudo apt install -y git",
      "git clone https://github.com/Ajakelewis/SeniorDesign.git",
      "ansible-playbook ~/SeniorDesign/Ansible/project2.yml"
    ]
  }
}