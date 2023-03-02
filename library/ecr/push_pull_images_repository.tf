data "aws_iam_policy_document" "push_pull_images_repository" {
  statement {
    sid       = "ECRPushPullImage"
    effect    = "Allow"
    resources = ["arn:${Partition}:ecr:${Region}:${Account}:repository/${RepositoryName}"]

    actions = [
      "ecr:BatchCheckLayerAvailability",
      "ecr:BatchGetImage",
      "ecr:CompleteLayerUpload",
      "ecr:DescribeImages",
      "ecr:GetDownloadUrlForLayer",
      "ecr:InitiateLayerUpload",
      "ecr:PutImage",
      "ecr:UploadLayerPart",
    ]
  }
}
