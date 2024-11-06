variable "ami_id" {
  description = "Amazon Machine Image ID"
}

variable "instance_type" {
  description = "Instance type for the EC2 instance"
  default     = "t2.micro"
}

variable "subnet_id" {
  description = "Subnet ID for the instance"
}

variable "security_group" {
  description = "Security group for the instance"
}