provider "aws" {
    region = "us-east-1"
}

resource "aws_instance" "ec2db" {
    ami = "ami-01a6e31ac994bbc09"
    instance_type = "t2.micro"

    tags = {
        name = "DB Server"
    }
}

data "aws_instance" "dbsearch" {
    filter {
        name = "tag:Name"
        values = ["DB Server"]
    }
}

output "dbservers" {
    value = data.aws_instance.dbsearch.id
}