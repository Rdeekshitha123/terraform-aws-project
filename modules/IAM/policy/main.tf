data "aws_iam_policy_document" "custom_policy1" {
  statement {
    effect    = "Allow"
    actions   = ["s3:ListAllMyBuckets"]
    resources = ["*"]
  }
}

resource "aws_iam_policy" "custom_policy1" {
  name        = policy_name
  description = "Custom policy for S3 listing"
  policy      = data.aws_iam_policy_document.custom_policy1.json
}
