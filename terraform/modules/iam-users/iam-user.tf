#Create IAM User #https://medium.com/faun/aws-iam-user-and-policy-creation-using-terraform-7cd781e06c97
resource aws_iam_user iam_user {
  count         = var.env == "stg" ? length(var.iam_user_name) : 0
  name          = element(var.iam_user_name, count.index)
  path          = "/"
  force_destroy = true

  tags = {
    Stage = var.env
  }
}


# Add Inline_Policy:
data template_file inline_policy {
  count    = var.env == "stg" ? length(var.iam_user_name) : 0
  template = var.iam_role_policy_user_template

  vars = {
    iam_user_name = element(var.iam_user_name, count.index)
  }
}
resource aws_iam_user_policy inline_policy {
  count = var.env == "stg" ? length(var.iam_user_name) : 0
  name  = "AllowManageOwnUserMFA"
  user  = element(var.iam_user_name, count.index)

  policy = data.template_file.inline_policy[count.index].rendered
}

# [Manual]: Add IAM Users to Group
