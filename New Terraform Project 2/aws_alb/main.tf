provider "aws" {
  region = "us-west-2"
}

resource "aws_load_balancer_target_group" "my_target_group" {
  health_check {
    interval            = 10
    path                = "/"
    protocol            = "HTTP"
    timeout             = 5
    healthy_threshold   = 5
    unhealthy_threshold = 2
  }

  name        = "my_terraform_target"
  port        = 80
  protocol    = "HTTP"
  target_type = "instance"
  vpc_id      = "${var.vpc_id}"
}

resource "aws_load_balancer_target_group_attachment" "my_application_load_balancer_target_group_attachment1" {
  target_group_arn = "${aws_load_balancer_target_group.my_target_group.arn}"
  target_id        = "${var.instance1_id}"
  port             = 80
}
resource "aws_load_balancer_target_group_attachment" "my_application_load_balancer_target_group_attachment2" {
  target_group_arn = "${aws_load_balancer_target_group.my_target_group.arn}"
  target_id        = "${var.instance2_id}"
  port             = 80
}

resource "aws_load_balancer" "my_application_load_balancer" {
  name     = "my_test_application_load_balancer"
  internal = false

  security_groups = [
    "${aws_security_group.my_application_load_balancer_sg.id}",
  ]

  subnets = [
    "${var.sub1}",
    "${var.sub2}",
  ]

  tags = {
    Name = "my_test_application_load_balancer"
  }

  ip_address_type    = "ipv4"
  load_balancer_type = "application"
}

resource "aws_load_balancer_listener" "my_test_application_load_balancer_listner" {
  load_balancer_arn = "${aws_load_balancer.my_aws_application_load_balancer.arn}"
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = "${aws_load_balancer_target_group.my_target_group.arn}"
  }
}

resource "aws_security_group" "my_application_load_balancer_sg" {
  name   = "my_application_load_balancer_sg"
  vpc_id = "${var.vpc_id}"
}

resource "aws_security_group_rule" "inbound_ssh" {
  from_port         = 22
  protocol          = "tcp"
  security_group_id = "${aws_security_group.my_application_load_balancer_sg.id}"
  to_port           = 22
  type              = "ingress"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "inbound_http" {
  from_port         = 80
  protocol          = "tcp"
  security_group_id = "${aws_security_group.my_application_load_balancer_sg.id}"
  to_port           = 80
  type              = "ingress"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "outbound_all" {
  from_port         = 0
  protocol          = "-1"
  security_group_id = "${aws_security_group.my_application_load_balancer_sg.id}"
  to_port           = 0
  type              = "egress"
  cidr_blocks       = ["0.0.0.0/0"]
}
