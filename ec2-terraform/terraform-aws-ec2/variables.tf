

variable "ami_id" {
  default = "ami-041e2ea9402c46c32"
}

variable "security_id" {
#   default = ["sg-0207c88a92002e4e8"]
}

variable "instance_type" {
  default = "t3.micro"
}

variable "tags" {
  type=map 
#   default = {
#     Name="db"
#   }
}
