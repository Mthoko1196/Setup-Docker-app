provider "aws" {
  region = "us-east-1"  # Replace with your desired region
}

module "vpc" {
  source                  = "./Modules/vpc"
  cidr_block              = "172.16.0.0/16"
  public_subnet_cidr_1    = "172.16.1.0/24"  # Use correct variable names
  public_subnet_cidr_2    = "172.16.3.0/24"  # Ensure these match with the `vpc` module's variables
  private_subnet_cidr_1   = "172.16.2.0/24"
  private_subnet_cidr_2   = "172.16.4.0/24"
  az_1                    = "us-east-1a"
  az_2                    = "us-east-1b"
}

module "ec2" {
  source                  = "./Modules/ec2"
  ami_id                  = "ami-063d43db0594b521b"  # Replace with a valid AMI ID
  instance_type           = "t2.micro"
  subnet_id               = module.vpc.public_subnet_ids[0]  # Use the first public subnet ID
  security_group_id       = module.vpc.public_security_group_id
}

module "rds" {
  source                  = "./Modules/rds"
  db_name                 = "mydatabase"
  db_username             = "admin"
  db_password             = "password123"  # Replace with a secure method for handling sensitive data
  instance_class          = "db.t3.micro"
  allocated_storage       = 20             # Specify the allocated storage in gigabytes
  engine                  = "mysql"        # Specify the database engine (e.g., mysql, postgres)
  engine_version          = "8.0"          # Specify the version of the database engine
  storage_type            = "gp2"          # Specify the storage type (e.g., gp2, io1)
  subnet_ids              = module.vpc.private_subnet_ids
  security_group_id       = module.vpc.private_security_group_id
}