variable "instance_names" {
    type=map 
    default = {
        db="t3.small"
        backend="t3.micro"
        frontend="t3.micro"
    }
  
}

variable "common_tags" {
    type=map 
    default = {
        Environment="dev"
        Terraform=true 
        Project="expense"
    }
  
}

variable "domain_name" {
    default = "narendra.shop"
  
}