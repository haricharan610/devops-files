variable "security_groups_ids" {
    default = ["sg-0190544f7d499a8d4"]
    
}

variable "tags" {
    default = {
        Name = "roboshop-cart"
        terraform = "true"
        environment = "dev"
    }
  
}

variable "instance_type" {
    default = "t3.small"
  
}