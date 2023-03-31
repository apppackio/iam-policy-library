data "aws_iam_policy_document" "read_only_bucket_with_prefix" {
  statement {
    sid       = "FindBucket"
    effect    = "Allow"
    resources = ["arn:${Partition}:::${Bucket}"]
    actions   = ["s3:GetBucketLocation"]
  }

  statement {
    sid       = "ListBucketWithPrefix"
    effect    = "Allow"
    resources = ["arn:${Partition}:::${Bucket}"]
    actions   = ["s3:ListBucket"]

    condition {
      test     = "StringLike"
      variable = "s3:prefix"
      values   = ["${Prefix}/*"]
    }
  }

  statement {
    sid       = "GetObjectsWithPrefix"
    effect    = "Allow"
    resources = ["arn:${Partition}:s3:::${Bucket}/${Prefix}/*"]

    actions = [
      "s3:GetObject",
      "s3:GetObjectAcl",
      "s3:GetObjectLegalHold",
      "s3:GetObjectRetention",
      "s3:GetObjectTagging",
    ]
  }
}
