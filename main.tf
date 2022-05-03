# AWS provider version definition
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

#Grabbing latest Linux 2 AMI
data "aws_ami" "linux2" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm*"]
  }
}

# Read CloudFormation Template Content
data "local_file" "ec2" {
  filename = "${path.module}/ec2.yml"
}

# Deploy CloudFormation Template
resource "aws_cloudformation_stack" "ec2" {
  name = "look-what-terraform-can-do"
  capabilities = ["CAPABILITY_NAMED_IAM"]

  parameters = {
    NamePrefix   = "JM-POC"
    InstanceType = "t2.micro"
    VolumeSize   = 10
    AMI          = data.aws_ami.linux2.id
    Key          = "jmanzur"
    SubnetID     = "subnet-05b71d10d038b9900"
  }

  template_body = data.local_file.ec2.content

  tags = {
    Application = "Terraform Demo"
    CreatedBy   = "JManzur"
    CreatedDate = formatdate("YYYY-MM-DD", timestamp())
    Env         = "POC"
  }

  lifecycle {
    ignore_changes = [
      tags["CreatedDate"]
    ]
  }
}