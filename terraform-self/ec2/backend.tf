terraform {
  backend "s3" {
    bucket = "terraform-ak-backend"
    key = "ec2/terraform.tfstate"
    region = "us-east-1"
  }
}