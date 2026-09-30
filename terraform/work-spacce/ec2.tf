resource "aws_instance" "roboshop" {
    count = length(var.instance)
    ami = var.ami_id
    instance_type = lookup(var.instance_type, terraform.workspace)
    vpc_security_group_ids = [ aws_security_group.allow_all.id]


    tags = merge(
        var.comman_tags,
        {
            Name = "${var.project}-${var.instance[count.index]}-${terraform.workspace}"
            component = var.instance[count.index]
            environment = terraform.workspace

        }
    )
  
}

resource "aws_security_group" "allow_all" {
  name        = "${var.project}-${var.sg_name}-${terraform.workspace}" # allow-all-dev
  description = var.sg_description

  ingress {
    from_port        = var.from_port
    to_port          = var.to_port
    protocol         = "-1"
    cidr_blocks      = var.cidr_blocks
    ipv6_cidr_blocks = ["::/0"]
  }
  egress {
    from_port        = var.from_port
    to_port          = var.to_port
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = merge(
    var.comman_tags,
    {
      Name = "${var.project}-${var.sg_name}-${terraform.workspace}"
    }
  )
} 