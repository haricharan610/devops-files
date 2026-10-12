module "vpc" {
    source = "../terraform-aws-vpc"
    project = "roboshop"
    environment = "dev"
    public_subnet_cidrs = var.public_subnet_cidrs
    private_subnet_cidrs = var.private_subnet_cidrs
    database_subnet_cidrs = var.database_subnet_cidrs
}