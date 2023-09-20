# aws_s3_bucket_versioning.b_superappsvcnetworklogs566972129213:
resource "aws_s3_bucket_versioning" "b_superappsvcnetworklogs566972129213" {
  bucket = aws_s3_bucket.b_superappsvcnetworklogs566972129213.id

  versioning_configuration {
    status = "Disabled"
  }
}
