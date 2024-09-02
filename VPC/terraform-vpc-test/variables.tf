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