resource "aws_vpc" "eng67_bari_terraform_vpc" {
    cidr_block = "10.0.0.0/16"
    enable_dns_support = "true"
    enable_dns_hostnames = "true"
    enable_classiclink = "false"
    instance_tenancy = "default"

    tags = {
        Name = "eng67_bari_terraform_vpc"
    }
}


resource "aws_subnet" "eng67_bari_terraform_subnet" {
    vpc_id = "${aws_vpc.eng67_bari_terraform_vpc.id}"
    cidr_block = "10.0.1.0/24"
    map_public_ip_on_launch = "true"
    availability_zone = "eu-west-1"

    tags = {
        Name = "eng67_bari_terraform_subnet"
    }
}
