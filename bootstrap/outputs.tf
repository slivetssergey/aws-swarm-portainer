output "s3_backend_bucket" {
  value = aws_s3_bucket.this.id
}

output "s3_backend_region" {
  value = aws_s3_bucket.this.region
}

output "dynamodb_lock_table" {
  value = aws_dynamodb_table.this.id
}

output "bucket" {
  value = aws_s3_bucket.this.id
}

output "region" {
  value = var.region
}
