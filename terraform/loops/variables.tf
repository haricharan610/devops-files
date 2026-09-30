variable "ami_id" {
    type = string
    default = "ami-0220d79f3f480ecf5"
    description = "AMI id of RHEL9"
}


variable "instance_type" {
    default = "t3.micro"
  
}


variable "instances" {
    default = ["dispatch", "payment", "nodejs", "python3"]
  
}

variable "ec2_tags" {
   type = map(string)
   default = {
     "Name " = "roboshop"
     purpose = "DEMO"

   }
}


variable "sg_name" {
    default = "allow-all"
  
}

variable "sg_description" {
    default = "allowing all ports from internet"
  
}

variable "to_port" {
    default = 0
  
}


variable "from_port" {
    default = 0
  
}

variable "cidr_block" {
    type = list(string)
    default = ["0.0.0.0/0"]

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

