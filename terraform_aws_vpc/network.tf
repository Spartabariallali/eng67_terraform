resource "aws_internet_gateway" "eng67_bari_terraform_IGW" {
    vpc_id = "${aws_vpc.eng67_bari_terraform_vpc.id}"
    tags = {
        Name = "eng67_bari_terraform_IGW"
    }
}

resource "aws_route_table" "eng67_bari_terraform_route_table" {
    vpc_id = "${aws_vpc.eng67_bari_terraform_vpc.id}"

    route {

    cidr_block = "0.0.0.0/0"

    gateway_id = "${aws_internet_gateway.eng67_bari_terraform_IGW.id}"

    }

    tags = {
        Name = "eng67_bari_terraform_route_table"
    }
}


resource "aws_route_table_association" "eng67_bari_terraform_route_table_association" {
    subnet_id = "${aws_subnet.eng67_bari_terraform_subnet.id}"
    route_table_id = "${aws_route_table.eng67_bari_terraform_route_table.id}"
}


resource "aws_security_group" "eng67_bari_terraform_sg" {
    vpc_id = "${aws_vpc.eng67_bari_terraform_vpc.id}"

    egress {
        from_port = 0
        to_port = 0
        protocol = -1
        cidr_blocks = ["0.0.0.0/0"]
    }

   ingress {
       from_port = 22
       to_port = 22
       protocol = "tcp"

       cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

   tags = {
       Name = "eng67_bari_terraform_sg"
   }
}


resource "aws_instance" "eng67_bari_terraform_EC2" {
    ami = "${var.AMI}"
    instance_type = "t2.micro"
    key_name = "DevOpsStudents"
    associate_public_ip_address = true

    tags = {
      Name = "eng67_bari_terraform_EC2"
    }

    subnet_id = "${aws_subnet.eng67_bari_terraform_subnet.id}"

    vpc_security_group_ids = ["${aws_secuirty_group.eng67_bari_terraform_sg.id}"]

}


  
