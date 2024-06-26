provider "aws" {
    region = "us-east-1"
}

resource "aws_db_instance" "myRDS" {
    allocated_storage = 20
    identifier = "my-first-rds"
    instance_class = "db.t2.micro"
    engine = "mysql"
    engine_version = "8.0"
    db_name = "myDB"
    username = "admin"
    password = "password"
    port = 3306
    skip_final_snapshot = true
}