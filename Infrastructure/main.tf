provider "aws" {
  region = "us-east-1"
}

# VPC Module
module "vpc" {
  source                  = "./Modules/vpc"
  cidr_block              = "172.0.0.0/16"
  public_subnet_cidr_1    = "172.0.1.0/24"
  public_subnet_cidr_2    = "172.0.3.0/24"
  private_subnet_cidr_1   = "172.0.2.0/24"
  private_subnet_cidr_2   = "172.0.4.0/24"
  az_1                    = "us-east-1a"
  az_2                    = "us-east-1b"
}

# Security Group for EC2 and RDS
resource "aws_security_group" "web_sg" {
  name_prefix = "web-sg"
  vpc_id      = module.vpc.vpc_id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "rds_sg" {
  name_prefix = "rds-sg"
  vpc_id      = module.vpc.vpc_id

  ingress {
    from_port       = 3306  # MySQL port; update if using a different DB engine
    to_port         = 3306
    protocol        = "tcp"
    security_groups = [aws_security_group.web_sg.id]  # Allow access from EC2
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# EC2 Module
module "ec2" {
  source          = "./Modules/ec2"
  ami_id          = "ami-06b21ccaeff8cd686"  # Update with a valid AMI ID for your region
  instance_type   = "t2.micro"
  subnet_id       = module.vpc.public_subnet_id
  security_group  = aws_security_group.web_sg.id
}

# RDS Module
module "rds" {
  source           = "./Modules/rds"
  db_name          = "mydatabase"
  db_username      = "admin"
  db_password      = "password123"  # For security, store this in a secure secrets manager in real scenarios
  instance_class   = "db.t3.micro"
  allocated_storage = 20
  private_subnet_ids =  module.vpc.private_subnet_ids  # Reference the output as a list  # Ensure these subnets are from different AZs
  security_group_id = aws_security_group.rds_sg.id
}

# ECR Module
module "ecr" {
  source    = "./Modules/ecr"
  repo_name = "my-nginx-app"
}

