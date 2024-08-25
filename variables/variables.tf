variable "image_id" {
    type = string
    default = "ami-041e2ea9402c46c32"
    description = "RHEL-9 AMI ID"  
}

#  instance_type = "t3.micro"

variable "instance_type" {
    type=string
    default = "t3.micro"
  
}

variable "tags" {
  type=map 
  default={
    Project="Expense"
    Environment="DEV"
    Module="DB"
    Name="DB"
  } 
    
     
}


#  name="allow_ssh"
#  description = "Allow ssh"

variable "sg_name" {
    default = "allow_ssh"  
}

variable "sg_description" {
  default = "Allow_ssh"
}

variable "ssh_port" {
  default = 22
}

variable "tcp_port" {
  default = "tcp"
}

#   cidr_blocks      = ["0.0.0.0/0"]
variable "allowed_cidr" {
    type=list(string)
    default = ["0.0.0.0/0"]
}

