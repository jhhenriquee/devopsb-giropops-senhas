resource "aws_key_pair" "key_pair" {
  key_name   = "${var.project_name}-key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCxlKx6EtgBAnjIAc33QIZhPKY87yTLTqLw89tQrZgyVr6BOvFmE33kgOVX1rTyPIXot+D+mF5uqNL0DTSlmz2DJi/2q/Z8fV9gNNTgoPXTQGDakvP+Y9jYhEEUAf/PyKJ7e2otCobP9RvNiyFENLo66pW0vwAO6xmqiRe18r6ImUFvt2CfoulGttYspSNx1iuqYbaR8XHkXBma5Vvl3l+/PrdhkqE5wcfFe2KP42O8ew7xf4HMRWyGekozjm4i/dP5Uk3asKWpf0pBGLDPcm8qVMWwCkIsNZSpdWU8u7Rt0KCbcH1VxqSJlfEORh95j0OqVKkFbpEZ8qjjrJE6nQCh58YJOysLWf0DcDJhZQJzqsL5EtiBeGuBVx1LvszWJs224QgfuWXRwuR8OJdL8KjPY0vYVFIaxDQ50pZ8r2WcjGhbbUBc2qagQJUeIov6h9ncQxmpXT7tmY82FxvCIOY17ibRgjFMLmmDaFjOYKx5tvNHQojgoN1bJ6UQ5QUCzzM= sky\\jose.silva@sky01009-nb"
  tags = {
    Terraform = "true"
    Project   = var.project_name
  }
}

resource "aws_instance" "giropops_instance" {
  ami           = "ami-0c55b159cbfafe1f0" # Ubuntu Server 22.04 LTS (verifique a região)
  instance_type = var.instance_type
  key_name      = "${var.project_name}-key"

  vpc_security_group_ids = [module.security_group.this_security_group_id]

  tags = {
    Terraform = "true"
    Project   = var.project_name
  }
}


