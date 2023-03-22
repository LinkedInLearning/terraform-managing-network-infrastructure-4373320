# Terraform: Managing Network Infrastructure
This _README.md_ contains notes for video **Using Segmentation with Transit Gateway and Terraform**.

### Checkout Branch
```shell
git checkout 03_04
```

### Video Links
- [aws_ec2_transit_gateway_route_table Resource](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ec2_transit_gateway_route_table)
- [aws_ec2_transit_gateway_route_table_association Resource](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ec2_transit_gateway_route_table_association)
- [aws_ec2_transit_gateway_route_table_propagation Resource](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ec2_transit_gateway_route_table_propagation)

### Provision Infrastructure
Run Terraform for resources in the following order by switching into folder holding the corresponding configuration:
- vpc-a
- vpc-b
- vpc-c
- vpc-shared

```hcl
terraform init
terraform plan -out=tfplan
terraform apply "tfplan"
```

### Destroy Infrastructure
```hcl
terraform destroy
```

This is the repository for the LinkedIn Learning course `Terraform: Managing Network Infrastructure`. The full course is available from [LinkedIn Learning][https://github.com/LinkedInLearning/terraform-managing-network-infrastructure-4373320].


_See the readme file in the main branch for updated instructions and information._
