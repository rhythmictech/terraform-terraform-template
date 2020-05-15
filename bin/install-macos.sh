#!/bin/bash

echo 'installing brew packages'
brew install tfenv tflint terraform-docs pre-commit

echo 'installing pre-commit hooks'
pre-commit install

echo 'installing terraform with tfenv'
tfenv install
