resource "aws_iam_user_group_membership" "single_user_membership"{
user=var.user_name
groups=var.group_names
}
