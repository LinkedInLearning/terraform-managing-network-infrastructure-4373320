# Terraform: Managing Network Infrastructure
This _README.md_ contains notes for video **Building private subnets in AWS with Terraform**.

### Checkout Branch
```shell
git checkout 02_05
```

### Video Links
- [AWS NAT Gateway](https://docs.aws.amazon.com/vpc/latest/userguide/vpc-nat-gateway.html)
- [aws_nat_gateway Resource](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/nat_gateway)
- [aws_eip Resource](https://registry.terraform.io/providers/-/aws/latest/docs/resources/eip)

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
