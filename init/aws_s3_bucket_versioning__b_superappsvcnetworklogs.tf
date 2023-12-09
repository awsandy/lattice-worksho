# aws_s3_bucket_versioning.b_superappsvcnetworklogs:
resource "aws_s3_bucket_versioning" "b_superappsvcnetworklogs" {
  bucket = aws_s3_bucket.b_superappsvcnetworklogs.id

  versioning_configuration {
    status = "Disabled"
  }
}
