provider "aws" {
    region = "us-east-1"
}

variable "number_of_servers" {
    type = number
}

resource "aws_instance" "ec2" {
    ami = "ami-032598fcc7e9d1c7a"
    instance_type = "t2.micro"
    // Makes 3 instances
    count = number_of_servers 
}

// terraform apply -var-file=test.tfvars