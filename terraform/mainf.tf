resource "aws_instance" "giropops_instance" {
  ami           = "ami-0c55b159cbfafe1f0" # Ubuntu Server 22.04 LTS (verifique a região)
  instance_type = var.instance_type
  key_name      = var.key_name

  vpc_security_group_ids = [aws_security_group.giropops_sg.id]

  tags = {
    Name = "Giropops-Server"
  }
}

resource "aws_security_group" "giropops_sg" {
  name        = "giropops-sg"
  description = "Allow SSH and HTTP"
  ingress = [
    {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    },
    {
      from_port   = 5000
      to_port     = 5000
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  ]
  egress = [{
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }]
}

