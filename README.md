# Terraform: Managing Network Infrastructure
This _README.md_ contains notes for video **Using Terraform to provision EC2 instances**.

### Checkout Branch
```shell
git checkout 02_03
```

### Video Links
- [aws_instance Resource](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance)
- [aws_key_pair Resource](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/key_pair)
- [random_id Resource](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/id)

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
