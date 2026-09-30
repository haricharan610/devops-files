terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.98.0"
    }
  }


backend "s3" {
  bucket = "hari-terraform-state-2026"
  key    = "remote-state-demo"
  region = "us-east-1"
  encrypt = true
  use_lockfile = true
  }
}  


provider "aws" {
  region = "us-east-1"
}