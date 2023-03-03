data "aws_iam_policy_document" "login_public" {
  statement {
    sid       = "EcrPublicLogin"
    effect    = "Allow"
    resources = ["*"]

    actions = [
      "ecr-public:GetAuthorizationToken",
      "sts:GetServiceBearerToken",
    ]
  }
}
