module "ec2" {
    source = "../terraform-aws-instance"
    sg_id = var.security_groups_ids
    instance_type = var.instance_type
    tags = var.tags
  
}