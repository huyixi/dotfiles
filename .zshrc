# git clone https://github.com/denysdovhan/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt" --depth=1
# ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"
ZSH_THEME="spaceship"

# git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
# git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
# git clone https://github.com/agkozak/zsh-z $ZSH_CUSTOM/plugins/zsh-z
plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
  zsh-z
  autojump
)

# https://ohmyz.sh/
export ZSH="$HOME/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh

# -------------------------------- #
# Node Package Manager
# -------------------------------- #
# https://github.com/antfu/ni

alias ni="pnpm install"
alias nio="ni --prefer-offline"
alias s="nr start"
alias d="nr dev"
alias b="nr build"
alias bw="nr build --watch"
alias t="nr test"
alias tu="nr test -u"
alias tw="nr test --watch"
alias w="nr watch"
alias np="nr play"
alias tc="nr typecheck"
alias lint="nr lint"
alias lintf="nr lint --fix"
alias release="nr release"
alias re="nr release"
alias clean="sudo /usr/local/bin/mac-cleanup"

# -------------------------------- #
# Git
# -------------------------------- #

# Use github/hub
alias git=hub

# Go to project root
alias grt='cd "$(git rev-parse --show-toplevel)"'

alias gs='git status'
alias g='git push'
alias gpf='git push --force'
alias gpft='git push --follow-tags'
alias gpl='git pull --rebase'
alias gcl='git clone'
alias gst='git stash'
alias grm='git rm'
alias gmv='git mv'

alias main='git checkout main'

alias gco='git checkout'
alias gcob='git checkout -b'

alias gb='git branch'
alias gbd='git branch -d'

alias grb='git rebase'
alias grbom='git rebase origin/master'
alias grbc='git rebase --continue'

alias gl='git log'
alias glo='git log --oneline --graph'

alias grh='git reset HEAD'
alias grh1='git reset HEAD~1'

alias ga='git add'
alias gA='git add -A'

alias gc='git commit'
alias gcm='git commit -m'
alias gca='git commit -a'
alias gcam='git add -A && git commit -m'
alias gfrb='git fetch origin && git rebase origin/master'

alias gxn='git clean -dn'
alias gx='git clean -df'

alias gsha='git rev-parse HEAD | pbcopy'

alias ghci='gh run list -L 1'

# git add + git commit + git push
function gac() {
  git add ${2:-.} &&
  git commit -m "$1" &&
  git push
}

function p(){
	git add . &&
	git commit -m "chore" &&
	git push
}

# 生成 .gitignore
function ignore() {
  if [ -f ".gitignore" ]; then
    logRed ".gitignore已存在"
    return
  fi
  logGreen "正在生成.gitignore"
  touch .gitignore
  echo "*.DS_Store  \nnode_modules \n*.log \nidea/ \n*.local \n.DS_Store \ndist \n.cache \n.idea \nlogs \n&-debug.log \n*-error.log \n*__pycache__/" >>.gitignore
}

function ginit() {
  git init "$@"
  echo "*.DS_Store  \nnode_modules \n*.log \nidea/ \n*.local \n.DS_Store \ndist \n.cache \n.idea \nlogs \n*-debug.log \n*-error.log \n*__pycache__/" >> .gitignore
  current_folder=${PWD##*/}
  echo "# $current_folder" > README.md
}

function glp() {
  git --no-pager log -$1
}

function gd() {
  if [[ -z $1 ]] then
    git diff --color | diff-so-fancy
  else
    git diff --color $1 | diff-so-fancy
  fi
}

function gdc() {
  if [[ -z $1 ]] then
    git diff --color --cached | diff-so-fancy
  else
    git diff --color --cached $1 | diff-so-fancy
  fi
}

# open git remote repository
function ogr() {
    local remote_url=$(git config --get remote.origin.url)
    if [[ "$OSTYPE" == "darwin"* ]]; then
        open $remote_url
    elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
        xdg-open $remote_url
    else
        echo "Unsupported OS type: $OSTYPE"
    fi
}

#--------------------------#
# script magage
# -------------------------#
alias cc='bash ~/i/automator/copy-clip.sh'
alias bk='bash ~/i/automator/backup-dotfiles.sh'

#--------------------------#
# Other
# -------------------------#
alias zshrc="source ~/.zshrc && cd ~/i/dotfiles && bk && gac 'update zshrc'"

# -------------------------------- #
# Directories
#
# I put
# `~/i` for my projects
# `~/f` for forks
# `~/r` for reproductions
# Other
# w for write
# c for code
# -------------------------------- #

function i() {
  cd ~/i/$1
}

function wi(){
  if [ -d ~/i/huyixi.wiki ]
  then
    cd ~/i/huyixi.wiki
  else
    cd ~/i/wiki
  fi
}

function wwi(){
  if [ -d ~/i/huyixi.wiki/docs ]
  then
    cd ~/i/huyixi.wiki/docs
  else
    cd ~/i/wiki/docs
  fi
}

function wiki(){
  if [ -d ~/i/huyixi.wiki ]
  then
    cd ~/i/huyixi.wiki
  else
    cd ~/i/wiki
  fi
}
# -------------------------------- #
# Shortcut
#
# o for open
# doc for document
# -------------------------------- #

alias owi='open https://huyixi.wiki'
alias owiki='open https://huyixi.wiki'
alias ocom='open https://huyixi.com'
alias oorg='open https://huyixi.org'
alias ob='open https://huyixi.org'
alias oblog='open https://huyixi.org'

function com(){
  if [ -d ~/i/huyixi.com ]
  then
    cd ~/i/huyixi.com
  else
    cd ~/i/com
  fi
}

function wcom(){
  if [ -d ~/i/huyixi.com/content/post ]
  then
    cd ~/i/huyixi.com/content/post
  else
    cd ~/i/com/content/post
  fi
  open .
}

function org(){
  if [ -d ~/i/huyixi.org ]
  then
    cd ~/i/huyixi.org
  else
    cd ~/i/org
  fi
}

function worg(){
  if [ -d ~/i/huyixi.org/content ]
  then
    cd ~/i/huyixi.org/content
  else
    cd ~/i/org/content/posts
  fi
  open .
}

function repros() {
  cd ~/r/$1
}

function forks() {
  cd ~/f/$1
}

function pr() {
  if [ $1 = "ls" ]; then
    gh pr list
  else
    gh pr checkout $1
  fi
}

function dir() {
  mkdir $1 && cd $1
}

function clone() {
  if [[ -z $2 ]] then
    hub clone "$@" && cd "$(basename "$1" .git)"
  else
    hub clone "$@" && cd "$2"
  fi
}

# Clone to ~/i and cd to it
function clonei() {
  i && clone "$@" && code . && cd ~2
}

function cloner() {
  repros && clone "$@" && code . && cd ~2
}

function clonef() {
  forks && clone "$@" && code . && cd ~2
}

function ci() {
  i && code "$@" && cd -
}

function serve() {
  if [[ -z $1 ]] then
    live-server dist
  else
    live-server $1
  fi
}
source /opt/homebrew/opt/spaceship/spaceship.zsh

function ya() {
	tmp="$(mktemp -t "yazi-cwd.XXXXX")"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/homebrew/Caskroom/miniconda/base/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/homebrew/Caskroom/miniconda/base/etc/profile.d/conda.sh" ]; then
        . "/opt/homebrew/Caskroom/miniconda/base/etc/profile.d/conda.sh"
    else
        export PATH="/opt/homebrew/Caskroom/miniconda/base/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# PATH Configuration
# Adding directories to PATH for various tools and utilities
export PATH="/usr/local/opt/ruby/bin:/opt/homebrew/opt/ruby/bin:/opt/homebrew/bin:/opt/homebrew/Caskroom/miniconda/base/bin::$PATH"
# Additional User Configurations (if any)

export PATH="/usr/local/opt/ruby/bin:$PATH"
export PATH="/usr/local/opt/ruby/bin:$PATH"
export PATH="/usr/local/opt/ruby/bin:$PATH"
export PATH="/opt/homebrew/opt/ruby/bin:$PATH"
export PATH="/opt/homebrew/opt/ruby/bin:$PATH"
export PATH="/opt/homebrew/bin:$PATH"
export PATH="/opt/homebrew/miniconda/bin:$PATH"
export JAVA_HOME="/Library/Java/JavaVirtualMachines/zulu-11.jdk/Contents/Home"

# bun completions
[ -s "/Users/huyixi/.bun/_bun" ] && source "/Users/huyixi/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
export PATH="/opt/homebrew/opt/openjdk@17/bin:$PATH"
export JAVA_HOME=/opt/homebrew/Cellar/openjdk@17/17.0.9/libexec/openjdk.jdk/Contents/Home
export YAZI_CONFIG_HOME=~/.config/yazi
source /opt/homebrew/opt/spaceship/spaceship.zsh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

#--------------------------#
# project simple
# -------------------------#

alias cls="clear" # 清理终端
alias ..="cd .." # 返回上一级
alias 。。="cd .." # 返回上一级
alias ...="cd ../.." # 返回上上级
alias 。。。="cd ../.." # 返回上上级
alias ....="cd ../../.." # 返回上上上级

# -------------------------------- #
# Alias
# -------------------------------- #
alias o="open"
alias o.="open ."
alias c="code"
alias c.="code ."
alias pip='pip3'
alias hugo="/opt/homebrew/bin/hugo"
alias cohu="cd ~/i/huyixi.com && ~/i/huyixi.com/utils/chu.sh"
alias hn="~/i/huyixi.org/utils/hugo-new.sh"
alias hs="~/i/utils/hugo-server.sh"

#--------------------------#
# Reference
# -------------------------#

# antfu: https://github.com/antfu/dotfiles/blob/main/.zshrc
# Simon-He95: https://github.com/Simon-He95/awesome-collections/blob/bf5089729fe51251ba2338242ffdf587647caab3/zshrc/.zshrc#L164

# pnpm
export PNPM_HOME="/Users/huyixi/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# mdbook-epub
export PATH="$PATH:/Users/huyixi/.cargo/bin"
# mdbook-epub end
