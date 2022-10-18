terraform 
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}
# Configure the AWS Provider
provider "aws" {
  region = "eu-west-1"
}
module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 3.0"
  name = "single-instance"
  ami                    = "ami-0ea0f26a6d50850c5"
  instance_type          = "t3.micro"
  key_name               = "<sua-chave>"
  monitoring             = true
  vpc_security_group_ids = ["<seu-securitygroup>"]
  subnet_id              = "<sua-subnet>"
  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}
{