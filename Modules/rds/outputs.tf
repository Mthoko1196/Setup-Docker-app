# output "rds_endpoint" {
#   description = "RDS instance endpoint"
#   value       = aws_db_instance.this.endpoint
# }
output "rds_endpoint" {
  value = aws_db_instance.this.endpoint
}