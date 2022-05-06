# Service permission define
resource "aws_iam_role" "ecs_task_execution_role" {

  # Need confirmation on the naming convention
  name = "${var.appname_prefix}-${var.ecsclusteraccess_role}-${var.iam_role_suffix}"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ecs-tasks.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_iam_role" "ecs_task_role" {
  name = "${var.appname_prefix}-${var.ecstaskaccess_role}-${var.iam_role_suffix}"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ecs-tasks.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_iam_policy" "dynamodb" {
  name        = "${var.appname_prefix}-${var.task_policy_suffix}-${var.dynamodb_suffix}"
  description = "Policy that allows access to DynamoDB"

  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "dynamodb:CreateTable",
                "dynamodb:UpdateTimeToLive",
                "dynamodb:PutItem",
                "dynamodb:DescribeTable",
                "dynamodb:ListTables",
                "dynamodb:DeleteItem",
                "dynamodb:GetItem",
                "dynamodb:Scan",
                "dynamodb:Query",
                "dynamodb:UpdateItem",
                "dynamodb:UpdateTable",
                "dynamodb:BatchWriteItem"
                
            ],
            "Resource": "*"
        }
    ]
}
EOF
}

# Service permission apply 
resource "aws_iam_role_policy_attachment" "ecs_task_execution_role_policy_attachment" {
  role       = aws_iam_role.ecs_task_execution_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
}

# Service permission apply 
resource "aws_iam_role_policy_attachment" "ecs_task_execution_role_s3_policy_attachment" {
  role       = aws_iam_role.ecs_task_execution_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
}


resource "aws_iam_role_policy_attachment" "ecs_task_role_policy_attachment" {
  role       = aws_iam_role.ecs_task_role.name
  policy_arn = aws_iam_policy.dynamodb.arn
}

resource "aws_iam_role_policy_attachment" "ecs_task_role_xray_policy_attachment" {
  role       = aws_iam_role.ecs_task_role.name
  policy_arn = "arn:aws:iam::aws:policy/AWSXrayFullAccess"
}

resource "aws_iam_role_policy_attachment" "ecs_task_role_ssm_policy_attachment" {
  role       = aws_iam_role.ecs_task_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMFullAccess"
}

resource "aws_iam_role_policy_attachment" "ecs_task_role_ses_policy_attachment" {
  role       = aws_iam_role.ecs_task_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonSESFullAccess"
}

resource "aws_iam_role_policy_attachment" "ecs_task_role_s3_policy_attachment" {
  role       = aws_iam_role.ecs_task_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
}

resource "aws_iam_role_policy_attachment" "ecs_task_role_cognito_policy_attachment" {
  count      = var.ecs_task_role_cognito_required ? 1 : 0
  role       = aws_iam_role.ecs_task_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonCognitoPowerUser"
}

resource "aws_iam_role_policy_attachment" "ecs_task_role_eventbridge_policy_attachment" {
  count      = var.ecs_task_role_eventbridge_required ? 1 : 0
  role       = aws_iam_role.ecs_task_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEventBridgeFullAccess"
}

# Aws log group
resource "aws_cloudwatch_log_group" "cloudwatch_log_group" {
  name = "${var.appname_prefix}/${var.appname_prefix}-${var.aws_region}-${var.ecs_suffix}-${var.cw_log_group_suffix}"

  tags = merge(var.common_tags,
    {
      Name = "${var.appname_prefix}-${var.aws_region}-${var.ecs_suffix}-${var.cw_log_group_suffix}"
  })


}

# Task Definition  
resource "aws_ecs_task_definition" "esc_task_definition" {
  family                   = "${var.appname_prefix}-${var.ecs_scope}-${var.task_definition_suffix}"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = var.container_cpu
  memory                   = var.container_memory
  execution_role_arn       = aws_iam_role.ecs_task_execution_role.arn
  task_role_arn            = aws_iam_role.ecs_task_role.arn
  container_definitions = jsonencode([{
    name        = "${var.appname_prefix}-${var.ecs_scope}-${var.container_suffix}"
    image       = "${var.container_image}"
    essential   = true
    environment = var.container_environment
    portMappings = [{
      protocol      = "tcp"
      containerPort = var.container_port
      hostPort      = var.container_port
    }]
    logConfiguration = {
      logDriver = "awslogs"
      options = {
        awslogs-group         = aws_cloudwatch_log_group.cloudwatch_log_group.name
        awslogs-stream-prefix = var.appname_prefix
        awslogs-region        = var.aws_region
      }
    }

  }])

  tags = merge(var.common_tags,
    {
      Name = "${var.appname_prefix}-${var.ecs_scope}-${var.task_definition_suffix}"
  })
}
