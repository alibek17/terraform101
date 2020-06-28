module "rds" {
  source        = "../../modules/ec2-ds"
  environment   = var.environment #terraform.workspace
}