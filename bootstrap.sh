#!/bin/sh

DOTFILES=$(pwd -P)

source $DOTFILES/zsh/functions/.log_f
source $DOTFILES/zsh/functions/.link_file_f

info "Setting up the Mac..."

info "install Brew"
sh $DOTFILES/install/brew_i.sh

info "install Oh My Zsh"
sh $DOTFILES/install/ohmyzsh_i.sh

info "installing nvm, js, node, sdkman, java, golang, python"
sh $DOTFILES/install/programming_languages_i.sh

info "binaries and apps with Brewfile"
brew bundle --file $DOTFILES/brew/Brewfile
sh $DOTFILES/brew/after_brew.sh

# configuration of dot files"
build_dotfile_links () {
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
        link_file "$src" "$dst"
    done
}
build_dotfile_links

success "Set up almost complete, ENJOY!!!"
info "Dont forget to install by hand other applications like GoodNotes, BitWarden"
