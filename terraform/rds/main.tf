terraform {
  required_providers {
    aws = { source = "hashicorp/aws" }
  }
}

provider "aws" {
  region = var.aws_region
}


resource "aws_vpc" "rds_vpc" {
  cidr_block = "10.1.0.0/16"
}

resource "aws_subnet" "db_subnet_a" {
  vpc_id            = aws_vpc.rds_vpc.id
  cidr_block        = "10.1.1.0/24"
  availability_zone = "us-east-1a"
}

resource "aws_subnet" "db_subnet_b" {
  vpc_id            = aws_vpc.rds_vpc.id
  cidr_block        = "10.1.2.0/24"
  availability_zone = "us-east-1b"
}

resource "aws_db_subnet_group" "db_group" {
  name       = "rds-subnet-group"
  subnet_ids = [aws_subnet.db_subnet_a.id, aws_subnet.db_subnet_b.id]
}

resource "aws_db_instance" "mysql" {
  allocated_storage    = 20
  engine               = "mysql"
  instance_class       = "db.t3.micro"
  db_name              = var.db_name
  username             = var.db_user
  password             = var.db_password
  skip_final_snapshot  = true
  db_subnet_group_name = aws_db_subnet_group.db_group.name
  publicly_accessible  = false
}