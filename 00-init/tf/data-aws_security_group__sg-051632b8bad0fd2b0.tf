data "aws_security_group" "sg-051632b8bad0fd2b0" {
  name   = "default"
  vpc_id = aws_vpc.vpc-0552cbf8549150e66.id
}
