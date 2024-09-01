variable "ami_id" {
  type=string
  default = "ami-041e2ea9402c46c32"
}

variable "security_ids" {
  type=list 
  default = ["sg-0207c88a92002e4e8"]
}

variable "instance_type" {
  default = "t3.micro"
}

variable "tags" {
  type=map 
  default = {
    #Empty not mandatory
  }
}

