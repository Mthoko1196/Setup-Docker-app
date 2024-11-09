resource "aws_ecr_repository" "this" {
  name = var.repo_name

  lifecycle {
    prevent_destroy = true
  }
}