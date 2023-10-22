# set AWS region
provider "aws" {
  region = var.aws_region
}

# set default VPC for the region
resource "aws_default_vpc" "default" {
  tags = {
    Name = "Default VPC"
  }
}

# create a security group for the SFTP server
resource "aws_security_group" "sftp_server_sg" {
  name        = "sftp-server-sg"
  description = "Security group for the SFTP server"
  vpc_id      = aws_default_vpc.default.id

  # Allow incoming HTTP traffic from all source IP addresses
  ingress {
    from_port   = var.http_port
    to_port     = var.http_port
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name    = "SFTP_server"
    Owner   = "Agnija Vjakse"
    Project = "DevOps4ML_Terraform"
  }
}


# Create EC2 instance resource 
resource "aws_instance" "sftp_server" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  count                  = var.instance_count
  key_name               = var.key_name
  iam_instance_profile   = var.iam_instance_profile
  vpc_security_group_ids = [aws_security_group.sftp_server_sg.id]

  user_data = <<-EOF
    #!/bin/bash
    $(cat user_script.sh)
    $(cat sftp_script.sh)
    $(cat backup_script.sh)
    EOF

  tags = {
    Name    = "SFTP_server"
    Owner   = "Agnija Vjakse"
    Project = "DevOps4ML_Terraform"
  }
}
