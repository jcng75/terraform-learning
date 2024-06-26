
module "sgDB" {
    source = "../sg"
    sgName = "db-sg"
    ingressrules = [ 3306 ]
}

variable "dbServerName" {
    type = string
}

resource "aws_instance" "db" {
    ami = "ami-032598fcc7e9d1c7a"
    instance_type = "t2.micro"
    security_groups = [ module.sgDB.sg_name ]
    tags = {
        name = var.dbServerName.value
    }
}