data "aws_vpc" "Terraform-vpc" {
  filter {
    name = "tag:Name"
    values = ["default don't delete"]
  }
}
resource "aws_security_group" "alb-sg" {
  name        = var.alb-sg-name
  vpc_id      = data.aws_vpc.Terraform-vpc.id

  ingress {
    description      = "TLS from VPC"
    from_port        = var.alb-from-port-i1
    to_port          = var.alb-to-port-i1
    protocol         = "tcp"
    cidr_blocks      = [data.aws_vpc.Terraform-vpc.cidr_block]
    
  }

ingress {
    description      = "TLS from VPC"
    from_port        = var.alb-from-port-i2
    to_port          = var.alb-to-port-i2
    protocol         = "tcp"
    cidr_blocks      = [data.aws_vpc.Terraform-vpc.cidr_block]
    
  }
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    
  }

  
}
