resource "aws_eip" "web_ip"{
    instance = var.instance_id.value
}

variable "instance_id" {
  type = string
}

output "PublicIP" {
    value = aws_eip.web_ip.public_ip
}