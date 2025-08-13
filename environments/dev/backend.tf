terraform {
  backend "s3" {
    bucket         = "terraform-state-naman"
    key            = "dev/terraform.tfstate"
    region         = "ap-southeast-2"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}
