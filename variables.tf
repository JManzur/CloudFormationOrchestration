variable "aws_region" {
  type = string
  description = "The AWS Region in which you want to deploy the resources"
}

variable "aws_profile" {
  type = string
  description = "Your AWS CLI named profile "
}

variable "subnet_id" {
  type = string
  description = "The VPC Subnet ID  in which you want to deploy the EC2 instance"
}

variable "ssh_key" {
  type = string
  description = "The name of your ec2 key pair"
}