data "aws_iam_policy_document" "read_only_bucket" {
  statement {
    sid       = "FindAndListBucket"
    effect    = "Allow"
    resources = ["arn:${Partition}:s3:::${Bucket}"]

    actions = [
      "s3:GetBucketLocation",
      "s3:ListBucket",
    ]
  }

  statement {
    sid       = "GetObjects"
    effect    = "Allow"
    resources = ["arn:${Partition}:s3:::${Bucket}/*"]

    actions = [
      "s3:GetObject",
      "s3:GetObjectAcl",
      "s3:GetObjectLegalHold",
      "s3:GetObjectRetention",
      "s3:GetObjectTagging",
    ]
  }
}
