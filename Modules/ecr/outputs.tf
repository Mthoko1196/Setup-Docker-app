output "repository_uri" {
  description = "URI of the ECR repository"
  value       = aws_ecr_repository.my_app.repository_url
}
