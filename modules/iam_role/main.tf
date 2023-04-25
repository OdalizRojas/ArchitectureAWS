resource "aws_iam_role" "test_role" {
  name = var.role_name

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = var.assume_role_service
        }
      },
    ]
  })
}

resource "aws_iam_policy" "policy" {
  name        = "${var.role_name}-policy"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = var.policy_statement
  })
}