variable "ami_id" {
    type = string
    default = "ami-0220d79f3f480ecf5"
    description = "AMI id of RHEL9"
  
}

variable "instance_type" {
    default = {
        dev = "t3.micro"
        prod = "t3.small"
    }
  
}

variable "project" {
    default = "roboshop"
  
}

variable "comman_tags" {
    default = {
        project = "roboshop"
        terraform = "true"
    }
}


variable "sg_name" {
    default = "allow-all"
}

variable "sg_description" {
    default = "allowing all ports from all IP"
}

variable "instance" {
    default = ["mongodb","redis"]
}

variable "from_port" {
    default = 0
}

variable "to_port" {
    default = 0
}


variable "cidr_blocks" {
    default = ["0.0.0.0/0"]
}