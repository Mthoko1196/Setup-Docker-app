provider "aws" {
  region = "us-east-1"  # Replace with your desired region
}

module "vpc" {
  source                  = "./Modules/vpc"
  cidr_block              = "172.16.0.0/16"
  public_subnet_cidr      = "172.16.1.0/24"
  private_subnet_cidr     = "172.16.2.0/24"
}

module "ec2" {
  source                  = "./Modules/ec2"
  ami_id                  = "ami-0c55b159cbfafe1f0"  # Replace with a valid AMI ID for your region
  instance_type           = "t2.micro"
  subnet_id               = module.vpc.public_subnet_id
  security_group_id       = module.vpc.public_security_group_id
}

module "rds" {
  source                  = "./Modules/rds"
  db_name                 = "mydatabase"
  db_username             = "admin"
  db_password             = "password123"
  instance_class          = "db.t3.micro"
  subnet_ids              = [module.vpc.private_subnet_id]
  security_group_id       = module.vpc.private_security_group_id
}
