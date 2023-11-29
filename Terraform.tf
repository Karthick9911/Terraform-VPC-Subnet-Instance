provider "aws" {
  region = "us-east-1"
}

resource "aws_vpc" "maintf" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "maintf-1" {
  vpc_id     = aws_vpc.maintf.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "us-east-1a"
  tags = {
    Name = "Main-1"
  }
}

resource "aws_subnet" "maintf-2" {
  vpc_id     = aws_vpc.maintf.id
  cidr_block = "10.0.2.0/24"
  availability_zone = "us-east-1b"

  tags = {
    Name = "Main-2"
  }
}

resource "aws_subnet" "maintf-3" {
  vpc_id     = aws_vpc.maintf.id
  cidr_block = "10.0.3.0/24"
  availability_zone = "us-east-1c"

  tags = {
    Name = "Main-3"
  }
  }

resource "aws_instance" "TerraformEc2" {
  ami           = "ami-0fc5d935ebf8bc3bc"
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.maintf-1.id


  tags = {
    Name = "tf-1"
  }
}

resource "aws_instance" "TerraformEc1" {
  ami           = "ami-0fc5d935ebf8bc3bc"
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.maintf-2.id


  tags = {
    Name = "tf-2"
  }
}