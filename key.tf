resource "tls_private_key" "this" {
  algorithm = "RSA"
}

resource "local_file" "private_key" {
    content  = tls_private_key.this.private_key_pem
    filename = "private_key.pem"
}

module "key_pair" {
  source = "terraform-aws-modules/key-pair/aws"

  key_name   = "deployer-one"
  public_key = tls_private_key.this.public_key_openssh
  create_key_pair = true

}