module "my_role" {
    source = "../modules/iam_role"
    role_name = "upb_role_1"
    policy_statement = [
      {
        Action = [
          "ec2:Describe*",
        ]
        Effect   = "Allow"
        Resource = "*"
      },
    ]
}