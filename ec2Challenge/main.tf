provider "aws" {
    region = "us-east-1"
}

resource "aws_instance" "db" {
    ami = "ami-032598fcc7e9d1c7a"
    instance_type = "t2.micro"
    security_groups = [ aws_security_group.traffic.name ]
    tags = {
        name = "DB Server"
    }
}

resource "aws_instance" "web" {
    ami = "ami-032598fcc7e9d1c7a"
    instance_type = "t2.micro"
    security_groups = [ aws_security_group.traffic.name ]
    // user_data = file("server-script.sh")
    tags = {
        name = "Web Server"
    }
}

resource "aws_eip" "web_ip"{
    instance = aws_instance.web.id
}

variable "ingressrules" {
    type = list(number)
    default = [80, 443]
}

variable "egressrules" {
    type = list(number)
    default = [80, 443]
}

resource "aws_security_group" "traffic" {
    name = "Web-SG"
    dynamic "ingress" {
        iterator = port
        for_each = var.ingressrules
        content {
          from_port = port.value
          to_port = port.value
          protocol = "TCP"
          cidr_blocks = ["0.0.0.0/0"]
        }
    }
    dynamic "egress" {
        iterator = port
        for_each = var.egressrules
        content {
          from_port = port.value
          to_port = port.value
          protocol = "TCP"
          cidr_blocks = ["0.0.0.0/0"]
        }
    }
}