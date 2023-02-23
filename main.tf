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