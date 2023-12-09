# aws_s3_bucket_server_side_encryption_configuration.b_superappsvcnetworklogs:
resource "aws_s3_bucket_server_side_encryption_configuration" "b_superappsvcnetworklogs" {
  bucket = aws_s3_bucket.b_superappsvcnetworklogs.id

  rule {
    bucket_key_enabled = false

    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}
