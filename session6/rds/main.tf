module "rds" {
    source = "../modules/rds"

    db_sg = "first-rds-sg"
    db_identifier = "first-rds-identifier"
}