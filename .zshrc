# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="$HOME/.oh-my-zsh"

# Detect Termux
IS_TERMUX=0
if [[ -n "$TERMUX_VERSION" ]] || [[ -d "/data/data/com.termux" ]]; then
    IS_TERMUX=1
fi

# Set PATH based on platform
if [[ $IS_TERMUX -eq 1 ]]; then
    # Termux - use PREFIX for binaries
    export PATH="$PREFIX/bin:$HOME/.local/bin:$HOME/.cargo/bin:$PATH"
else
    export PATH="$HOME/.local/bin:$HOME/.opencode/bin:$HOME/.cargo/bin:$HOME/.volta/bin:$HOME/.bun/bin:$HOME/.nix-profile/bin:/nix/var/nix/profiles/default/bin:/usr/local/bin:$HOME/.config:$HOME/.cargo/bin:/usr/local/lib/*:$PATH"
fi

# Set nvim as default editor for opencode and other tools
export EDITOR="nvim"
export VISUAL="nvim"

if [[ $- == *i* ]]; then
    # Commands to run in interactive sessions can go here
fi

export LS_COLORS="di=38;5;67:ow=48;5;60:ex=38;5;132:ln=38;5;144:*.tar=38;5;180:*.zip=38;5;180:*.jpg=38;5;175:*.png=38;5;175:*.mp3=38;5;175:*.wav=38;5;175:*.txt=38;5;223:*.sh=38;5;132"
if [[ "$(uname)" == "Darwin" ]]; then
  alias ls='ls --color=auto'
else
  alias ls='gls --color=auto'
fi

# Homebrew setup (skip on Termux)
if [[ $IS_TERMUX -eq 0 ]]; then
    if [[ "$(uname)" == "Darwin" ]]; then
        # macOS - check for Apple Silicon vs Intel
        if [[ -f "/opt/homebrew/bin/brew" ]]; then
            # Apple Silicon (M1/M2/M3)
            BREW_BIN="/opt/homebrew/bin"
        elif [[ -f "/usr/local/bin/brew" ]]; then
            # Intel Mac
            BREW_BIN="/usr/local/bin"
        fi
    else
        # Linux
        BREW_BIN="/home/linuxbrew/.linuxbrew/bin"
    fi

    # Only eval brew shellenv if brew is installed
    if [[ -n "$BREW_BIN" && -f "$BREW_BIN/brew" ]]; then
        eval "$($BREW_BIN/brew shellenv)"
    fi
fi

# Zsh plugins - different paths for Termux vs Homebrew
if [[ $IS_TERMUX -eq 1 ]]; then
    # Termux - plugins installed via pkg
    [[ -f "$PREFIX/share/zsh-autocomplete/zsh-autocomplete.plugin.zsh" ]] && source "$PREFIX/share/zsh-autocomplete/zsh-autocomplete.plugin.zsh"
    [[ -f "$PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]] && source "$PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
    [[ -f "$PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh" ]] && source "$PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
    # Powerlevel10k on Termux - may need manual install
    [[ -f "$PREFIX/share/powerlevel10k/powerlevel10k.zsh-theme" ]] && source "$PREFIX/share/powerlevel10k/powerlevel10k.zsh-theme"
else
    source $(dirname $BREW_BIN)/share/zsh-autocomplete/zsh-autocomplete.plugin.zsh
    source $(dirname $BREW_BIN)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
    source $(dirname $BREW_BIN)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
    source $(dirname $BREW_BIN)/share/powerlevel10k/powerlevel10k.zsh-theme
fi

export PROJECT_PATHS="/home/alanbuscaglia/work"
export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
export FZF_DEFAULT_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exlude .git"

WM_VAR="$ZELLIJ"
WM_CMD="zellij"

function start_if_needed() {
    if [[ $- == *i* ]] && [[ -z "${WM_VAR#/}" ]] && [[ -t 1 ]] && command -v zellij &>/dev/null; then
        exec $WM_CMD
    fi
}

# ─── ALIAS ───────────────────────────────────────────────────

# FZF & Nvim
alias fzfbat='fzf --preview="bat --theme=gruvbox-dark --color=always {}"'
alias fzfnvim='nvim $(fzf --preview="bat --theme=gruvbox-dark --color=always {}")'
alias v="nvim"
alias vim="nvim"

# ─── ACTUALIZACIONES SISTEMA (Arch Linux) ───────────────────

# Pacman
alias update="sudo pacman -Syyu"
alias upgrade="sudo pacman -Syu"
alias install="sudo pacman -S"
alias remove="sudo pacman -Rns"
alias search="pacman -Ss"
alias search-local="pacman -Qs"
alias paclean="sudo pacman -Rns $(pacman -Qtdq)"
alias paclist="pacman -Qe"
alias pacinfo="pacman -Si"

# Yay (AUR helper)
alias yupdate="yay -Syu"
alias yupgrade="yay -Syu"
alias yinstall="yay -S"
alias yremove="yay -Rns"
alias ysearch="yay -Ss"
alias yclean="yay -Yc"

# ─── NAVEGACION RAPIDA ───────────────────────────────────────

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias -- -="cd -"

alias home="cd ~"
alias desk="cd ~/Escritorio"
alias down="cd ~/Descargas"
alias docs="cd ~/Documentos"
alias prog="cd ~/Documentos/programacion/"
alias proy="cd ~/Proyectos"

# Listado mejorado
if command -v eza &>/dev/null; then
  alias ls="eza --color=auto"
  alias ll="eza -la --color=auto"
  alias l="eza -l --color=auto"
  alias la="eza -la --color=auto"
  alias lt="eza -T --color=auto"
else
  alias ls="ls --color=auto"
  alias ll="ls -la --color=auto"
  alias l="ls -l --color=auto"
  alias la="ls -la --color=auto"
  alias lt="tree"
fi

# ─── GIT ─────────────────────────────────────────────────────

alias g="git"
alias ga="git add"
alias gaa="git add -A"
alias gc="git commit"
alias gcm="git commit -m"
alias gco="git checkout"
alias gcb="git checkout -b"
alias gd="git diff"
alias gds="git diff --staged"
alias gf="git fetch"
alias gl="git log --oneline --graph --decorate"
alias gll="git log --graph --pretty=format:'%C(yellow)%h%Creset -%C(auto)%d%Creset %s %C(green)(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias gs="git status"
alias gss="git status -s"
alias gp="git push"
alias gpl="git pull"
alias gpla="git pull --all"
alias gps="git push --follow-tags"
alias gr="git remote"
alias grv="git remote -v"
alias gb="git branch"
alias gba="git branch -a"
alias gst="git stash"
alias gstp="git stash pop"
alias gstl="git stash list"
alias gm="git merge"
alias grb="git rebase"
alias greset="git reset --hard HEAD"
alias gclean="git clean -fd"

# ─── OTROS UTILES ────────────────────────────────────────────

alias c="clear"
alias cls="clear"
alias h="history"
alias hist="history | grep"
alias which="command -v"
alias cp="cp -i"
alias mv="mv -i"
alias rm="rm -i"
alias mkdir="mkdir -p"
alias df="df -h"
alias du="du -h"
alias free="free -h"
alias ps="ps aux"
alias psg="ps aux | grep"
alias ports="ss -tulpn"
alias listen="ss -tulpn | grep LISTEN"
alias myip="curl -s ifconfig.me"
alias weather="curl -s wttr.in"

#plugins
plugins=(
  command-not-found
)

# Evita recargar oh-my-zsh si HyDE ya lo cargó
if ! typeset -f _omz_urlencode &>/dev/null; then
    source $ZSH/oh-my-zsh.sh
fi

export CARAPACE_BRIDGES='zsh,fish,bash,inshellisense'
zstyle ':completion:*' format $'\e[2;37mCompleting %d\e[m'
source <(carapace _carapace)

eval "$(fzf --zsh)"
eval "$(zoxide init zsh)"
eval "$(atuin init zsh)"

source /home/linuxbrew/.linuxbrew/share/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

start_if_needed



export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

if command -v fastfetch &>/dev/null; then
    fastfetch --logo-type kitty
fi

