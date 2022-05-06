# Create aws ecs cluster
resource "aws_ecs_cluster" "ecs_cluster" {
  name = var.ecs_domain_naming_construct

  tags = merge(var.common_tags,
    {
      Name = var.ecs_domain_naming_construct
  })

}
