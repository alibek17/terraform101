data "terraform_remote_state" "rds" {
  backend = "s3"
  config = {
    bucket  = "akumo-terraform101-state"
    key     = "session8/${var.environment}/rds.tfstate"
    region  = "us-east-1"
    profile = "terraform"
  }
}