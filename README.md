# Terraform: Managing Network Infrastructure
This _README.md_ contains notes for video **Building public subnets in AWS with Terraform**.

### Checkout Branch
```shell
git checkout 02_04
```

### Video Links
- [AWS Internet Gateway](https://docs.aws.amazon.com/vpc/latest/userguide/VPC_Internet_Gateway.html)
- [aws_internet_gateway Resource](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/internet_gateway)
- [aws_route_table Resource](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table)
- [aws_route_table_association Resource](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table)
- [aws_security_group Resource](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group)
- [aws_network_interface_sg_attachment Resource](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/network_interface_sg_attachment)

### Generate SSH Key Pair
```shell
mkdir -p keys && ssh-keygen -t rsa -f keys/ec2 -b 4096
```

### Connecting to Instance
Connect to EC2 - replace _1.2.3.4_ with public IP generated from Terraform outputs.
```shell
ssh -i keys/ec2 ubuntu@1.2.3.4
```

### Provision Infrastructure
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
