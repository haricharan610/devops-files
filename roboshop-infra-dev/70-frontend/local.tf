locals {
  vpc_id = data.aws_ssm_parameter.vpc_id.value
  ami_id = data.aws_ami.joindevops.id
  frontend_sg_id = data.aws_ssm_parameter.frontend_sg_id.value
  public_subnet_id = split (",", data.aws_ssm_parameter.public_subnet_ids.value) [0]
  # private_subnet_ids = split ("," , data.aws_ssm_parameter.private_subnet_ids.value)

  common_tags = {
    project = var.project
    environment = var.environment
    Terraform = "true"
  }
}