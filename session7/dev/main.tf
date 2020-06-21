module "rds" {
    source = "github.com/alibek17/terraform101//modules/rds?ref=v0.0.1"
    
    environment = "dev"
}

resource "aws_security_group_rule" "allow_mysql" {
  type = "ingress"
  security_group_id = module.rds.m_db_sg

  from_port       = module.rds.m_db_port
  to_port         = module.rds.m_db_port
  protocol        = "tcp"
  cidr_blocks     = ["0.0.0.0/0"]
}