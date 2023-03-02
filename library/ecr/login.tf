data "aws_iam_policy_document" "login" {
  statement {
    sid       = "EcrLogin"
    effect    = "Allow"
    resources = ["*"]
    actions   = ["ecr:GetAuthorizationToken"]
  }
}
