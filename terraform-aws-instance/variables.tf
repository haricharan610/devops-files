variable "ami_id" {
    type = string
    default = "ami-0220d79f3f480ecf5"
    description = "AMI id of RHEl9"
}

variable "instance_type" {
    default = "t3.micro"
    type = string
    description = "instance size"
  
}

variable "sg_id" {
    type = list
  
}

variable "tags" {
    type = map
  
}