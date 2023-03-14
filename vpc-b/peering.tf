data "aws_caller_identity" "current" {}

data "terraform_remote_state" "vpc_a" {
  backend = "local"

  config  = {
    path  = "../vpc-a/terraform.tfstate"
  }

}

resource "aws_route" "route_to_dev" {
  
  # Source route table ID
  route_table_id            = aws_route_table.test.id

  # Destination CIDR / PCX ID
  destination_cidr_block    = data.terraform_remote_state.vpc_a.outputs.vpc_cidr
  vpc_peering_connection_id = data.terraform_remote_state.vpc_a.outputs.peering_connection_id

}