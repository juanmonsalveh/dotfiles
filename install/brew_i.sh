# install brew
if ! hash brew
then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  brew update
  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> $HOME/.zprofile
  eval "$(/opt/homebrew/bin/brew shellenv)"
else
  printf "\e[93m%s\e[m\n" "You already have brew installed."
fi

# Install all our dependencies with bundle (See Brewfile)
brew tap homebrew/bundle

brew upgrade