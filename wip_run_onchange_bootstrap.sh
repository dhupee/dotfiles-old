#!/bin/bash

# Stole this script from Logan Donley
# His Github Repo: https://github.com/logandonley/dotfiles

# .bootstrap/setup.yml hash: {{ include "dot_bootstrap/setup.yml" | sha256sum }}

if command -v ansible-playbook &>/dev/null; then
	TYPE=$(cat $HOME/.machine_type.dots)
	ansible-playbook -e "machine_type=$(TYPE)" {{ joinPath .chezmoi.sourceDir "dot_bootstrap/setup.yml" | quote }} --ask-become-pass
fi
