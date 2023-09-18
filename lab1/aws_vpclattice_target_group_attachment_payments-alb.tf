resource "aws_vpclattice_target_group_attachment" "example" {
  target_group_identifier = aws_vpclattice_target_group.tg-00cd21289524685dd.id

  target {
    id   = data.aws_lb.payments.arn
    port = 80
  }
}