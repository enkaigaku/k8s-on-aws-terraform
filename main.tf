provider "aws" {}

variable "cidr_block" {
  description = "cidr block"
  type = list(string)
}

resource "aws_vpc" "k8s-vpc" {
  cidr_block = var.cidr_block[0]
  tags = {
    Name: "kubernetes-cluster"
  }
}

resource "aws_subnet" "k8s-subnet-1" {
  vpc_id = aws_vpc.k8s-vpc.id
  cidr_block = var.cidr_block[1]
  availability_zone = "ap-northeast-1c"
}