#!/bin/bash

echo 'installing brew packages'
brew update
brew install tfenv tflint terraform-docs aquasecurity/trivy/trivy pre-commit coreutils
brew upgrade tfenv tflint terraform-docs aquasecurity/trivy/trivy pre-commit coreutils

echo 'installing pre-commit hooks'
pre-commit install

echo 'setting pre-commit hooks to auto-install on clone in the future'
git config --global init.templateDir ~/.git-template
pre-commit init-templatedir ~/.git-template

echo 'installing terraform with tfenv'
tfenv install
