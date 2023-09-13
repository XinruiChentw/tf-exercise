terraform {
  backend "s3" {
    bucket = "xr-tf-backends"
    key    = "backends/terraform.tfstate"
    region = "ap-east-1"
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0.0"
    }
  }
  required_version = ">= 1.2.0"
}

provider "aws" {
  region  = "ap-east-1"
}
