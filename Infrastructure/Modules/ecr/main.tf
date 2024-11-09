resource "aws_ecr_repository" "this" {
  name = var.repo_name
  # image_tag_mutability = "MUTABLE"

  lifecycle {
    prevent_destroy = true
  }
}