//key pair making ready to attach
resource "aws_key_pair" "vinitkey" {
  key_name   = "vinit-key"
  public_key = file("~/.ssh/id_rsa.pub")
}


//security group making ready to attach
resource "aws_security_group" "FromTerraformInstance_SG" {
  name = "Express_Flask_Mongo_SG"

  # Igress rules (inbound traffic)
  ingress {
    description = "allow ssh"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "allow frontend"
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "allow backend"
    from_port   = 5000
    to_port     = 5000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Egress rules (outbound traffic)
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"          # -1 means all protocols
    cidr_blocks = ["0.0.0.0/0"] # Allow all outbound traffic to any IP
  }
}


resource "aws_instance" "create_vm" {
  ami             = var.ami           # Replace with the correct AMI ID for your region
  instance_type   = var.instance_type # Change the instance type if necessary
  key_name        = aws_key_pair.vinitkey.key_name
  security_groups = [aws_security_group.FromTerraformInstance_SG.name]

  user_data = file("${path.module}/userdata.tpl")

  tags = {
    Name = "Express-Flask-Mongo-Terraform"
  }
}
