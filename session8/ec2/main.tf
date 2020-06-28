module "rds" {
  source        = "../../modules/ec2"
  environment   = var.environment #terraform.workspace
  instance_type = var.instance_type
}