terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.58.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.6.2"
    }
  }
}

provider "aws" {

  region = "ap-south-1"
}

resource "aws_s3_bucket" "demo-bucket" {
    bucket = "demobucket-${random_id.rand_id.hex}"
  
}
resource "aws_s3_object" "bucket-data" {
   bucket = aws_s3_bucket.demo-bucket.bucket
   key    = "mydata.txt"
   source = "./myfile.txt"
}
resource "random_id" "rand_id" {
  byte_length = 8
}
output "name" {
  value = random_id.rand_id.hex
}