# ============================================================
# .zshrc — sanny
# ============================================================

# --- History ---
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history
setopt HIST_IGNORE_DUPS
setopt SHARE_HISTORY

# --- SSH Agent ---
if [ -z "$SSH_AUTH_SOCK" ]; then
    eval "$(ssh-agent -s)" > /dev/null
    ssh-add ~/.ssh/id_ed25519 2>/dev/null
fi

# --- Exports ---
export EDITOR=nvim
export VISUAL=nvim
export SUDO_EDITOR=nvim

# --- Fcitx5 (Japanese Input) ---
export GTK_IM_MODULE=wayland
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx
export SDL_IM_MODULE=fcitx

# --- Plugins ---
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# --- Aliases ---
alias ls='eza --icons'
alias ll='eza -lah --icons'
alias lt='eza --tree --icons'
alias cat='bat'
alias grep='rg'
alias find='fd'
alias top='btm'
alias f='yazi'
alias cfg='cd ~/.config'
alias update='paru -Syu'
alias cleanup='paru -Sc'

# --- Prompt ---
autoload -Uz vcs_info
precmd() { vcs_info }
zstyle ':vcs_info:git:*' formats ' (%b)'
setopt PROMPT_SUBST
PROMPT='%F{#E87FA0}╭─ %F{#F7AABC}%~%F{#F0C060}${vcs_info_msg_0_}%f
%F{#E87FA0}╰─%(?.%F{#E87FA0}.%F{#E94B67})❯%f '
# Note: colors above are Bocchi palette, replace with Monogatari palette in Phase 3

# --- Zoxide ---
eval "$(zoxide init zsh)"

# --- FZF ---
export FZF_DEFAULT_OPTS="
  --color=bg+:#1a1a1a,bg:#000000,spinner:#E87FA0,hl:#E94B67
  --color=fg:#F7AABC,header:#E94B67,info:#F0C060,pointer:#E87FA0
  --color=marker:#F7AABC,fg+:#F7AABC,prompt:#E87FA0,hl+:#E94B67
  --border rounded
  --height 40%"
# Note: colors above are Bocchi palette, replace with Monogatari palette in Phase 3

source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh
