data "terraform_remote_state" "vpc_a" {
  backend = "local"

  config  = {
    path  = "../vpc-a/terraform.tfstate"
  }

}

data "terraform_remote_state" "vpc_b" {
  backend = "local"

  config  = {
    path  = "../vpc-b/terraform.tfstate"
  }

}

data "terraform_remote_state" "vpc_c" {
  backend = "local"

  config  = {
    path  = "../vpc-c/terraform.tfstate"
  }

}

resource "aws_vpc" "shared" {
  cidr_block  = var.vpc_cidr

  tags = {
    Name = local.vpc_name
  }

}

resource "aws_subnet" "shared" {
  vpc_id      = aws_vpc.shared.id

  cidr_block  = local.subnet_cidr

  tags = {
    Name = local.subnet_name
  }

}

resource "aws_internet_gateway" "shared" {
  vpc_id = aws_vpc.shared.id

  tags    = {
    Name  = "igw-shared"
  }

}

resource "aws_route_table" "shared" {
  vpc_id = aws_vpc.shared.id

  route {
    cidr_block         = "10.0.0.0/8"
    transit_gateway_id =  data.terraform_remote_state.vpc_a.outputs.tgw_id
  }

  route {
    cidr_block         = "0.0.0.0/0"
    gateway_id         = aws_internet_gateway.shared.id
  }

  tags    = {
    Name  = local.rtb_name
  }

}

resource "aws_route_table_association" "shared" {
  subnet_id       = aws_subnet.shared.id
  route_table_id  = aws_route_table.shared.id
}

resource "aws_ec2_transit_gateway_vpc_attachment" "shared" {
  vpc_id              = aws_vpc.shared.id
  subnet_ids          = [aws_subnet.shared.id]
  transit_gateway_id  = data.terraform_remote_state.vpc_a.outputs.tgw_id 

  # Disable association with default route table
  transit_gateway_default_route_table_association = false

  # Disable propagation to default route table
  transit_gateway_default_route_table_propagation = false

  tags = {
    Name = format("attachment-%s", local.vpc_name)
  }

}