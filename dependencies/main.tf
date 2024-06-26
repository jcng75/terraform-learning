provider "aws" {
    region = "us-east-1"
}

resource "aws_instance" "db" {
    ami = "ami-032598fcc7e9d1c7a"
    instance_type = "t2.micro"
}

resource "aws_instance" "web" {
    ami = "ami-032598fcc7e9d1c7a"
    instance_type = "t2.micro"

    // Makes it so that web aws_instance deploys AFTER db instance
    depends_on = [ aws_instance.db ]
}