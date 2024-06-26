terraform {
    backend "s3" {
        key = "terraform/tfstate.tfstate"
        bucket = "justin-remote-backend-2024"
        region = "us-east-1"
        access_key = ""
        secret_key = ""
    }
}

//cat ~/.aws/credentials