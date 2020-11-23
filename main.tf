# The configuration for the `remote` backend.
terraform {
  backend "remote" {
    # The name of your Terraform Cloud organization.
    # PUT VARIABLE HERE.        
    organization = "maxim-org"

    # The name of the Terraform Cloud workspace to store Terraform state files in.
    workspaces {
      # PUT VARIABLE HERE.    
      name = "ServerlessFileUploader_Action"
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
  region = "eu-central-1"
}
