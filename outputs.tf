output "vpc_id" {
  description  = "ID of AWS VPC"
  value        = aws_vpc.dev.id
}

output "subnet_id" {
  description  = "ID of AWS subnet"
  value        = aws_subnet.dev.id
}