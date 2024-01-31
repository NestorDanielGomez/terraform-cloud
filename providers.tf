terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.43.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.6.0"
    }
  }
  required_version = "1.7.1"
}

provider "aws" {
  region = "us-east-1"
  access_key = var.acces_key
  secret_key = var.secret_key
  # Configuration options
  default_tags {
    tags = var.tags
  }
}

