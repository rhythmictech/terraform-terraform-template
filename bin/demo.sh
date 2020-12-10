#!/bin/bash


##########################################
# use the magic
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
# Demo
##########################################

# use filebrowser
# pe "code .pre-commit-config.yaml"
# pe "code .tflint.hcl"
# pe "code .yamllint.yml"

# we can run them and see no bugs
pe "pre-commit run -a"

# add a bug
pe "echo 'BUG!!!' > main.tf "

# it found the bug
pe "git commit"

# fix it interactively
cmd

# show a prompt so as not to reveal our true nature after
# the demo has concluded
p ""
