#data "external" "alb_name" {
#  program = ["bash", "get-alb-name.sh", data.aws_vpc.payments.id]
#}

  
#output "albName" {
#  value = data.external.alb_name.result.Name
#  value = data.aws_ssm_parameter.alb.value
#}

data "aws_lb" "payments" {
  #name = data.external.alb_name.result.Name
  name = data.aws_ssm_parameter.alb.value
}

