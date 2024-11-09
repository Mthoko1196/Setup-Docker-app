variable "db_name" {
  type        = string
  description = "The name of the RDS database"
}

variable "db_username" {
  type        = string
  description = "The master username for the RDS instance"
}

variable "db_password" {
  type        = string
  description = "The master password for the RDS instance"
}

variable "instance_class" {
  type        = string
  description = "The instance class for the RDS instance (e.g., db.t3.micro)"
}

variable "security_group_id" {
  type        = string
  description = "The security group ID for the RDS instance"
}

variable "subnet_ids" {
  type        = list(string)
  description = "List of subnet IDs for the RDS instance"
}

variable "allocated_storage" {
  type        = number
  description = "The allocated storage in gigabytes for the RDS instance"
}

variable "storage_type" {
  type        = string
  description = "The storage type for the RDS instance (e.g., gp2, io1)"
}

variable "engine" {
  type        = string
  description = "The database engine to use for the RDS instance (e.g., mysql, postgres)"
}

variable "engine_version" {
  type        = string
  description = "The version of the database engine"
}
