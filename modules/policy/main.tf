data "aws_iam_policy_document" "custom_policy" {
  statement {
    effect    = "Allow"
    actions   = ["s3:ListAllMyBuckets"]
    resources = ["*"]
  }
}
resource "aws_iam_policy" "custom_policy" {
  name        = "CustomListS3Policy"
  description = "Custom policy for S3 listing"
  policy      = data.aws_iam_policy_document.custom_policy.json
}
