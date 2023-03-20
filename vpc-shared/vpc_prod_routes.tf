# Use custom TGW route tables for additional traffic segregation
resource "aws_ec2_transit_gateway_route_table" "prod" {
  transit_gateway_id = data.terraform_remote_state.vpc_a.outputs.tgw_id

  tags = {
    Name = "tgw-rtb-prod"
  }

}

# Attachments get a 1:1 mapping to a route table
resource "aws_ec2_transit_gateway_route_table_association" "prod" {
  transit_gateway_attachment_id  = data.terraform_remote_state.vpc_c.outputs.prod_attachment_id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.prod.id
}

# Propagate prod VPC routes
resource "aws_ec2_transit_gateway_route_table_propagation" "prod_to_shared" {
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.shared.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.prod.id
}