variable "ami_id" {
    type = string
    default = "ami-0220d79f3f480ecf5"
    description = "AMI id of RHEL9"
  
}

variable "instance_type" {
    default = "t3.micro"
  
}

variable "ec2_tags" {
    type = map(string)
    default = {
      "name" = "roboshop"
      purpose = "DEMO"
    }
  
}

variable "sg_name" {
    default = "allow-all"
  
}

variable "from_port" {
    default = 0
  
}

variable "to_port" {
    type = number
    default = 0
  
}

variable "cidr_block" {
    type = list(string)
    default = [ "0.0.0.0/0" ]
  
}

variable "sg_tags" {
    default = {
      Name = "allowing all ports from internet"

    }
  
}

variable "environment" {
    default = "dev"
  
}

variable "instances" {
    default = {
        mongodb = "t3.micro"
        catalogue = "t3.micro"
        payment = "t3.micro"
    }
  
}

variable "zone_id" {
    default = "Z03555251I5VDDL5ZD8LA"
  
}

variable "domain_name" {
    default = "nadalla.store"
  
}


variable "ingress_ports" {
    default = [
    {
      from_port = 8080
      to_port = 8080


    },
    {
        from_port = 80
        to_port = 80
    },

    {
        from_port = 22
        to_port = 22
    }
    ]
}