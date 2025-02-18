terraform {
  required_version = ">= 1.0"

  backend "s3" {
    bucket = "skt-user22-s3-bucket-tfstate"
    key = "terraform.tfstate"
    region = "ap-southeast-1"
    dynamodb_table = "skt-user22-s3-ddb-tflock"
    encrypt = "true"
  }
}

provider "aws" {
  region = var.aws_region
}

data "aws_availability_zones" "available" {
  exclude_names = ["ap-southeast-1a","ap-southeast-1c"]
}

