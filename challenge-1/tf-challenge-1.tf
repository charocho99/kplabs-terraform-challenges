terraform {
  required_version = "v0.12.31"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>2.54"
    }
    digitalocean = {
      source = "digitalocean/digitalocean"
    }
  }
}

provider "aws" {

  region = "us-east-1"
  #   access_key = "AKIAIOSFODNN7EXAMPLE"
  #   secret_key = "wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY"
}

resource "aws_eip" "kplabs_app_ip" {
  vpc = true
}
