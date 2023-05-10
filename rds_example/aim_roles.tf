# module "my_role" {
#   source = "git::https://github.com/mauri1789/aws-training.git//infrastructure/modules/iam_role?ref=v1.2"
#   role_name = "upb_role_1"
#   policy_statement = [
#     {
#       Action = [
#         "ec2:Describe*",
#       ]
#       Effect   = "Allow"
#       Resource = "*"
#     },
#   ]
#   policy_arns = [
#     "arn:aws:iam::aws:policy/job-function/DatabaseAdministrator"
#   ]
# }

