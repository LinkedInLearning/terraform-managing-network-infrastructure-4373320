resource "aws_vpc" "dev" {
  cidr_block  = var.vpc_cidr

  tags = {
    Name = var.vpc_name
  }

}

resource "aws_subnet" "dev" {
  count       = length(var.subnets)
  vpc_id      = aws_vpc.dev.id

  cidr_block  = cidrsubnet(aws_vpc.dev.cidr_block, 4, count.index + 1)

  tags = {
    Name = var.subnets[count.index]
  }

}

resource "aws_ec2_transit_gateway" "tgw" {
  description = "Managed by Terraform" 

  tags = {
    Name = format("tgw-%s", var.region)
  }

}

resource "aws_ec2_transit_gateway_vpc_attachment" "dev" {
  vpc_id              = aws_vpc.dev.id
  subnet_ids          = [aws_subnet.dev[0].id]
  transit_gateway_id  = aws_ec2_transit_gateway.tgw.id

  tags = {
    Name = format("attachment-%s", var.vpc_name)
  }

}