# This is to launch an AMI on aws

# What do we want to do and where we would like to create instance

# syntax is similar to json - "{" to write a block of code

provider "aws" {

# which region is our ami operating from

  region = "eu-west-1"


}


# create an instance - launch an instance from the AMI

resource "aws_instance" "app_instance_eng67_bari" {
	  ami          = var.app_ami_id
# what type of ec2 instance do we want to create - T2micro

	  instance_type = "t2.micro"

# setting up public ip

          associate_public_ip_address = true

          tags = {
              Name = var.name
          }

}


# create subnet block of code
# attatch this subnet to devopstudent vpc

resource "aws_subnet" "eng67_bari_public_subnet" {
  vpc_id     = "vpc-07e47e9d90d2076da"
  cidr_block = "172.31.133.0/24"

  tags = {
    Name = "bari_devops_subnet"
  }
}



# create ingres block of code to allow port 80 and 0.0.0.0/0 - inbound traffic

resource "aws_security_group" "eng67_bari_terraform_sg" {
  name        = "eng67_bari_terraform_sg"
  description = "Allow TLS inbound traffic"
  vpc_id      = "vpc-07e47e9d90d2076da"

  ingress {
    description = "TLS from VPC"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["172.31.133.0/24"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "eng67_terraform_cidr"
  }
}







# create egress block of code to allow all outbound traffic  - outbound traffic
