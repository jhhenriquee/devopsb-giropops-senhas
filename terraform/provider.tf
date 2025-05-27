terraform {
  backend "s3" {
    bucket = "descomplicando-terraform-devopze2025"
    key    = "statefiles/devopsb-project/terraform.tfstate"
    region = "us-east-1"
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.84.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

