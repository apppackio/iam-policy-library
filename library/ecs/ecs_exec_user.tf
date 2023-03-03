data "aws_iam_policy_document" "ecs_exec_user" {
  statement {
    sid       = "EcsExecConnect"
    effect    = "Allow"
    resources = ["arn:${Partition}:ecs:${Region}:${Account}:cluster/${ClusterName}"]
    actions   = ["ecs:ExecuteCommand"]
  }
}
