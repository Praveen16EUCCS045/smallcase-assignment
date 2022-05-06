locals {
  lambda_init_bucket_folder = "lambda"

  lambda_init_bucket_filename = "lambda-initialization.zip"
  lambda_init_key             = "${local.lambda_init_bucket_folder}/${local.lambda_init_bucket_filename}"

  custom_image_bucket_folder   = "images"
  custom_image_bucket_filename = "a.png"

}


data "aws_iam_policy_document" "s3_b2b_policy" {
  statement {
    actions   = ["s3:GetObject"]
    resources = ["arn:aws:s3:::${var.domain}-${var.environment}-${var.aws_region}-${var.resource_suffix.bucket_suffix}/*"]

    principals {
      type        = "AWS"
      identifiers = ["arn:aws:iam::${data.aws_caller_identity.caller_identity.account_id}:root"]
    }
  }
}

module "s3_bucket" {
  source  = "terraform-aws-modules/s3-bucket/aws"
  version = "2.2.0"

  bucket        = "${var.domain}-${var.environment}-${var.aws_region}-${var.resource_suffix.bucket_suffix}"
  acl           = "private"
  force_destroy = var.force_destroy
  versioning = {
    enabled = false
  }

  tags = merge(local.common_tags,
    {
      Name = "${var.domain}-${var.environment}-${var.aws_region}-${var.resource_suffix.bucket_suffix}"
  })

}

######################## Initial file for lambda function ######################

data "archive_file" "lamnda_init_zip" {

  type        = "zip"
  output_path = "${path.module}/${local.lambda_init_bucket_filename}"
  source {
    content  = "Initialize function"
    filename = "lambda-initialize.txt"
  }
}

################ Upload init function to S3 bucket ############################

resource "aws_s3_bucket_object" "object" {
  bucket = module.s3_bucket.s3_bucket_id
  key    = "${local.lambda_init_bucket_folder}/${local.lambda_init_bucket_filename}"
  source = "${path.module}/lambda-initialization.zip"

  depends_on = [
    module.s3_bucket,
    data.archive_file.lamnda_init_zip
  ]

}
