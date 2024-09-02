output "public_ip" {
  value = module.ec2-test2.public_ip
}

output "private_ip" {
  value = module.ec2-test2.private_ip
}
output "instance_id" {
  value = module.ec2-test2.instance_id
}