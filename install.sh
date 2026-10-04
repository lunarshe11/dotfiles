#!/bin/bash
set -e

dotfiles="$(cd "$(dirname "$0")" && pwd)"
backup="$HOME/.dotfiles-backup-$(date +%Y%m%d-%H%M%S)"

echo "=== dotfiles: $dotfiles ==="
echo "=== backup: $backup ==="

mkdir -p "$backup"

backup_item() {
    local path="$1"
    if [ -e "$path" ]; then
        mkdir -p "$(dirname "$backup/$path")"
        cp -r "$path" "$backup/$path" 2>/dev/null || true
        echo "  saved: $path"
    fi
}

echo ""
echo "=== backup existing configs ==="
backup_item "$HOME/.config/hypr"
backup_item "$HOME/.config/kitty"
backup_item "$HOME/.config/fish"
backup_item "$HOME/.config/ttt"
backup_item "$HOME/.config/noctalia"

echo ""
echo "=== install configs ==="

mkdir -p ~/.config/hypr
cp "$dotfiles/hypr/"*.lua ~/.config/hypr/ 2>/dev/null || true
cp "$dotfiles/hypr/"*.conf ~/.config/hypr/ 2>/dev/null || true

mkdir -p ~/.config/kitty
cp "$dotfiles/kitty/kitty.conf" ~/.config/kitty/ 2>/dev/null || true

mkdir -p ~/.config/fish
cp "$dotfiles/fish/config.fish" ~/.config/fish/ 2>/dev/null || true

mkdir -p ~/.config/ttt
cp "$dotfiles/ttt/"*.json ~/.config/ttt/ 2>/dev/null || true

mkdir -p ~/.config/noctalia
cp "$dotfiles/noctalia/settings.toml" ~/.config/noctalia/ 2>/dev/null || true

echo ""
echo "=== install nbfc config ==="
if [ -f "$dotfiles/nbfc/METAPHYUNI MetawillBook 02.json" ]; then
    if [ -d /usr/share/nbfc/configs/ ]; then
        sudo cp "$dotfiles/nbfc/METAPHYUNI MetawillBook 02.json" /usr/share/nbfc/configs/
        sudo systemctl restart nbfc_service 2>/dev/null || true
        echo "  fan curve installed"
    else
        echo "  nbfc-linux not installed, skipping"
    fi
fi

echo ""
echo "=== install greeter ==="
if [ -f "$dotfiles/noctalia/greeter.toml" ]; then
    if [ -d /var/lib/noctalia-greeter/ ]; then
        sudo cp "$dotfiles/noctalia/greeter.toml" /var/lib/noctalia-greeter/ 2>/dev/null || true
        echo "  greeter installed"
    fi
fi

echo ""
echo "=== done ==="
echo "backup: $backup"
echo ""
echo "next:"
echo "  hyprctl reload"
echo "  nbfc status"
echo "  systemctl --failed"
