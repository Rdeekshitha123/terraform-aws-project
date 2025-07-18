resource "aws_iam_user" "iam_user_1"{
name="iam_user_1"
}

resource "aws_iam_access_key" "iamuser1_access_key"{
user=aws_iam_user.iam_user_1.name
}


resource "aws_iam_user_policy_attachment" "attach-s3-policy"{
user=aws_iam_user.iam_user_1.name
policy_arn="arn:aws:iam::aws:policy/AmazonS3FullAccess"
}

output "access_key_id" {
  value = aws_iam_access_key.iamuser1_access_key.id
}

output "secret_access_key" {
  value     = aws_iam_access_key.iamuser1_access_key.secret
sensitive= true
}

output "user_name_out" {
  value = aws_iam_user.iam_user_1.name
}
