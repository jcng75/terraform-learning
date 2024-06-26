
module "eip" {
    source = "../eip"
    instance_id = aws_instance.web.id
}

module "sgWeb" {
    source = "../sg"
    sgName = "web-sg"
}

variable "webServerName" {
    type = string
}

resource "aws_instance" "web" {
    ami = "ami-032598fcc7e9d1c7a"
    instance_type = "t2.micro"
    security_groups = [ module.sgWeb.sg_name ]
    // user_data = file("server-script.sh")
    tags = {
        name = var.webServerName.value
    }
}

output "instance_id" {
    value = aws_instance.web.id
}

output "name" {
  value = module.eip.PublicIP
}