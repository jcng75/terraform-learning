provider "aws" {
    region = "us-east-1"
}

module "webModule" {
    source = "./web"
    webServerName = "Web Server"
}

module "dbModule" {
    source = "./db"
    dbServerName = "My Database"
}