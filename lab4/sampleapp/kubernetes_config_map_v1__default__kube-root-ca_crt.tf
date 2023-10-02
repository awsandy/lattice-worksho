# kubernetes_config_map_v1.default__kube-root-ca_crt:
resource "kubernetes_config_map_v1" "default__kube-root-ca_crt" {
  binary_data = {}
  data = {
    "ca.crt" = <<-EOT
-----BEGIN CERTIFICATE-----
MIIDBTCCAe2gAwIBAgIIawhOPy84yTswDQYJKoZIhvcNAQELBQAwFTETMBEGA1UE
AxMKa3ViZXJuZXRlczAeFw0yMzA5MjkxODExMjJaFw0zMzA5MjYxODExMjJaMBUx
EzARBgNVBAMTCmt1YmVybmV0ZXMwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEK
AoIBAQDfDJ+WBOt8mh6h/LQIqpYBIEPiLrGfe9/GTMXe4lzgbrvKOodqgLKcWYft
v/fWWiLocQdcKDvWPcjY20CpT3Xo74xDbghAmUz91EDW8YGZloCPf6yvmOPJ2bgP
pZsoL/KvQsGPT7GkB0NsY4gQrdQ6ROlocxiXkVvSXAnynZsoNgj5xEeDPG1eorvL
jkWnGHkh8QkHn6Lmh5qD7At6VMK6uSDEo2LjL+8URQ+rsrJfPplHB6dhoAQjZZxh
sxTFa4sKN0QW2t62rFeOeV3KsWo99m5SOy231nodzRBGz794YKOUJsbZUBtX26Tw
N2aVZMkSMrK9jHlQ6AYioqlhma3JAgMBAAGjWTBXMA4GA1UdDwEB/wQEAwICpDAP
BgNVHRMBAf8EBTADAQH/MB0GA1UdDgQWBBS32Nc0ao96XU4wa3u2KwFqZimqVzAV
BgNVHREEDjAMggprdWJlcm5ldGVzMA0GCSqGSIb3DQEBCwUAA4IBAQAY5y/TTG/0
atpxlcYKV3726fDOGV1KkE3xlyUkUEY8c9bXiw+AQ3Jt2J2Bzpy7rAwCFt6uE9Xb
f/Py6z8Zm+CQXz/X7LUsQzCsdN4yKq/b37m34PoGbQHaw18BXBbEPQewEqRWNfRl
oCgdkonsHe4Yj2gxbDVDvIej9GNDt9c2oLRydUv5phUGcHKJKzRBjXImkzb03JeO
7d+LlF1LSvmey7T0SfeFqNc7nubn+R3NyKAuFbtZs74gNrv5u2Y2IrokuY6Bk59y
e63dwY8IOjg3VCBzHPgXs5VzYtrFMIBU+Q1toPxlWlROgiuBu174G+drnmUPR79j
sbBeBssrZ+UO
-----END CERTIFICATE-----
EOT
  }
  immutable = false

  metadata {
    annotations = {}
    labels      = {}
    name        = "kube-root-ca.crt"
    namespace   = "default"
  }
}
