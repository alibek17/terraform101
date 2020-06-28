terraform {
  backend "s3" {
    bucket               = "akumo-terraform101-state"
    key                  = "rds.tfstate"
    region               = "us-east-1"
    dynamodb_table       = "terraform101-state-locks"
    encrypt              = true
    profile              = "terraform"
    workspace_key_prefix = "session8"
  }
}
