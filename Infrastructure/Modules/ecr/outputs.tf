# output "repository_url" {
#   description = "URL of the ECR repository"
#   value       = aws_ecr_repository.this.repository_url
# }

output "repository_url" {
  value = aws_ecr_repository.this.repository_url
}
