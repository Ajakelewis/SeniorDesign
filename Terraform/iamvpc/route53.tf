resource "aws_route53_zone" "blueteam-zone" {
   name = "blueteam481.com"
}
resource "aws_elb" "main" {
  name               = "blueteam-terraform-elb"
  availability_zones = ["us-west-2a"]

  listener {
    instance_port     = 80
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }
}

resource "aws_route53_record" "www" {
  zone_id = aws_route53_zone.blueteam-zone.zone_id
  name    = "blueteam481.com"
  type    = "A"

  alias {
    name                   = aws_elb.main.dns_name
    zone_id                = aws_elb.main.zone_id
    evaluate_target_health = true
  }
}

resource "aws_route53_record" "blueteam-zone" {
  allow_overwrite = true
  name            = "blueteam481.com"
  ttl             = 172800
  type            = "NS"
  zone_id         = aws_route53_zone.blueteam-zone.zone_id
  records = [
    aws_route53_zone.blueteam-zone.name_servers[0],
    aws_route53_zone.blueteam-zone.name_servers[1],
    aws_route53_zone.blueteam-zone.name_servers[2],
    aws_route53_zone.blueteam-zone.name_servers[3],
  ]
}