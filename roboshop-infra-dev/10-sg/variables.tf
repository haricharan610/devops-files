variable "project" {
    default = "roboshop"
  
}

variable "environment" {
    default = "dev"
  
}

variable "frontend_sg_name" {
    default = "frontend"
  
}

variable "frontend_sg_description" {
    default = "for frontend instance"
  
}

variable "bastion_sg_name" {
    default = "bastion"
  
}

variable "bastion_sg_description" {
    default = "for bastion instance"
  
}

variable "mongodb_ports_vpn" {
  default = [22, 27017]
}

variable "catalogue_ports_vpn" {
  default = [22, 8080]
}

variable "frontend_ports_vpn" {
  default = [22, 80]
}