terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.64.0"
    }
  }
 backend "s3" {
    bucket = "daws78s-dev4"
    key    = "multi-provisinary"
    region = "us-east-1"
    dynamodb_table="daws78s-dev4"
  }
}

provider "aws" {
    region="us-east-1"
  # Configuration options
}