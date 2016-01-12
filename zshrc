# Disable oh-my-zsh auto-update prompt. This needs to be done here so it
# happens before oh-my-zsh is actually loaded.
DISABLE_AUTO_UPDATE=true

# Clone the zgen repo if it doesn't exist already
[[ ! -d "$HOME/.zgen" ]] && git clone https://github.com/tarjoilija/zgen "$HOME/.zgen"

# Attempt to load zgen
source "$HOME/.zgen/zgen.zsh"

# Now that zgen is loaded, if there isn't a saved version, we need to try
# and bootstrap our plugins as best as we can. Any time after the first runm
# we can skip this because the zgen save will ensure these are a part of zgen's
# init.
if ! zgen saved; then
	# Both oh-my-zsh and prezto are supported by zgen. I use oh-my-zsh, but
	# only enable a small number of the features, but both are good options.
	zgen oh-my-zsh

	# z.sh is a very useful program which will remember which dirs you cd
	# to and provide a simple command (z) to jump back to them. We can
	# bootstrap it completely using zgen.
	# First we load the command from the repo itself, the file z.sh in
	# the rupa/z github repo. Next we load the oh-my-zsh plugin for it.
	zgen load rupa/z z.sh
	zgen oh-my-zsh plugins/z

	# Load the theme. Note that gallois needs the git plugin to be loaded
	# or it will throw errors when you cd into a git repo.
	zgen oh-my-zsh plugins/git
	zgen oh-my-zsh themes/gallois

	# This save will save everything we just bootstrapped into the zgen init
	# file
	zgen save
fi

# This will attempt to load the .zshrc.local in your home dir so you can add
# settings which will only be on a specific computer.
[[ -f "$HOME/.zshrc.local" ]] && source "$HOME/.zshrc.local"
