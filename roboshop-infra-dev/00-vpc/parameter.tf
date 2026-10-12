resource "aws_ssm_parameter" "vpc_ids" {
    name = "/{var.project}/${var.environment}/vpc_idss"
    type = "string"
    value = module.vpc.vpc_ids
  
}

resource "aws_ssm_parameter" "public_subnet_ids" {
    name = "/{var.project}/${var.environment}/public_subnet_ids"
    type = "stringlist"
    value = join(",", module.vpc.public_subnet_ids)
}

resource "aws_ssm_parameter" "private_subnet_ids" {
    name = "/{var.project}/${var.environment}/private_subnet_idss"
    type = "stringlist"
    value = join(",", module.vpc.private_subnet_idss)
}

resource "aws_ssm_parameter" "database_idss" {
    name = "/{var.project}/${var.environment}/database_idss"
    type = "stringlist"
    value = join(",", module.vpc.database_idss)
  
}