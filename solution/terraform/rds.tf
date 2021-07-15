resource "aws_db_subnet_group" "db-subnet-grp" {
  name        = "techchallend-db-sgrp"
  description = "Database Subnet Group"
  subnet_ids  = aws_subnet.private.*.id
}

resource "aws_db_instance" "postgresdb" {
  identifier             = "techchallengedb"
  allocated_storage      = 10
  engine                 = "postgres"
  engine_version         = "10.7"
  port                   = "5432"
  instance_class         = "db.t2.micro"
  name                   = "postgres"
  username               = var.db_user
  password               = data.aws_ssm_parameter.dbpassword.value
  vpc_security_group_ids = [aws_security_group.postgre-sql.id]
  multi_az               = true
  db_subnet_group_name   = aws_db_subnet_group.db-subnet-grp.id
  publicly_accessible    = false
  skip_final_snapshot    = true
  storage_type           = "gp2"
}

