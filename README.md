# Simple Dotfiles Framework

This is a small repo designed to provide a simple way of getting with
configuring quite a few things. Packages like vim, emacs, and zsh can be hard
to start configuring if you don't know what you're doing.

Note that the configurations in here are meant as a *starting point* and not as
config files for everyday use.

## Bootstrapping

There are a few steps to bootstrapping this, but they're not very complicated.

Firstly, make sure you have the dependencies you need.

* git
* tmux
* vim
* zsh
* [rcm](https://github.com/thoughtbot/rcm)

Next, make sure your repo is cloned to ~/.dotfiles. rcm assumes that your
dotfiles are located here.

Next, cd to ~/.dotfiles and run the following:

* `RCRC=./rcrc rcup` This will symlink all the needed files into your home
directory. We only need to specify the RCRC explicitly once, because after
this point it will be symlinked in your home.
* `vim +PlugInstall` This will force vim-plug to install all missing plugins
it knows about.

Then once your shell is set to zsh, it should bootstrap itself the first time
it's opened.

## Sample configs

### tmux

There's nothing too special in the tmux config. It adds mouse support and a
few other useful features.

### vim

In addition to setting some default settings, this repo contains
[vim-plug](https://github.com/junegunn/vim-plug). vim-plug makes it easier to
manage vim plugins without having to worry about which ones have been cloned
yet and which ones are behind. I recommend reading up on the documentation for
vim-plug if you haven't already.

Note that there are a number of other useful plugin managers, all of which
have pros and cons. I personally prefer vim-plug, but here are a few other
commonly used ones:

* [pathogen](https://github.com/tpope/vim-pathogen)
* [vundle](https://github.com/VundleVim/Vundle.vim)

### zsh

Plugins in zsh are slightly more complicated. There are multiple frameworks,
but with most of them, you end up learning the framework more than the shell.
This setup uses [zgen](https://github.com/tarjoilija/zgen) which is a sane
wrapper around these frameworks to make them work more like libraries for your
shell than full frameworks.

The config is structured in a slightly strange way, but there are only a few things you actually need to keep in mind.

Firstly, the `if ! zgen saved` block contains all the info for plugins. Where
to download them from, which ones to load. That sort of thing. At the end of
this block `zgen save` is called which will remember the plugins you've
loaded. If you ever go back and change the plugins in your zshrc, be sure to
run `zgen reset` so zgen can find them.

And secondly, most customizations should come after the previously mentioned block
but before the line about `.zshrc.local`. This allows for plugins to have
their settings overwritten by your zshrc and have that overwritten by machine
specific code in `.zshrc.local`. You may want to put env variables earlier in
your zshrc, but that's all up to you.

## License

The contents of this repo are released into the public domain. I have no
desire to require anyone to open source their dotfiles for legal reasons.
However, if you feel like contributing back and making this better, pull
requests would be welcome.
