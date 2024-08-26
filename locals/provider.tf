terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.64.0"
    }
  }
}

provider "aws" {
  # Configuration options #Can able to give aws configure credentials. But code should go to github
  region="us-east-1"
}