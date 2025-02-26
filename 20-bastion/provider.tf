 terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.85.0"
    }
  }

  backend "s3" {
    bucket = "mohana-tf-remote-state-dev"
    key    = "expense-dev-bastion" # you should have unique keys within the bucket, same key should not use in other repos or tf projects
    region = "us-east-1"
    dynamodb_table = "mohana-state-locking-dev"
  }
}

provider "aws" {
  # Configuration options
  region = "us-east-1"
}