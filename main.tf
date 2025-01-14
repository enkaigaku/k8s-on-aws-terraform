provider "aws" {}

resource "aws_vpc" "myapp-vpc" {
  cidr_block = var.vpc_cidr_block
  tags = {
    Name: "${var.env_prefix}-vpc"
  }
}

module "myapp-subnet" {
  source = "./modules/subnet"
  env_prefix = var.env_prefix
  vpc_id = aws_vpc.myapp-vpc.id
  subnet_cidr_block = var.subnet_cidr_block
  avail_zone = var.avail_zone
}

module "myapp-webserver" {
  source = "./modules/webserver"
  env_prefix = var.env_prefix
  vpc_id = aws_vpc.myapp-vpc.id
  subnet_id = module.myapp-subnet.subnet.id
  my_ip = var.my_ip
  instance_type = var.instance_type
  avail_zone = var.avail_zone
  image_name = var.image_name
}
