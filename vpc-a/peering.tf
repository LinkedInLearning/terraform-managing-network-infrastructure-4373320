data "aws_caller_identity" "current" {}

data "terraform_remote_state" "vpc_b" {
  backend = "local"

  config  = {
    path  = "../vpc-b/terraform.tfstate"
  }

}

resource "aws_vpc_peering_connection" "dev_to_test" {

  # Peer VPC details
  peer_owner_id  = data.aws_caller_identity.current.account_id
  peer_vpc_id    = data.terraform_remote_state.vpc_b.outputs.vpc_id

  # Current VPC details
  vpc_id         = aws_vpc.dev.id
  auto_accept    = true

  tags    = {
    Name  = "dev-to-test"
  }

}

resource "aws_route" "route_to_test" {
  
  # Source route table ID
  route_table_id            = aws_route_table.public.id

  # Destination CIDR / PCX ID
  destination_cidr_block    = data.terraform_remote_state.vpc_b.outputs.vpc_cidr
  vpc_peering_connection_id = aws_vpc_peering_connection.dev_to_test.id

}