data "aws_iam_policy_document" "pull_images_repository" {
  statement {
    sid       = "ECRPushImage"
    effect    = "Allow"
    resources = ["arn:${Partition}:ecr:${Region}:${Account}:repository/${RepositoryName}"]

    actions = [
      "ecr:BatchCheckLayerAvailability",
      "ecr:BatchGetImage",
      "ecr:DescribeImages",
      "ecr:GetDownloadUrlForLayer",
    ]
  }
}
