# Common tags to be used at each resources
locals {
  common_tags = {
    Environment = "${var.environment}"
    domain     = "${var.domain}"
  }
}
