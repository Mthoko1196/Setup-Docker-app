variable "db_name" {
  description = "Name of the database"
  type        = string
}

variable "db_username" {
  description = "Master username for the database"
  type        = string
}

variable "db_password" {
  description = "Master password for the database"
  type        = string
  sensitive   = true
}

variable "instance_class" {
  description = "Instance class for the RDS"
  type        = string
  default     = "db.t2.micro"
}

variable "allocated_storage" {
  description = "Storage allocated for the database in GB"
  type        = number
  default     = 20
}

variable "storage_type" {
  description = "Storage type for the database"
  type        = string
  default     = "gp2"
}

variable "engine" {
  description = "Database engine"
  type        = string
  default     = "mysql"
}

variable "engine_version" {
  description = "Database engine version"
  type        = string
  default     = "8.0"
}

variable "private_subnet_ids" {
  description = "List of private subnet IDs in at least 2 different Availability Zones"
  type        = list(string)
}

variable "security_group_id" {
  description = "Security group ID for RDS instance access"
  type        = string
}