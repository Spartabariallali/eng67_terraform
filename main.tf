# This is to launch an AMI on aws 

# What do we want to do and where we would like to create instance 

# syntax is similar to json - "{" to write a block of code 

provider "aws" {

# which region is our ami operating from 

  region = "eu-west-1"


}


# create an instance - launch an instance from the AMI 

resource "aws_instance" "app_instance_eng67_bari" {
	  ami          = "ami-07af865ccd4f26e56"
# what type of ec2 instance do we want to create - T2micro

	  instance_type = "t2.micro"

# setting up public ip

          associate_public_ip_address = true

          tags = {
              Name = "eng67.bari.terraform.ec2"          
          }

}
