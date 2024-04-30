# config for K8S command line
# after brew install asdf
# https://github.com/asdf-community/asdf-kubectl
asdf plugin-add kubectl https://github.com/asdf-community/asdf-kubectl.git
asdf install kubectl latest

# Remove outdated versions from the cellar.
brew cleanup
