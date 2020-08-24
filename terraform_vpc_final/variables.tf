
variable "name" {
default="Eng67.Bari"
}


variable "app_ami_id" {
default="ami-07af865ccd4f26e56"
}

variable "cidr_block" {
default="96.0.0.0/16"
}
variable "cidr_block_pub" {
default="96.0.1.0/24"
}
variable "cidr_block_priv" {
default="96.0.2.0/24"
}
variable "cidr_block_all" {
default="0.0.0.0/0"
}
