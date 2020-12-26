variable "aws_access_key_id" {
  type = string
}
variable "aws_secret_access_key" {
  type = string
}


terraform {
  backend "remote" {      
    organization = "maxim-org"
    # I can use "token" here
    
    workspaces {
      prefix = "fileuploader-"
    }
  } 
}



terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region     = "eu-central-1"
  access_key = var.aws_access_key_id
  secret_key = var.aws_secret_access_key
}


# resource "aws_s3_bucket" "example" {
#   bucket = "example"
# }

# resource "aws_s3_access_point" "example" {
#   bucket = aws_s3_bucket.example.id
#   name   = "example"
# }

resource "aws_s3_bucket" "static-website" {
  bucket = "{{SED-GITHUB_REPOSITORY}}-{{SED-GITHUB_REF}}"
  acl    = "public-read"
  tags = {
    Name = "{{SED-GITHUB_REPOSITORY}}-{{SED-GITHUB_REF}}"
    #Name        = "{{!SED-GITHUB_REPOSITORY}}-{{!SED-GITHUB_REF}}"
    # Environment = "Dev"
  }
  # policy = file("policy.json")

  #   website {
  #     index_document = "index.html"
  #     error_document = "error.html"

  #     routing_rules = <<EOF
  # [{
  #     "Condition": {
  #         "KeyPrefixEquals": "docs/"
  #     },
  #     "Redirect": {
  #         "ReplaceKeyPrefixWith": "documents/"
  #     }
  # }]
  # EOF
  #   }
}
