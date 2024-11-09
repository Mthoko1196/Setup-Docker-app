output "vpc_id" {
  value = aws_vpc.main.id
}

output "public_subnet_ids" {
  value = [aws_subnet.public_1.id, aws_subnet.public_2.id]
  description = "List of IDs for public subnets"
}

output "private_subnet_ids" {
  value = [aws_subnet.private_1.id, aws_subnet.private_2.id]
  description = "List of IDs for private subnets"
}

output "public_security_group_id" {
  value = aws_security_group.public_sg.id
  description = "ID of the public security group"
}

output "private_security_group_id" {
  value = aws_security_group.private_sg.id
  description = "ID of the private security group"
}

