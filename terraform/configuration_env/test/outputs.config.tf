#All Outputs of config
output aws_account_id {
  value = <<VALUE

  Check AWS Env:
    AWS Account ID: "${data.aws_caller_identity.current.account_id}"
    AWS Account ARN: "${data.aws_caller_identity.current.arn}"
  VALUE
}
