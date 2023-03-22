# Terraform: Managing Network Infrastructure
This _README.md_ contains notes for video **Creating a bare minimum VPC with Terraform**.

### Checkout Branch
```shell
git checkout 02_01
```

### Video Links
- [aws_vpc Resource](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc)
- [aws_subnet Resource](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet)

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
