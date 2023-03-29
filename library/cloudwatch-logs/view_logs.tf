data "aws_iam_policy_document" "view_logs" {
  statement {
    sid       = "ListLogGroups"
    effect    = "Allow"
    resources = ["*"]
    actions   = ["logs:DescribeLogGroups"]
  }

  statement {
    sid       = "ViewLogGroup"
    effect    = "Allow"
    resources = ["arn:${Partition}:logs:${Region}:${Account}:log-group:${LogGroupName}"]

    actions = [
      "logs:DescribeLogStreams",
      "logs:FilterLogEvents",
      "logs:GetLogGroupFields",
    ]
  }

  statement {
    sid       = "ViewLogEvents"
    effect    = "Allow"
    resources = ["arn:${Partition}:logs:${Region}:${Account}:log-group:${LogGroupName}:log-stream:*"]
    actions   = ["logs:GetLogEvents"]
  }

  statement {
    sid       = "LogInsights"
    effect    = "Allow"
    resources = ["*"]

    actions = [
      "logs:DescribeQueryDefinitions",
      "logs:DescribeQueries",
      "logs:GetLogRecord",
      "logs:GetQueryResults",
      "logs:StartQuery",
      "logs:StopQuery",
    ]
  }
}
