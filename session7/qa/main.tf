module "rds" {
    source = "github.com/alibek17/terraform101//modules/rds?ref=v0.0.1"
    
    environment = "qa"
    db_storage = 20
    skip_final_snapshot = false
}