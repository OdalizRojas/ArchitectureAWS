resource "aws_db_instance" "default" {
  allocated_storage    = 10
  db_name              = "upb_rds_instance"
  engine               = "mysql"
  engine_version       = "8.0.32"
  instance_class       = "db.t3.micro"
  username             = "Administrador"
  password             = "coraje442002*"
  vpc_security_group_ids = [
    module.database_sg.id
  ]
#   vpc_security_group_name = 
}

# Para contraseñas:
# data "aws_secretsmanager_secret" "db_secret" {
#   id = " "
# }