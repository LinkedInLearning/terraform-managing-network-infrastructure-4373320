output "vpc_id" {
  description  = "ID of AWS VPC"
  value        = aws_vpc.shared.id
}

output "vpc_cidr" {
  description  = "CIDR of AWS VPC"
  value        = aws_vpc.shared.cidr_block
}

output "subnet_id" {
  description  = "ID of AWS subnets"
  value        = aws_subnet.shared.id
}

output "instance_id" {
  description  = "ID of AWS instances"
  value        = aws_instance.shared.id
}

output "private_ip" {
  description  = "Private IP of AWS instances"
  value        = aws_instance.shared.private_ip
}

output "public_ip" {
  description  = "Public IP of AWS instances"
  value        = aws_instance.shared.public_ip
}