# creating reusable variables to use for main.tf
# create varable that contains aws instance, ami id, tag

variable "aws_instance" {

     type = string
     default = "app_instance_eng67_bari"

}


variable "name" {

    type = string
    default = "eng67_bari_terraform_ec2"

}


variable "app_ami_id" {

     type = string
     default = "ami-07af865ccd4f26e56"

}


# creating vpc id varibale

#variable "Devops_vpc_id" {

#    type = string
#    default = "vpc-07e47e9d90d2076da"
#}
