output "vpc_id" {
  description  = "ID of AWS VPC"
  value        = aws_vpc.prod.id
}

output "vpc_cidr" {
  description  = "CIDR of AWS VPC"
  value        = aws_vpc.prod.cidr_block
}

output "subnet_id" {
  description  = "ID of AWS subnets"
  value        = aws_subnet.prod.id
}

output "instance_id" {
  description  = "ID of AWS instances"
  value        = aws_instance.prod.id
}

output "private_ip" {
  description  = "Private IP of AWS instances"
  value        = aws_instance.prod.private_ip
}

output "public_ip" {
  description  = "Public IP of AWS instances"
  value        = aws_instance.prod.public_ip
}

output "prod_attachment_id" {
  description  = "ID of prod VPC attachment"
  value        = aws_ec2_transit_gateway_vpc_attachment.prod.id
}