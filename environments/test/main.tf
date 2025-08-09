
terraform {
  required_version = ">= 1.3.0"
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "key_name" {
  type    = string
  default = "my-project-test-ec2-key"
}

variable "subnet_id" {
  type    = string
  default = "subnet-xxxxxxxxxxxxxxxxx"
}

# Find latest Amazon Linux 2 AMI for the region
data "aws_ami" "amazon_linux_2" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}

module "ec2" {
  source        = "../../modules/ec2_instance"
  instance_name = "test-ec2"
  ami           = data.aws_ami.amazon_linux_2.id
  instance_type = var.instance_type
  key_name      = var.key_name
  subnet_id     = var.subnet_id
  tags = {
    environment = "test"
  }
}
