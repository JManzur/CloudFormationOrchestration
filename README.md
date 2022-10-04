# CloudFormation Orchestration using Terraform

This is a manifest that you can use to demonstrate how to deploy CloudFormation templates using terraform.

With this demo, you'll deploy a simple ec2 instance to a pre-existing VPC.

## Tested with: 

| Environment | Application | Version  |
| ----------------- |-----------|---------|
| WSL2 Ubuntu 20.04 | Terraform | v1.3.1 |
| WSL2 Ubuntu 20.04 | AWS CLI | v2.7.29|

## Initialization How-To:
Located in the root directory, create a file called `default.auto.tfvars` with content like the following:

```bash
aws_profile = "your-aws-cli-profile"
aws_region  = "us-east-1"
subnet_id   = "subnet-abc123def456ghi"
ssh_key     = "your-ssh-key"
```

Initialice the direcotry to download the necessary modules and start the backend.

```bash
terraform init
```

## Deployment How-To:

Located in the root directory, run the following command:

```bash
terraform apply
```

## Author:

- [@JManzur](https://jmanzur.com)

## Documentation:

- [Resource: aws_cloudformation_stack](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudformation_stack)