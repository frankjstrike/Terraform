resource "aws_db_instance" "db_instance" {
  allocated_storage = 20
  allow_major_version_upgrade = false # Required for automatic major version upgrades
  engine = "postgres"
  engine_version = "12"
  storage_type = "standard"
  instance_class = "db.t2.micro"
  username = var.db_user
  password = var.db_password
  skip_final_snapshot = true
  name = var.db_name
}