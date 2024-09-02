#   cidr_block       = "10.0.0.0/16"

### project variables ###
variable "project_name" {
    type=string 
}

variable "environment" {
  type=string
  default = "dev"
}

variable "common_tags" {
  type=map 

}


### VPC ###
variable "vpc_cidr" {
  default = "10.0.0.0/16"
}


variable "enable_dns_hostnames" {
    type=bool
  default = true
}

variable "vpc_tags" {
  type=map 
  default = {}
}


### IGW tags
variable "igw_tags" {
  default = {

  }
}

### PUBLIC SUBNET 

variable "public_subnet_cidrs" {
  type=list
  validation {
    condition = length(var.public_subnet_cidrs) == 2
    error_message = "Please provide 2 valid public subnets CIDR"
  }

}

variable "public_subnet_cidrs_tags" {
  default = {}
}