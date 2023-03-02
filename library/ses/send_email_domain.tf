data "aws_iam_policy_document" "send_email_domain" {
  statement {
    sid       = "SendEmailFromDomain"
    effect    = "Allow"
    resources = ["*"]

    actions = [
      "ses:SendEmail",
      "ses:SendRawEmail",
    ]

    condition {
      test     = "StringLike"
      variable = "ses:FromAddress"
      values   = ["*@${Domain}"]
    }
  }
}
