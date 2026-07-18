# --- Oh My Zsh ---
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="agnoster"

plugins=(
  git
  zsh-autosuggestions
  fast-syntax-highlighting
  brew
  macos
  docker
  sudo
  extract
  colored-man-pages
  history-substring-search
)

source $ZSH/oh-my-zsh.sh

# --- Confort shell ---
setopt AUTO_CD
setopt HIST_IGNORE_DUPS
setopt SHARE_HISTORY
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# ============================================================
#  Config existante
# ============================================================

# Créé par `pipx` le 2025-06-12
export PATH="$PATH:/Users/enio/.local/bin"

# Docker Desktop CLI completions
fpath=(/Users/enio/.docker/completions $fpath)
autoload -Uz compinit
compinit

# devkitPro
export DEVKITPRO=/opt/devkitpro
export DEVKITARM=$DEVKITPRO/devkitARM

alias python=python3
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"

export PATH="/usr/local/opt/libxml2/bin:$PATH"
export PATH="/usr/local/opt/libimobiledevice/bin:$PATH"

# ============================================================
#  Alias
# ============================================================
alias projets="cd ~/Projets"
alias web="cd ~/Projets/Web"
alias projscripts="cd ~/Projets/Scripts"
alias apps="cd ~/Projets/Applications"
alias itunes-scripts="cd ~/Scripts/iTunes"
alias dl-scripts="cd ~/Scripts/Téléchargement"
alias ytdlmusic="cd ~/Scripts/iTunes && ./ytdl-music.sh"

# ============================================================
#  Alias — Shell / power user
# ============================================================
alias ll="ls -lahG"
alias la="ls -laG"
alias ..="cd .."
alias ...="cd ../.."
alias reload="source ~/.zshrc"
alias zshconfig="code ~/.zshrc"
alias path='echo $PATH | tr -s ":" "\n"'
alias myip="curl -s ifconfig.me"
alias ports="lsof -i -P -n | grep LISTEN"
alias c="clear"
alias grep="grep --color=auto"
alias mkdir="mkdir -pv"

alias showfiles="defaults write com.apple.finder AppleShowAllFiles YES && killall Finder"
alias hidefiles="defaults write com.apple.finder AppleShowAllFiles NO && killall Finder"
alias flushdns="sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder"
alias cleands="find . -type f -name '*.DS_Store' -ls -delete"
alias lockscreen="pmset displaysleepnow"
alias spotlight-off="sudo mdutil -a -i off"
alias spotlight-on="sudo mdutil -a -i on"
alias update-brew="brew update && brew upgrade && brew cleanup"
alias caffeinate-on="caffeinate -dis"

# ============================================================
#  Alias — Développement Web
# ============================================================
alias phpserve="php -S localhost:8000"
alias npmstart="npm run start"
alias npmdev="npm run dev"
alias npmi="npm install"
alias gs="git status"
alias gp="git pull"
alias gpu="git push"
alias gc="git commit -m"

# ============================================================
#  Alias & fonctions — Vidéo / audio
# ============================================================
alias ytwav="yt-dlp -x --audio-format wav"
alias ytmp3="yt-dlp -x --audio-format mp3 --audio-quality 0"
alias probe="ffprobe -hide_banner"

mp4tomp3() {
  ffmpeg -i "$1" -vn -ar 44100 -ac 2 -b:a 192k "${1%.*}.mp3"
}

compressvideo() {
  ffmpeg -i "$1" -vcodec libx264 -crf "${2:-28}" "${1%.*}_compressed.mp4"
}

gifit() {
  ffmpeg -i "$1" -vf "fps=${2:-15},scale=480:-1:flags=lanczos" "${1%.*}.gif"
}

