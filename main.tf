provider "aws" {
  region  = "ap-south-1"
  profile = "default"
}

// Create common tags for the resources

locals {
  common_tags = {
    Name         = "Webserver-Demo"
    BusinessUnit = "DI"
    Environment  = "Testing"
    Owner        = "DICloud"
  }
}

resource "aws_instance" "webserver" {
  ami           = "ami-0447a12f28fddb066"
  instance_type = "t2.micro"
  tags = local.common_tags
}

output "webserver" {
  value = aws_instance.webserver.public_ip
}

