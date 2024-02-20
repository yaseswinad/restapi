provider "aws" {
  region = "us-east-1" 
}

resource "aws_instance" "example" {
  ami           = "ami-0c55b159cbfafe1f0" 
  instance_type = "t2.micro"             
  tags = {
    Name = "flask-api-instance"
  }

  user_data = <<-EOF
              #!/bin/bash
              sudo yum update -y
              sudo yum install docker -y
              sudo service docker start
              sudo docker run -d -p 5000:5000 flask-rest-api
              EOF
}

output "public_ip" {
  value = aws_instance.example.public_ip
}
