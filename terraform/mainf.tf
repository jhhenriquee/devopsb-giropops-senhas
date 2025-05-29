
module "infra" {
  source = "https://github.com/jhhenriquee/devopsb-giropops-terraform/releases/tag/v0.0.1"

  project_name   = "giropops"
  aws_region     = "us-east-1"
  instance_type  = "t2.micro"
  user_data_file = "${path.module}/../scripts/user_data.sh"
  public_key     = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCxlKx6EtgBAnjIAc33QIZhPKY87yTLTqLw89tQrZgyVr6BOvFmE33kgOVX1rTyPIXot+D+mF5uqNL0DTSlmz2DJi/2q/Z8fV9gNNTgoPXTQGDakvP+Y9jYhEEUAf/PyKJ7e2otCobP9RvNiyFENLo66pW0vwAO6xmqiRe18r6ImUFvt2CfoulGttYspSNx1iuqYbaR8XHkXBma5Vvl3l+/PrdhkqE5wcfFe2KP42O8ew7xf4HMRWyGekozjm4i/dP5Uk3asKWpf0pBGLDPcm8qVMWwCkIsNZSpdWU8u7Rt0KCbcH1VxqSJlfEORh95j0OqVKkFbpEZ8qjjrJE6nQCh58YJOysLWf0DcDJhZQJzqsL5EtiBeGuBVx1LvszWJs224QgfuWXRwuR8OJdL8KjPY0vYVFIaxDQ50pZ8r2WcjGhbbUBc2qagQJUeIov6h9ncQxmpXT7tmY82FxvCIOY17ibRgjFMLmmDaFjOYKx5tvNHQojgoN1bJ6UQ5QUCzzM= sky\\jose.silva@sky01009-nb"
  allowed_cidr   = "189.6.211.137/32"
}