variable "project_name" {
  default = "expense"
}

variable "common_tags" {
  default = {
    Terraform=true 
    Project="expense"
    Environment="dev"
  }
}

variable "public_subnet_cidrs" {
  default = ["10.0.1.0/24","10.0.2.0/24"]
}

### PRIVATE
variable "private_subnet_cidrs" {
  default = ["10.0.11.0/24","10.0.12.0/24"]
}


### DATABASE
variable "database_subnet_cidrs" {
  default = ["10.0.21.0/24","10.0.22.0/24"]
}

variable "is_peering_required" {
  default = true
}



