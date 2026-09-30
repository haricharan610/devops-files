variable "ami_id" {
    type = string
    default = "ami-0220d79f3f480ecf5"
    description = "AMI id of RHEL9"
}

variable "instance_type" {
    default = "t3.micro"
}

variable "instances" {
    default = {
       mongodb = "t3.micro"
       mysql = "t3.small"
       python = "t3.micro"
       redis = "t3.small"

    }
  
}

variable "sg_name" {
    default = "allow-all"  
}


variable "sg_description" {
    default = "allowing all ports"
  
}


variable "to_port" {
    default = 0
}

variable "from_port" {
    default = 0
}


variable "cidr_block" {
    type = list(string)
    default = [ "0.0.0.0/0" ]
  
}

variable "sg_tags" {
    default = {
      Name = "allow-all"

    }
  
}


variable "environment" {
    default = "dev"
  
}


variable "zone_id" {
    default = "Z03555251I5VDDL5ZD8LA"
  
}


variable "domain_name" {
    default = "nadalla.store"
  
}

