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