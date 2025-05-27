terraform {
  backend "s3" {
    bucket = "descomplicando-terraform-devopze2025"
    key    = "project"
    region = "us-east-1"
  } 

 required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

