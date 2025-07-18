resource "aws_iam_group" "developers"{
name="developers"
}
output "group_names_out" {
  value = [aws_iam_group.developers.name]
}

