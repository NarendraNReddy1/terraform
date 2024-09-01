
variable "ami_id" {
#   default = "ami-041e2ea9402c46c32"
}

variable "security_id" {
#   type=list 
#   default = ["sg-0207c88a92002e4e8"]
}

variable "tags" {
#   type=map   
#   default = {
#     Name="db"
#   }
}

variable "instance_type" {
    # type = string
    # default = "t3.micro"
}    