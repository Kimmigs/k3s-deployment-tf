#
# Provider Configuration
#

terraform {
  required_providers {
    random = {
      source  = "hashicorp/random"
      version = "~> 3.1.0"
    }
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.46.0"

    }
  }
}

provider "aws" {
  region = "us-east-1"
}