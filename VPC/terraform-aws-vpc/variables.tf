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


### PRIVATE SUBNET

variable "private_subnet_cidrs" {
  type=list
  validation {
    condition = length(var.private_subnet_cidrs) == 2
    error_message = "Please provide 2 valid private subnets CIDR"
  }

}

variable "private_subnet_cidrs_tags" {
  default = {}
}


### DATABASE SUBNET 
variable "database_subnet_cidrs" {
  type=list
  validation {
    condition = length(var.database_subnet_cidrs) == 2
    error_message = "Please provide 2 valid database subnets CIDR"
  }

}

variable "database_subnet_cidrs_tags" {
  default = {}
}

### NAT GATEWAY

variable "nat_gateway_tags"{
  default={}
}



##### ROUTE TABLE TAGS
## PUBLIC


variable "public_route_table_tags" {
  default = {}
}

### PRIVATE ROUTE TABLE TAGS
variable "private_route_table_tags" {
  default = {}
}


#DATABASE ROUTE TABLE TAGS
variable "database_route_table_tags" {
  default = {}
}


#PEERING RELATED VARIABLES

#### Peering ####
  #PEERING
  variable "is_peering_required" {
    type=bool 
    default = false
    
  }

  variable "acceptor_vpc_id" {
    type=string 
    default = ""
  }


  variable "vpc_peering_tags" {
    type=map 
    default = {}
  }

variable "database_subnet_group_tags" {
  default = {}
}

