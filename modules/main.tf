provider "aws" {
    region = "us-east-1"
}

module "ec2module" {
    source = "./ec2"
    // Set the ec2name variable to a name
    ec2name = "ModuleName"
}

output "module_output" {
    value = module.ec2module.instance_id
}