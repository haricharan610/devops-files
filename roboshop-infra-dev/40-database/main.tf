
resource "aws_instance" "mongodb" {
  ami                         = local.ami_id
  instance_type               = "t3.micro"
  vpc_security_group_ids      = [local.mongodb_sg_id]
  subnet_id                   = local.database_subnet_id
  #associate_public_ip_address = true

  tags = merge(
    local.common_tags,
    {
      Name = "${var.project}-${var.environment}"
    }
  )
}

resource "terraform_data" "mongodb" {
  triggers_replace = [
    aws_instance.mongodb.id,
    #aws_instance.database.id
  ]

  provisioner "file" {
    source = "bootstrap.sh"
    destination = "/tmp/bootstrap.sh"
  }

  connection {
    type = "ssh"
    user = "ec2-user"
    password = "Devops321"
    host = aws_instance.mongodb.private_ip
  }

  provisioner "remote-exec" {
    inline = [ 
        "chmod -x /bootstrap.sh",
        "sudo sh /tmp/bootstrap.sh mongodb ${var.environment}"
     ]
    
  }
}