output "vpc_id" {
  description  = "ID of AWS VPC"
  value        = aws_vpc.test.id
}

output "vpc_cidr" {
  description  = "CIDR of AWS VPC"
  value        = aws_vpc.test.cidr_block
}

output "subnet_id" {
  description  = "ID of AWS subnets"
  value        = aws_subnet.test.id
}

output "instance_id" {
  description  = "ID of AWS instances"
  value        = aws_instance.test.id
}

output "private_ip" {
  description  = "Private IP of AWS instances"
  value        = aws_instance.test.private_ip
}

output "public_ip" {
  description  = "Public IP of AWS instances"
  value        = aws_instance.test.public_ip
}

output "test_attachment_id" {
  description  = "ID of test VPC attachment"
  value        = aws_ec2_transit_gateway_vpc_attachment.test.id
}