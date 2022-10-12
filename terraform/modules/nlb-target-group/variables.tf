#modules/nlb-target-group/variables.tf
#base
variable env {}
variable project {}

#nlb-target-group
variable nlb_target_group_name {}
variable vpc_id {}
variable nlb_target_group_target_type {}
variable nlb_target_group_type {}
variable nlb_target_group_port {}

#Health check settings
variable nlb_target_group_healthcheck_port {}
variable nlb_target_group_healthcheck_path {}
variable nlb_target_group_unhealthy_threshold { default = 3 }
variable nlb_target_group_interval { default = 30 }
