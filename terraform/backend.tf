terraform {
  backend "s3" {
    bucket         = "eks-terraform-state-bucket-12345"
    key            = "eks/terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "terraform-lock-table"
    encrypt        = true
  }
}
