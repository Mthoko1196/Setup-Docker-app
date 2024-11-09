variable "cidr_block" {
  description = "CIDR block for the VPC"
  default     = "172.0.0.0/16"
}

variable "public_subnet_cidr" {
  description = "CIDR block for the public subnet"
  default     = "172.0.1.0/24"
}

variable "private_subnet_cidr" {
  description = "CIDR block for the private subnet"
  default     = "172.0.2.0/24"
}