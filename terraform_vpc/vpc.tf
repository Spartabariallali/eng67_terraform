# creation of a vpc using terraform

provider "aws" {

access_key = "ACCESS_KEY_HERE"
secret_key = "SECRET_KEY_HERE"
region = "eu-west-1"

}

resource "aws_key" "eng67_terraform_vpc" {
  cidr_block = var.cidr_vpc
  enable_dns_support = true
  enable_dns_hostnames = true
  tags {
    "Environment" = var.environment_tag"
  }
}

resource "eng67_terraform_IGW" "igw" {
  vpc_id =
}
