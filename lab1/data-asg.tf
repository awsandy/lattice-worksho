data "external" "asg_name" {
  program = ["bash", "get-asg-name.sh"]
}

output "asgName" {
  value = data.external.asg_name.result.Name
}


data "aws_autoscaling_group" "rates" {
  name = data.external.asg_name.result.Name
}