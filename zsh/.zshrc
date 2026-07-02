# --- 1. ESTILO E CORES (Pywal & Vivid) ---
(cat ~/.cache/wal/sequences &)
export STARSHIP_CONFIG=~/.config/starship/starship.toml
export LS_COLORS="$(vivid generate ~/.cache/wal/colors-vivid.conf 2>/dev/null || vivid generate molokai)"

# --- 2. AMBIENTE E PATH ---
export LANG=pt_BR.UTF-8
export EDITOR=nvim
export PATH=$PATH:/home/revem/.spicetify
export HISTSIZE=10000
export SAVEHIST=10000
export HISTFILE=~/.zsh_history
export LLAMA_CACHE="/mnt/windows/llms/cache"
setopt SHARE_HISTORY

# --- ASDF SETUP (Limpo e sem erros) ---
# Testa os caminhos comuns do Arch Linux
if [ -f /opt/asdf-vm/asdf.sh ]; then
    . /opt/asdf-vm/asdf.sh
elif [ -f /etc/profile.d/asdf-vm.sh ]; then
    . /etc/profile.d/asdf-vm.sh
fi

# Garante que os shims (javac, etc) funcionem
export PATH="$HOME/.asdf/shims:$PATH"

# Carrega o JAVA_HOME se o plugin existir
[ -f "$HOME/.asdf/plugins/java/set-java-home.zsh" ] && . "$HOME/.asdf/plugins/java/set-java-home.zsh"

# --- 3. SISTEMA DE COMPLETAGE (ZSH) ---
# O fzf-tab precisa que o compinit seja carregado primeiro
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}' # Busca sem diferenciar maiúsculas

# --- 4. PLUGINS (fzf-tab) ---
if [ -f ~/.fzf-tab/fzf-tab.plugin.zsh ]; then
    source ~/.fzf-tab/fzf-tab.plugin.zsh
fi

# --- 5. CONFIGURAÇÃO DO SELETOR (Visual do Menu) ---
zstyle ':fzf-tab:*' fzf-command fzf
zstyle ':fzf-tab:*' fzf-flags \
  --height=40% \
  --layout=reverse \
  --border=rounded \
  --inline-info \
  --color="bg:-1,fg:-1,bg+:#2c2e34,fg+:7,hl:4,hl+:4" \
  --color="prompt:4,info:6,pointer:2,marker:2,spinner:1"

# Preview com Ícones usando o eza
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --icons=always --color=always $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'eza -1 --icons=always --color=always $realpath'

# --- 6. ALIASES (Seus atalhos mantidos) ---
alias ls='eza --icons=always'
alias ll='eza -lh --icons=always'
alias la='eza -a --icons=always'
alias lt='eza --tree --icons=always'
alias spotify='flatpak run com.spotify.Client'
alias ff='fastfetch --logo ~/fastfetch/logo/Hatsune-Miku-PNG-File.png'
alias v='nvim'
alias llm='LLAMA_CACHE="/mnt/windows/llms/cache" ~/llama.cpp/build/bin/llama-server -hf unsloth/Qwen3.5-35B-A3B-GGUF:UD-Q4_K_XL --ctx-size 4096 --temp 0.6 --top-p 0.95 --top-k 20 --min-p 0.00 --n-gpu-layers 10 --threads 12 --port 8080'
alias nemo='LLAMA_CACHE="/mnt/windows/llms/cache" ~/llama.cpp/build/bin/llama-server -hf SicariusSicariiStuff/Impish_Nemo_12B_GGUF:Q4_K_M --host 0.0.0.0 --ctx-size 4096 --n-gpu-layers 32 --port 8081'
alias warp-on='sudo wg-quick up warp'
alias warp-off='sudo wg-quick down warp'
alias warp-stat='sudo wg show warp'

# --- 7. INICIALIZAÇÃO DE FERRAMENTAS ---
eval "$(starship init zsh)"
eval "$(zoxide init zsh)"

# Previne o menu nativo de aparecer junto com o fzf-tab
zstyle ':completion:*' menu noexport LLAMA_CACHE="/mnt/windows/llms/cache"

export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export PATH="$HOME/.local/bin:$PATH"
