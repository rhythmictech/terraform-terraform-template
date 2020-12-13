
module "tags" {
  source  = "rhythmictech/tags/terraform"
  version = "1.1.0"

  enforce_case = "UPPER"
  names        = [var.name]
  tags         = var.tags
}

module "laughs" {
  source  = "sblack4/laughs/terraform"
  version = "0.0.2"
}

resource "null_resource" "hello_world" {
  provisioner "local-exec" {
    command = "echo 'hello world'"
  }
}

locals {
  # tflint-ignore: terraform_unused_declarations
  name = module.tags.name
  # tflint-ignore: terraform_unused_declarations
  tags = module.tags.tags_no_name
}
