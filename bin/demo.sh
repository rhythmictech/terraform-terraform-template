#!/bin/bash


##########################################
# use the magic
# https://github.com/paxtonhare/demo-magic/tree/10abf5390b6d5461155dc58012081490598f7bad
##########################################
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
source $DIR/demo-magic.sh

##########################################
# set the magic values
##########################################

# speed at which to simulate typing. bigger num = faster
TYPE_SPEED=20

# custom prompt
# see http://www.tldp.org/HOWTO/Bash-Prompt-HOWTO/bash-prompt-escape-sequences.html for escape sequences
DEMO_PROMPT="${GREEN}➜ ${CYAN}\W "

# text color
# DEMO_CMD_COLOR=$BLACK

# hide the evidence
clear

##########################################
# Demo:
# 1. look at the (commented) files containing the configuration information
# 2. start the demo by running the pre-commit hooks
# 3. make a change
# 4. try and fail to commit
# 5. restore
# 6. watch hook write docs
##########################################

# use filebrowser
# to investigate what's in the pre-commit config
# pe "code .pre-commit-config.yaml"
# pe "code .tflint.hcl"
# pe "code .yamllint.yml"

# we can run them and see no bugs
pe "pre-commit run -a"

# create a bug
pe "code main.tf"
# pe "echo 'BUG!!!' > main.tf "

# terraform knows about the bug
pe "terraform init"

# add a bug
pe "git add main.tf"

# try to commit but it found the bug
pe "git commit"

# fix it
pe "git reset . && git restore ."

# uncomment the final output
pe "code main.tf"

# add and commit
pe "git add main.tf"
pe "git commit"

# it fixed the readme!
# pe "code README.md"

# now add and commit
pe "git add main.tf README.md"
pe "git commit"

# show a prompt so as not to reveal our true nature after
# the demo has concluded
p ""
