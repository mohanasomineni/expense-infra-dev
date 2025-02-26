resource "aws_ssm_parameter" "vpc_id" {
  name = "/${var.project_name}/${var.environment}/vpc_id"
  type = "String"
  value = module.vpc.vpc_id
}

resource "aws_ssm_parameter" "public_subnet_ids" {
  name  = "/expense/dev/public_subnet_ids"
  type  = "StringList"
  value = join(",", module.vpc.public_subnet_ids)

  lifecycle {
    create_before_destroy = true
  }

  depends_on = [aws_ssm_parameter.vpc_id]  # Ensures vpc_id is updated first
}

resource "aws_ssm_parameter" "private_subnet_ids" {
  name  = "/expense/dev/private_subnet_ids"
  type  = "StringList"
  value = join(",", module.vpc.private_subnet_ids)

  lifecycle {
    create_before_destroy = true
  }

  depends_on = [aws_ssm_parameter.vpc_id]  # Ensures vpc_id is updated first
}


resource "aws_ssm_parameter" "database_subnet_ids" {
  name  = "/expense/dev/database_subnet_ids"
  type  = "StringList"
  value = join(",", module.vpc.database_subnet_ids)

  lifecycle {
    create_before_destroy = true
  }

  depends_on = [aws_ssm_parameter.vpc_id]  # Ensures vpc_id is updated first
}
