data "terraform_remote_state" "vpc_a" {
  backend = "local"

  config  = {
    path  = "../vpc-a/terraform.tfstate"
  }

}

resource "aws_vpc" "prod" {
  cidr_block  = var.vpc_cidr

  tags = {
    Name = local.vpc_name
  }

}

resource "aws_subnet" "prod" {
  vpc_id      = aws_vpc.prod.id

  cidr_block  = local.subnet_cidr

  tags = {
    Name = local.subnet_name
  }

}

resource "aws_internet_gateway" "prod" {
  vpc_id = aws_vpc.prod.id

  tags    = {
    Name  = "igw-prod"
  }

}

resource "aws_route_table" "prod" {
  vpc_id = aws_vpc.prod.id

  route {
    cidr_block         = "10.0.0.0/8"
    transit_gateway_id =  data.terraform_remote_state.vpc_a.outputs.tgw_id
  }

  route {
    cidr_block         = "0.0.0.0/0"
    gateway_id         = aws_internet_gateway.prod.id
  }

  tags    = {
    Name  = local.rtb_name
  }

}

resource "aws_route_table_association" "prod" {
  subnet_id       = aws_subnet.prod.id
  route_table_id  = aws_route_table.prod.id
}

resource "aws_ec2_transit_gateway_vpc_attachment" "prod" {
  vpc_id              = aws_vpc.prod.id
  subnet_ids          = [aws_subnet.prod.id]
  transit_gateway_id  = data.terraform_remote_state.vpc_a.outputs.tgw_id 

  # Disable association with default route table
  transit_gateway_default_route_table_association = false

  # Disable propagation to default route table
  transit_gateway_default_route_table_propagation = false

  tags = {
    Name = format("attachment-%s", local.vpc_name)
  }

}