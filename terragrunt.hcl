remote_state {
  backend = "s3"
  config = {
    bucket         = "dozuki-terraform-state-${local.state_region}-${get_aws_account_id()}"
    dynamodb_table = "dozuki-terraform-lock"
    key            = "${path_relative_to_include()}/terraform.tfstate"
    region         = local.state_region
    encrypt        = true
  }
}
locals {
  state_region = get_env("AWS_REGION", "us-west-2")
}