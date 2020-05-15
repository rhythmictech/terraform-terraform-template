# terraform-anycloud-template [![](https://github.com/rhythmictech/terraform-anycloud-template/workflows/check/badge.svg)](https://github.com/rhythmictech/terraform-anycloud-template/actions) <a href="https://twitter.com/intent/follow?screen_name=RhythmicTech"><img src="https://img.shields.io/twitter/follow/RhythmicTech?style=social&logo=RhythmicTech" alt="follow on Twitter"></a>
Template repository for terraform modules. Good for any cloud and any provider.

## Example
Here's what using the module will look like
```
module "example" {
  source = "rhythmictech/terraform-mycloud-mymodule
}
```

## About

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

No requirements.

## Providers

No provider.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| env | Environment to tag resources with | `string` | `"default"` | no |
| name | Moniker to apply to all resources in the module | `string` | n/a | yes |
| tags | User-Defined tags | `map(string)` | `{}` | no |

## Outputs

No output.

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## The Giants underneath this module
- pre-commit.com/
- www.terraform.io/
- github.com/tfutils/tfenv
- github.com/segmentio/terraform-docs
