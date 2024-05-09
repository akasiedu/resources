resource "aws_s3_bucket" "terraform_state_bucket" {
  bucket = "terraform-ak-backend" # Replace with a unique bucket name
}

resource "aws_s3_bucket_versioning" "versioning_example" {
  bucket = aws_s3_bucket.terraform_state_bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}