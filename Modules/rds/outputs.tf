
output "rds_endpoint" {
  description = "Endpoint of the RDS instance"
  value       = aws_db_instance.database.address
}

output "db_name" {
  description = "Name of the RDS database"
  value       = aws_db_instance.database.name
}
