module "vpc" {
  source           = "./modules/vpc"
  vpc_cidr         = "172.0.0.0/16"
  public_subnet_cidr  = "172.0.1.0/24"
  private_subnet_cidr = "172.0.2.0/24"
}

module "ec2" {
  source      = "./modules/ec2"
  ami_id      = "ami-12345678"
  instance_type = "t2.micro"
  subnet_id   = module.vpc.public_subnet_id
  vpc_id      = module.vpc.vpc_id
}

module "rds" {
  source      = "./modules/rds"
  db_name     = "mydb"
  db_username = "Admin"
  db_password = "P@ssw0rd123"
}

module "ecr" {
  source           = "./modules/ecr"
  repository_name  = "my_app_repo"
}
