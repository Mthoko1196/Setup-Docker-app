# output "vpc_id" {
#   description = "ID of the VPC"
#   value       = aws_vpc.main.id
# }

# output "public_subnet_id" {
#   description = "ID of the public subnet"
#   value       = aws_subnet.public.id
# }

# output "private_subnet_id" {
#   description = "ID of the private subnet"
#   value       = aws_subnet.private.id
# }

output "vpc_id" {
  value = aws_vpc.this.id
}

output "public_subnet_id" {
  value = aws_subnet.public.id
}

output "private_subnet_id" {
  value = aws_subnet.private.id
}