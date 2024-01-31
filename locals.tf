locals {
  sufix = "${var.tags.project}-${var.tags.env}-${var.tags.region}"
}

resource "random_string" "sufije_s3" {
  length  = 8
  special = false
  upper   = false
}

locals {
  s3-sufix = "${var.tags.project}-${random_string.sufije_s3.id}"
}