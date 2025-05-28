module "security_group" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "~> 4.0"

  name        = "${var.project_name}-sg"
  description = "Security group para projeto ${var.project_name}"
  vpc_id      = module.vpc.vpc_id

  ingress_with_cidr_blocks = [
    {
      from_port   = 22
      to_port     = 22
      protocol    = 6
      description = "SSH Casa"
      cidr_blocks = "189.6.211.137/32"
    },
    {
      from_port   = 5000
      to_port     = 5000
      protocol    = 6
      description = "HTTP app casa"
      cidr_blocks = "189.6.211.137/32"
    },
    {
      from_port   = 80
      to_port     = 80
      protocol    = 6
      description = "HTTP público"
      cidr_blocks = "0.0.0.0/0"
    },
    {
      from_port   = 443
      to_port     = 443
      protocol    = 6
      description = "HTTPS público"
      cidr_blocks = "0.0.0.0/0"
    },
    {
      from_port   = 8
      to_port     = -1
      protocol    = "icmp"
      description = "Ping da Sky"
      cidr_blocks = "200.182.147.34/32,201.76.120.130/32"
    }
  ]

  egress_with_cidr_blocks = [
    {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      description = "Saída livre"
      cidr_blocks = "0.0.0.0/0"
    }
  ]

  tags = {
    Project   = "${var.project_name}"
    Terraform = "true"
  }
}
