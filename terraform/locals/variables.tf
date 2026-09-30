variable "project" {
    default = "shell-script"
  
}

variable "environment" {
    default = "dev"
  
}

variable "component" {
    default = "cart"
  
}


variable "common_tags" {
    default = {
        project = "roboshop"
        terraform = "true"
    }
}