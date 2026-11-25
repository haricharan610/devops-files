
resource "aws_instance" "frontend" {
  ami           = local.ami_id
  instance_type = "t3.micro"
  vpc_security_group_ids = [local.frontend_sg_id]
  subnet_id = local.public_subnet_id
  #associate_public_ip_address = true

  tags = merge(
    local.common_tags,
    {
        Name = "${var.project}-${var.environment}-frontend"
    }
  )
}



resource "terraform_data" "frontend" {
  triggers_replace = [
    aws_instance.frontend.id
  ]

  connection {
    type     = "ssh"
    user     = "ec2-user"
    password = "DevOps321"
    host     = aws_instance.frontend.private_ip
  }

  provisioner "file" {
  source      = "frontend.sh"
  destination = "/tmp/frontend.sh"
}

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/frontend.sh",
      "sudo sh /tmp/frontend.sh frontend ${var.environment}"
    ]
  }
}


resource "aws_route53_record" "frontend" {
  zone_id = var.zone_id
  name    = "frontend-${var.environment}.${var.zone_name}"
  type    = "A"
  ttl     = 1
  records = [aws_instance.frontend.public_ip]
  allow_overwrite = true
}