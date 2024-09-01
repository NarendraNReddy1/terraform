module "ec2-test" {
    source = "../terraform-aws-ec2"
    ami_id = "ami-041e2ea9402c46c32"
    security_id = ["sg-0207c88a92002e4e8"]
    tags={
    Name="db"
  }
    instance_type="t3.small"
}