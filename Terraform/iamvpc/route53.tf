resource "aws_route53_zone" "blueteam" {
   name = "blueteam481.com"
}

resource "aws_route53_record" "blueteam" {
   zone_id = aws_route53_zone.blueteam.zone_id
   name = "blueteam481.com"
   type = "A"

 alias {
   name = aws_lb.my-aws-alb.dns_name
   zone_id = aws_lb.my-aws-alb.zone_id
   evaluate_target_health = true
  }
}
