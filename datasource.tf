data "aws_kms_secrets" "example" {
  secret {
    # ... potentially other configuration ...
    name    = "master_password"
    payload = "AQEC..."
  }

  secret {
    # ... potentially other configuration ...
    name    = "master_username"
    payload = "AQEC..."
  }
}

resource "aws_rds_cluster" "example" {
  # ... other configuration ...
  master_password = "${data.aws_kms_secrets.example.plaintext["master_password"]}"
  master_username = "${data.aws_kms_secrets.example.plaintext["master_username"]}"
}
