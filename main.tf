resource "aws_vpc" "main" {
   cidr_block       = var.vpc_cidr_block
   instance_tenancy = "default"
   tags = {
           Name        = "${var.vpc_name}"
           Environment = "${var.environment}"
          }
}
resource "aws_instance" "instance" {
  ami           = "ami-0022f774911c1d690"
  instance_type = "t2.micro"

}
