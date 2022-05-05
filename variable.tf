variable "vpc_cidr_block" {  
   description = "CIDR block for VPC" 
   type = string
}
variable "vpc_name" {
   description = "Name of VPC"
   type = string
}
variable "environment" {
   description = "This variable is for tagging"
   type = string
}
