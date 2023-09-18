resource "aws_vpclattice_target_group_attachment" "reservation_lambda" {
  target_group_identifier = aws_vpclattice_target_group.tg-0db3a282d7c581867.id

  target {
    id   = data.aws_lambda_function.reservation.arn
  }
}