#!/bin/sh
DOTFILES=$(pwd -P)
source $DOTFILES/zsh/functions/.log_f

install_dotfiles () {
  info 'installing dotfiles'
  local dotfiles="dotfiles_map"

  local overwrite_all=false backup_all=false skip_all=false

  cat "$dotfiles" | while read line
    do
        local src dst dir
        src=$(eval echo "$line" | cut -d '=' -f 1)
        dst=$(eval echo "$line" | cut -d '=' -f 2)
        dir=$(dirname $dst)

        mkdir -p "$dir"
        echo "$src:$dst"
    done
}

list_r_files(){
  local folder=$1
  find "$folder" -type f | while read -r file; do
    # Process each file
    echo "$file"
  done
}
list_r_files zsh
