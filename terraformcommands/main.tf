provider "aws" {
  region = "us-east-1"  # Change to your desired AWS region
}

resource "aws_instance" "kafka_instance" {
  ami                    = "ami-0c55b159cbfafe1f0"  # Amazon Linux 2 AMI ID (update as needed)
  instance_type          = "t2.micro"               # Choose instance type as per requirement
  key_name               = "kafka-stock-market-project"

  tags = {
    Name = "kafka-project-stock-market"
  }

  # Attach the security group created below
  security_groups = [aws_security_group.kafka_sg.name]
}

# Security Group to allow all traffic from any IPv4
resource "aws_security_group" "kafka_sg" {
  name        = "kafka-stock-market-sg"
  description = "Allow all inbound traffic for Kafka project"

  ingress {
    description = "Allow all inbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"                  # -1 indicates all protocols
    cidr_blocks = ["0.0.0.0/0"]         # Allow all IPv4 addresses
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"                  # Allow all outbound traffic
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Output the public IP of the instance
output "kafka_instance_public_ip" {
  value = aws_instance.kafka_instance.public_ip
  description = "The public IP address of the Kafka EC2 instance"
}
