#!/usr/bin/env bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE}")" && pwd)"
TARGET_SHELL="${1:-$SHELL}"

install_fish() {
    local target_dir="$HOME/.config/fish/functions"
    mkdir -p "$target_dir"
    cp -v "$SCRIPT_DIR/fish/"*.fish "$target_dir/"
    echo "Installed Fish helpers to $target_dir"
}

install_posix() {
    local rc_file="$1"
    local helper_dest="$HOME/.arch-helpers.sh"
    cp -v "$SCRIPT_DIR/bash-zsh/arch-helpers.sh" "$helper_dest"

    if ! grep -q "source \"$helper_dest\"" "$rc_file" 2>/dev/null; then
        echo "" >> "$rc_file"
        echo "# Arch Linux Helpers (archhelp, appfind, filefind)" >> "$rc_file"
        echo "source \"$helper_dest\"" >> "$rc_file"
        echo "archhelp" >> "$rc_file"
        echo "Added source & startup greeting to $rc_file"
    else
        echo "Updated $helper_dest (already sourced in $rc_file)"
    fi
}

case "$TARGET_SHELL" in
    *fish*)
        install_fish
        ;;
    *zsh*)
        install_posix "$HOME/.zshrc"
        ;;
    *bash*)
        install_posix "$HOME/.bashrc"
        ;;
    *)
        echo "Usage: ./install.sh [--fish | --bash | --zsh]"
        exit 1
        ;;
esac
