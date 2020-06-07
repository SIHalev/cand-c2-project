provider "aws" {
  region = "us-east-1"
}

resource "aws_vpc" "terraform_vpc" {
  cidr_block = "10.1.0.0/16"

  tags = {
    Name = "Udacity terraform vpc"
  }
}

resource "aws_subnet" "public_subnet" {
  vpc_id = aws_vpc.terraform_vpc.id
  cidr_block = "10.1.10.0/24"
  map_public_ip_on_launch = true

  tags = {
    Name = "Udacity terraform subnet"
  }
}

resource "aws_instance" "Udacity_T2" {
  count = 4
  ami = "ami-01d025118d8e760db"
  instance_type = "t2.micro"
  subnet_id = aws_subnet.public_subnet.id
  tags = {
    Name = "Udacity terraform T2 instance"
  }
}

resource "aws_instance" "Udacity_M4" {
  count = 2
  ami = "ami-01d025118d8e760db"
  instance_type = "m4.large"
  subnet_id = aws_subnet.public_subnet.id
  tags = {
    Name = "Udacity terraform M4 instance"
  }
}
