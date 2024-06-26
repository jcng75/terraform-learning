provider "aws" {
    region = "us-east-1"
}

resource "aws_instance" "ec2" {
    ami = "ami-032598fcc7e9d1c7a"
    instance_type = "t2.micro"
    // Makes 3 instances
    count = 3
}

// Count Advanced:
// view db

module "db" {
    source = "./db"
    server_names = ["Server1", "Server2", "Server3"]
}

output "private_ips" {
    value = module.db.PrivateIP
}