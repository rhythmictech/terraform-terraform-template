#!/bin/bash

echo 'installing dependencies'
sudo apt install python3-pip gawk &&\
pip3 install pre-commit

# terraform docs
mkdir tmp
cd tmp
curl -Lo ./terraform-docs.tar.gz https://github.com/terraform-docs/terraform-docs/releases/download/v0.16.0/terraform-docs-v0.16.0-$(uname)-amd64.tar.gz
tar -xzf terraform-docs.tar.gz
chmod +x terraform-docs
sudo mv terraform-docs /usr/bin/
cd ..
rm -rf tmp

curl -L "$(curl -sL https://api.github.com/repos/terraform-linters/tflint/releases/latest | grep -o -E "https://.+?_linux_amd64.zip")" > tflint.zip && unzip tflint.zip && rm tflint.zip && sudo mv tflint /usr/bin/
go install github.com/aquasecurity/tfsec/cmd/tfsec@latest
git clone https://github.com/tfutils/tfenv.git ~/.tfenv || true
mkdir -p ~/.local/bin/
. ~/.profile
ln -s ~/.tfenv/bin/* ~/.local/bin

echo 'installing pre-commit hooks'
pre-commit install

echo 'setting pre-commit hooks to auto-install on clone in the future'
git config --global init.templateDir ~/.git-template
pre-commit init-templatedir ~/.git-template

echo 'installing terraform with tfenv'
tfenv install
