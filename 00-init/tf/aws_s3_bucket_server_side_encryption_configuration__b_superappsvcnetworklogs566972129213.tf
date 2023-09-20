# aws_s3_bucket_server_side_encryption_configuration.b_superappsvcnetworklogs566972129213:
resource "aws_s3_bucket_server_side_encryption_configuration" "b_superappsvcnetworklogs566972129213" {
  bucket = aws_s3_bucket.b_superappsvcnetworklogs566972129213.id

  rule {
    bucket_key_enabled = false

    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}
