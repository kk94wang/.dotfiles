#!/bin/bash
# Config list
# Author: Ali Hassani (@alihassanijr)
# NOTE: this should be sourced from ./dotfiles/


# Commonrc: things I want in both zsh and bash 
link_commonrc() {
  link_to_home "Commonrc" "commonrc" ".commonrc"
}

# Bashrc
link_bashrc() {
  link_to_home "Bashrc" "bashrc" ".bashrc2"
  # I don't overwrite ~/.bashrc, I think that's rude
  # I just have it source the extras I'd want, which 
  # is mostly just sourcing commonrc.
  SOURCEBASHRC="[ -f $HOME/.bashrc2 ] && source $HOME/.bashrc2"
  # Check if it's already appended
  if grep -Fxq "$SOURCEBASHRC" $HOMEDIR/.bashrc; then
      echo "Perfect! Looks like you already installed once. Skipping appending bashrc to ~/.bashrc because it's already there!"
  else
      echo "Appending bashrc to ~/.bashrc"
      echo $SOURCEBASHRC >> $HOMEDIR/.bashrc
  fi
}

# Inputrc
link_inputrc() {
  if [[ "$OSTYPE" == "darwin"* ]]; then
    link_to_home "Inputrc (mac)" "inputrc.mac" ".inputrc"
  else
    link_to_home "Inputrc" "inputrc" ".inputrc"
  fi
}

# Base16 colors
link_base16colors() {
  # Commonrc will read this if it exists
  link_to_home "Base16 Colors" "base16colors" ".base16colors"
}

# LS colors
link_lscolors() {
  # Commonrc will read this if it exists
  # Generated by vivid
  # https://github.com/sharkdp/vivid
  link_to_home "LS Colors" "lscolors" ".lscolors"
}

# Custom scripts
link_custom_scripts() {
  # Conda init
  link_bin "Anaconda initializer (cnda)" "scripts/cnda" "cnda"
  
  # True color vifm
  link_bin "Vifm with truecolor (vif)" "scripts/vif" "vif"

  # SSH Agent Init
  if [[ "$OSTYPE" == "darwin"* ]]; then
    link_bin "SSH agent initializer (sagent)" "scripts/sagent.mac" "sagent"
  else
    link_bin "SSH agent initializer (sagent)" "scripts/sagent" "sagent"
  fi

  # SSH Agent killer
  link_bin "SSH agent killer (kssh)" "scripts/kssh" "kssh"
}
