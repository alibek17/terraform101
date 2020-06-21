output "db_address" {
    value = aws_db_instance.demo_db_instance.address
}
output "db_endpoint" {
    value = aws_db_instance.demo_db_instance.endpoint
}

output "db_user" {
    value = aws_db_instance.demo_db_instance.username
}

output "db_sg" {
    value = aws_security_group.db_sg.id
}
