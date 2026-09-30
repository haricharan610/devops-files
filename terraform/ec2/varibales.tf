variable "ami_id" {
    type = string
    default = "ami-0220d79f3f480ecf5"
    description = "AMI id of RHEL9"
}

variable "environment" {
    default = "dev"
}


variable "ec2_tag" {
    type = map(string)
    default = {
      "Name" = "Helloworld"
      purpose = "demo"
    }
}


variable "sg_name" {
    default = "allow-all"
  
}

variable "sg_description" {
    default = "allowing all ports numbers"
      
}


variable "from_port" {
    default = 0
  
}


variable "to_port" {
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

