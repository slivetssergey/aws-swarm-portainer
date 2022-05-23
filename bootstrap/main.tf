terraform {
  required_version = ">= 0.14.9"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.4.0"
    }
  }
}

provider "aws" {
  region  = var.region
  profile = var.profile
}

# S3 bucket for storing state file
resource "aws_s3_bucket" "this" {
  bucket = "${var.organization}-tf-state"

  lifecycle {
    prevent_destroy = true
  }
}

resource "aws_s3_bucket_versioning" "this" {
  bucket = aws_s3_bucket.this.id
  versioning_configuration {
    status = "Enabled"
  }
}

# DynamoDB table for locking the state file
resource "aws_dynamodb_table" "this" {
  name           = "${var.organization}-tf-state"
  hash_key       = "LockID"
  read_capacity  = 20
  write_capacity = 20

  attribute {
    name = "LockID"
    type = "S"
  }

  lifecycle {
    prevent_destroy = true
  }
}
