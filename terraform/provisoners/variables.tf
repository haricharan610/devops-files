variable "aws_id" {
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
      "Name" = "hari"
    }
  
}

variable "sg_name" {
    default = "allow-all"
  
}

variable "sg_description" {
    default = "allowing all ports"
  
}


variable "to_port" {
    type = number
    default = 0
  
}

variable "from_port" {
    default = 0
  
}

variable "cidr_blocks" {
    type = list(string)
    default = [ "0.0.0.0/0" ]
  
}

variable "sg_tags" {
    default = {
        default = "allow-all"
    }
  
}