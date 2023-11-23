resource "tls_private_key" "local" {
  algorithm = "RSA"
  rsa_bits  = 2048
}

resource "local_file" "ssh_private_key" {
  content         = tls_private_key.local.private_key_openssh
  filename        = "/home/ec2-user/.ssh/id_rsa"
  file_permission = "0400"
}

resource "local_file" "ssh_public_key" {
  content         = tls_private_key.local.public_key_openssh
  filename        = "/home/ec2-user/.ssh/id_rsa.pub"
  file_permission = "0400"
}
