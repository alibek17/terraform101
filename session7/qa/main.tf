module "rds" {
    source = "../modules/rds"
    
    environment = "qa"
    db_storage = 20
    skip_final_snapshot = false
}