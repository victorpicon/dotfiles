#!/usr/bin/env bash

# Cores para o terminal
GREEN='\033[0;32m'
NC='\033[0m' # Sem cor

echo -e "${GREEN}==> Iniciando a automação dos dotfiles com GNU Stow...${NC}"

# Garante que o script está rodando na pasta correta
cd "$(dirname "$0")"

# Lista de pastas/módulos que você quer linkar para o ~/.config ou ~/
# Adicione ou remova itens dessa lista conforme a estrutura do seu repo
APPS=(
    "hyprland"
    "kitty"
    "zsh"
    "swaync"
    "fastfetch"
    "starship"
)

# Cria a pasta ~/.config caso ela não exista no sistema novo
mkdir -p "$HOME/.config"

for app in "${APPS[@]}"; do
    if [ -d "$app" ]; then
        echo -e "${GREEN}==> Linkando a configuração de: $app${NC}"
        
        # O comando abaixo força o Stow a ignorar conflitos antigos e criar os links
        stow --adopt "$app"
    else
        echo "Aviso: Pasta '$app' não encontrada no repositório. Pulando..."
    fi
done

# Restaura arquivos que o --adopt possa ter alterado localmente (garante o estado do Git)
git checkout .

echo -e "${GREEN}==> Tudo pronto! Dotfiles aplicados com sucesso.${NC}"