#modules/iam-role/variables.tf
#basic
variable env {}
variable project {}

#iam-role
variable iam_assume_role_template {}
variable iam_role_name {}
variable iam_role_service {}
variable iam_role_type { default = null }
variable default_policy_arn { default = null }
variable iam_policy_template { default = null }
variable iam_policy_vars { default = null }
variable iam_instance_profile_name { default = null }
