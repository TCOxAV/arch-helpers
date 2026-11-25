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
    local helper_dir="$HOME/.custom-helpers"
    mkdir -p "$helper_dir"
    cp -v "$SCRIPT_DIR/bash-zsh/"*.sh "$helper_dir/"

    local loader='for f in "$HOME/.custom-helpers/"*.sh; do [ -r "$f" ] && source "$f"; done'

    if ! grep -q ".custom-helpers" "$rc_file" 2>/dev/null; then
        echo "" >> "$rc_file"
        echo "# Custom Helpers (appfind, filefind, archhelp, greeting)" >> "$rc_file"
        echo "$loader" >> "$rc_file"
        echo "Added loader to $rc_file"
    else
        echo "Updated files in $helper_dir (already sourced in $rc_file)"
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
