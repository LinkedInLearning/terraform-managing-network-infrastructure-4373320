# Use custom TGW route tables for additional traffic segregation
resource "aws_ec2_transit_gateway_route_table" "dev" {
  transit_gateway_id = data.terraform_remote_state.vpc_a.outputs.tgw_id

  tags = {
    Name = "tgw-rtb-dev"
  }

}

resource "aws_ec2_transit_gateway_route_table" "test" {
  transit_gateway_id = data.terraform_remote_state.vpc_a.outputs.tgw_id

  tags = {
    Name = "tgw-rtb-test"
  }

}

# Attachments get a 1:1 mapping to a route table
resource "aws_ec2_transit_gateway_route_table_association" "dev" {
  transit_gateway_attachment_id  = data.terraform_remote_state.vpc_a.outputs.dev_attachment_id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.dev.id
}

resource "aws_ec2_transit_gateway_route_table_association" "test" {
  transit_gateway_attachment_id  = data.terraform_remote_state.vpc_b.outputs.test_attachment_id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.test.id
}

# Propagate nonprod routes
resource "aws_ec2_transit_gateway_route_table_propagation" "dev_to_shared" {
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.shared.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.dev.id
}

resource "aws_ec2_transit_gateway_route_table_propagation" "dev_to_test" {
  transit_gateway_attachment_id  = data.terraform_remote_state.vpc_b.outputs.test_attachment_id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.dev.id
}

resource "aws_ec2_transit_gateway_route_table_propagation" "test_to_shared" {
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.shared.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.test.id
}

resource "aws_ec2_transit_gateway_route_table_propagation" "test_to_dev" {
  transit_gateway_attachment_id  = data.terraform_remote_state.vpc_a.outputs.dev_attachment_id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.test.id
}