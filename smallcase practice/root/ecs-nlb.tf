resource "aws_lb" "nlb" {
  name               = "${var.domain}-${var.environment}-${var.resource_suffix.nlb_suffix}"
  internal           = true
  load_balancer_type = "network"
  subnets            = module.vpc.private_subnets

  enable_deletion_protection = false

  tags = merge(local.common_tags,
    {
      Name = "${var.domain}-${var.environment}-${var.resource_suffix.nlb_suffix}"
  })
}

resource "aws_lb_target_group" "nlb_target_group" {
  name        = "${var.domain}-${var.environment}-${var.resource_suffix.service_suffix}-${var.resource_suffix.nlb_suffix}-${var.resource_suffix.tg_suffix}"
  port        = 80
  protocol    = "TCP"
  vpc_id      = module.vpc.vpc_id
  target_type = "ip"

  health_check {
    path = var.health_check_path
  }

  tags = merge(local.common_tags,
    {
      Name = "${var.domain}-${var.environment}-${var.resource_suffix.service_suffix}-${var.resource_suffix.nlb_suffix}-${var.resource_suffix.tg_suffix}"
  })
}

# forward to http listener
resource "aws_lb_listener" "tcp" {
  load_balancer_arn = aws_lb.nlb.id
  port              = 80
  protocol          = "TCP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.nlb_target_group.arn
  }
}
