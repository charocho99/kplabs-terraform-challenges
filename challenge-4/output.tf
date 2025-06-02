data "aws_iam_users" "users" {}

output "number_of_iam_users" {
  value = length(data.aws_iam_users.users.names)
}