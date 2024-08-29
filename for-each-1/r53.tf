resource "aws_route53_record" "expense" {
  for_each = aws_instance.expense 
  zone_id = "Z0678312CKW4YMU2Z6SJ"
  name    = each.key == "frontend"? var.domain_name:"${each.key}.${var.domain_name}"
  type    = "A"
  ttl     = 1
  records = each.key == "frontend"? [each.value.public_ip]:[each.value.private_ip]
  allow_overwrite = true
}