terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.98.0"
    }
  }

  backend "s3" {
    bucket = "hari-terraform-state-2026"
    key    = "roboshop-dev-bastion"
    region = "us-east-1"
    encrypt        = true
    use_lockfile = true
  }
}

provider "aws" {
  # Configuration options
  region = "us-east-1"
}



data "aws_ami" "joindevops" {
    most_recent = true
    owners = "378149659803"


    filter {
      name = "name"
      values = ["Redhat-9-DevOps-Practice"]
    }

    filter {
      name = "virtualization-type"
      values = ["hvm"]
    }
  
}

data "aws_ssm_parameter" "backend_sg_id" {
    name = "/${roboshop}/${dev}/bastion_sg_id"
  
}

data "aws_ssm_parameter" "public_subnet_id" {
    name = "/${roboshop}/${dev}/public_subnet_id"
  
}


