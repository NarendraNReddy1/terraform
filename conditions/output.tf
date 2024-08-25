#resource "aws_instance" "db" { ec2.tf

output "public_ip"{
    value=aws_instance.db.public_ip
}
