#!/usr/bin/env bash

set -euo pipefail

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"

TARGET_SHELL=""

usage() {
    printf 'Usage: %s [--bash | --zsh | --fish | --help]\n' "$0"
}

while (($#)); do
    case "$1" in
        --bash|--zsh|--fish)
            if [[ -n "$TARGET_SHELL" ]]; then
                printf 'Error: Specify only one shell.\n' >&2
                usage
                exit 1
            fi
            TARGET_SHELL="${1#--}"
            ;;
        --help|-h)
            usage
            exit 0
            ;;
        *)
            printf 'Unknown option: %s\n' "$1" >&2
            usage
            exit 1
            ;;
    esac
    shift
done

if [[ -z "$TARGET_SHELL" ]]; then
    TARGET_SHELL="$(basename -- "${SHELL:-}")"
fi

install_fish() {
    local source_dir="$SCRIPT_DIR/fish"
    local target_dir="$HOME/.config/fish/functions"

    if [[ ! -d "$source_dir" ]]; then
        printf 'Error: Fish directory not found.\n' >&2
        exit 1
    fi

    mkdir -p "$target_dir"

    cp -v "$source_dir"/*.fish "$target_dir/"

    printf '\nFish helpers installed successfully.\n'
    printf 'Location: %s\n' "$target_dir"
}

install_posix() {
    local rc_file="$1"
    local source_dir="$SCRIPT_DIR/bash-zsh"
    local target_dir="$HOME/.local/lib/arch-helpers"

    if [[ ! -d "$source_dir" ]]; then
        printf 'Error: Bash/Zsh directory not found.\n' >&2
        exit 1
    fi

    mkdir -p "$target_dir"

    cp -v "$source_dir"/*.sh "$target_dir/"

    touch "$rc_file"

    if ! grep -Fq '# >>> arch-helpers >>>' "$rc_file"; then
        cat >> "$rc_file" <<'EOF'

# >>> arch-helpers >>>
for f in "$HOME/.local/lib/arch-helpers/"*.sh; do
    [[ -f "$f" ]] && source "$f"
done
# <<< arch-helpers <<<
EOF
    fi

    printf '\nHelpers installed successfully.\n'
    printf 'Location: %s\n' "$target_dir"
    printf 'Shell configuration: %s\n' "$rc_file"
}

case "$TARGET_SHELL" in
    fish)
        install_fish
        ;;
    bash)
        install_posix "$HOME/.bashrc"
        ;;
    zsh)
        install_posix "$HOME/.zshrc"
        ;;
    *)
        printf 'Error: Unsupported or undetected shell: %s\n' "$TARGET_SHELL" >&2
        usage
        exit 1
        ;;
esac

printf '\nInstallation complete. Restart your terminal.\n'
