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

resource "aws_security_group" "ssh-allowed" {
    name        = "allow_ssh"
    vpc_id      = aws_vpc.main.id
    tags = {
           Name        = "${var.vpc_name}"
           Environment = "${var.environment}"
          }
    egress {
        from_port = 0
        to_port = 0
        protocol = -1
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        // This means, all ip address are allowed to ssh ! 
        cidr_blocks = ["0.0.0.0/0"]
    }
    //If you do not add this rule, you can not reach the instance
    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
}
