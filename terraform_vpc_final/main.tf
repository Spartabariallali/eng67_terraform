provider "aws" {
  region     = "eu-west-1"
  access_key = "${var.Access_Key}"
  secret_key = "${var.Secret_Key}"
}


#CREATE VPC
resource "aws_vpc" "main" {
  cidr_block       = "${var.cidr_block}"
  tags = {
    Name = "${var.name}.VPC.Main"
  }
}

#CREATE Internet Gateway
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "${var.name}.igw.main"
  }
}

#CREATE Load Balancer (LB).
resource "aws_lb" "load_bal" {
  name               = "Eng67-Bari-App"
  internal           = false
  load_balancer_type = "network"
  subnets = [module.app.subnet_id]
  # enable_deletion_protection = false

  tags = {
    Name = "${var.name}.app.lb"
  }
}

resource "aws_lb_target_group" "apptarget" {
  name     = "app-target"
  port     = 80
  protocol = "TCP"
  vpc_id   = "${aws_vpc.main.id}"
}

resource "aws_lb_listener" "app_listener" {
  load_balancer_arn = "${aws_lb.load_bal.arn}"
  port              = 80
  protocol          = "TCP"

  default_action {
    type             = "forward"
    target_group_arn = "${aws_lb_target_group.apptarget.arn}"
  }
}

# AutoScaling
resource "aws_launch_configuration" "app_launch_config" {
  image_id        = "${var.app_ami_id}"
  instance_type   = "t2.micro"
  user_data       = "${data.template_file.initapp.rendered}"
  security_groups = [module.app.sec_group_id]
  name            = "${var.name}.autoscale.app"
}

resource "aws_autoscaling_group" "app_auto_scale" {
  name                  = "Eng67_Bari_Autoscale_app"
  vpc_zone_identifier   = [module.app.subnet_id]
  desired_capacity      = 2
  max_size              = 10
  min_size              = 1
  launch_configuration  = "${aws_launch_configuration.app_launch_config.name}"
  target_group_arns     = ["${aws_lb_target_group.apptarget.arn}"]
  tag {
    key                 = "auto_scale"
    value               = "Eng67-Bari-AutoScale-App"
    propagate_at_launch = true
  }

}
