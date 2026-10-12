module "vpc" {
    source = "git::https://github.com/haricharan610/devops-files.git//terraform-aws-vpc?ref=main"
    project = var.project
    environment = var.environment
    public_subnet_cidrs = var.public_subnet_cidrs
    private_subnet_cidrs = var.private_subnet_cidrs
    database_subnet_cidrs = var.database_subnet_cidrs
  
}