
variable "name" {
  default     = "Jimbo"
  description = "Moniker to apply to all resources in the module"
  type        = string
}

variable "tags" {
  default     = {}
  description = "User-defined key-value pairs"
  type        = map(string)
}

variable "foobar" {
  default     = ["foo", "bar"]
  description = <<EOD
this is a multiline description
some call it a 'heredoc string'
they start with `<<`
EOD
  type        = list(string)
}


module "tags" {
  source  = "rhythmictech/tags/terraform"
  version = "1.1.0"

  enforce_case = "UPPER"
  names        = concat([var.name], var.foobar)
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
