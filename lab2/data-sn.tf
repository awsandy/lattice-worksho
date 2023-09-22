data "aws_vpclattice_service_network" "svn" {
  service_network_identifier = data.aws_ssm_parameter.sn.value
}