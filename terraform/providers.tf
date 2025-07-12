terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  backend "s3" {
    bucket = "my-medusa-tfstate-20240712"
    key    = "medusa"
    region = "ap-south-1"
  }
}

provider "aws" {
  region = "ap-south-1"
} 