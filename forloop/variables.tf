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

variable "instance_names" {
  type=map 
  default = {
    db="t3.small" #each.key,each.value
    backend="t3.micro"
    frontend="t3.micro"
  }
}

variable "common_tags" {
  type=map 
  default={
    Project="Expense"
    Environment="Dev"
    Terraform="true"

  }      
}

