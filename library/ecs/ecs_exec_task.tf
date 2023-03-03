data "aws_iam_policy_document" "ecs_exec_task" {
  statement {
    sid       = "EnableEcsExec"
    effect    = "Allow"
    resources = ["*"]

    actions = [
      "ssmmessages:CreateControlChannel",
      "ssmmessages:CreateDataChannel",
      "ssmmessages:OpenControlChannel",
      "ssmmessages:OpenDataChannel",
    ]
  }
}
