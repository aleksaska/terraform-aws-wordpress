resource "aws_route53_record" "wwww" {
  zone_id = var.ZONEID
  name    = "wordpress.${var.DOMAIN}"
  type    = "CNAME"
  ttl     = "300"
  records = [aws_elb.bar.dns_name]
  set_identifier = "aws_elb"
  weighted_routing_policy {
  weight = 10
  }
}