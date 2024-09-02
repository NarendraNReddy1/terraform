module "ec2-test2" {
  source = "../terraform-aws-ec2"
  ami_id = "ami-041e2ea9402c46c32"
  instance_type = "t3.small"
  security_id= ["sg-0207c88a92002e4e8"]
  tags={
    Name="db"
  }

  
}