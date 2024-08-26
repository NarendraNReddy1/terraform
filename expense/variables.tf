# Instance
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

variable "common_tags" {
  type=map 
  default={
    Project="Expense"
    Environment="Dev"
    Terraform="true"

  }      
}


variable "instance_names" {
  type=list 
  default = ["db","backend","frontend"]
}


#  name="allow_ssh"
#  description = "Allow ssh"


#SG 
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


#R53 
variable "zone_id" {
  default = "Z0678312CKW4YMU2Z6SJ"
}

variable "domain_name" {
  default = "narendra.shop"  
}