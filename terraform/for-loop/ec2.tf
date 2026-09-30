resource "aws_instance" "roboshop" {
  ami = var.ami_id
  for_each = var.instances
  instance_type = each.value
  vpc_security_group_ids = [ aws_security_group.allow_all.id ]

  tags ={
    Name = each.key
  }
}

 resource "aws_security_group" "allow_all" {
   name        = var.sg_name
   description = var.sg_description


  ingress {
    from_port        = var.from_port 
    to_port          = var.to_port 
    protocol         = "-1"
    cidr_blocks      = var.cidr_block
    ipv6_cidr_blocks = ["::/0"]
  }

  egress {
    from_port        = var.from_port
    to_port          = var.to_port 
    protocol         = "-1"
    cidr_blocks      = var.cidr_block
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = var.sg_tags
}