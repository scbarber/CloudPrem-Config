remote_state {
  backend = "s3"
  config = {
    bucket         = "cloudprem-terrafom-state-${local.state_region}-${get_aws_account_id()}"
    dynamodb_table = "cloudprem-terrafom-lock"
    key            = "${path_relative_to_include()}/terraform.tfstate"
    region         = local.state_region
    encrypt        = true
  }
}
locals {
  state_region = get_env("AWS_REGION", "us-west-2")
}