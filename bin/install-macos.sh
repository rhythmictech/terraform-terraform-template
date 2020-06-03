#!/bin/bash

echo 'installing brew packages'
brew tap liamg/tfsec
brew install tfenv tflint terraform-docs pre-commit liamg/tfsec/tfsec

echo 'installing pre-commit hooks'
pre-commit install

echo 'installing terraform with tfenv'
tfenv install
