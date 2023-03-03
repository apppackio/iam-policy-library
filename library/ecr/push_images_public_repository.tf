data "aws_iam_policy_document" "push_images_public_repository" {
  statement {
    sid       = "ECRPushPublicImage"
    effect    = "Allow"
    resources = ["arn:${Partition}:ecr:${Region}:${Account}:repository/${RepositoryName}"]

    actions = [
      "ecr-public:BatchCheckLayerAvailability",
      "ecr-public:CompleteLayerUpload",
      "ecr-public:DescribeImages",
      "ecr-public:InitiateLayerUpload",
      "ecr-public:PutImage",
      "ecr-public:UploadLayerPart",
    ]
  }
}
