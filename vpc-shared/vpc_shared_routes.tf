# Use custom TGW route tables for additional traffic segregation
resource "aws_ec2_transit_gateway_route_table" "shared" {
  transit_gateway_id = data.terraform_remote_state.vpc_a.outputs.tgw_id

  tags = {
    Name = "tgw-rtb-shared"
  }

}

# Attachments get a 1:1 mapping to a route table
resource "aws_ec2_transit_gateway_route_table_association" "shared" {
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.shared.id 
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.shared.id
}

# Propagate shared VPC routes
resource "aws_ec2_transit_gateway_route_table_propagation" "shared_to_dev" {
  transit_gateway_attachment_id  = data.terraform_remote_state.vpc_a.outputs.dev_attachment_id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.shared.id
}

resource "aws_ec2_transit_gateway_route_table_propagation" "shared_to_test" {
  transit_gateway_attachment_id  = data.terraform_remote_state.vpc_b.outputs.test_attachment_id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.shared.id
}

resource "aws_ec2_transit_gateway_route_table_propagation" "shared_to_prod" {
  transit_gateway_attachment_id  = data.terraform_remote_state.vpc_c.outputs.prod_attachment_id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.shared.id
}