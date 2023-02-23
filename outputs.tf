output "vpc_id" {
  description  = "ID of AWS VPC"
  value        = aws_vpc.dev.id
}

output "subnet_id" {
  description  = "ID of AWS subnets"
  value        = aws_subnet.dev.*.id
}