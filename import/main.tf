provider "aws" {
    region = "us-east-1"
}

resource "aws_vpc" "myvpc" {
    cidr_block = "10.0.0.0/16"
}

resource "aws_vpc" "myvpc2" {
    cidr_block = "192.168.0.0/24"
}

// terraform import aws_vpc.myvpc2 vpc-03db7c242cd8c8929
/*
Say we have an exisiting VPC already configured using the console (EX: vpc-03db7c242cd8c8929)
We also have a vpc already deployed using terraform (myvpc)
If we were to run the command above (terraform import ...), we can import the already created vpc into our terraform code
*/