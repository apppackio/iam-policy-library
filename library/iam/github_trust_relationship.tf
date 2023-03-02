data "aws_iam_policy_document" "github_trust_relationship" {
  statement {
    sid    = "GitHubActionsRepoTrust"
    effect = "Allow"

    actions = [
      "sts:TagSession",
      "sts:AssumeRoleWithWebIdentity",
    ]

    condition {
      test     = "StringLike"
      variable = "token.actions.githubusercontent.com:sub"
      values   = ["repo:${GitHubOrg}/${GitHubRepo}:*"]
    }

    principals {
      type        = "Federated"
      identifiers = ["arn:${Partition}:iam::${Account}:oidc-provider/token.actions.githubusercontent.com"]
    }
  }
}
