#modules/iam-users/variables.tf
#basic
variable env {}
#iam-users
variable iam_user_name {}
variable iam_role_policy_user_template { default = null }
