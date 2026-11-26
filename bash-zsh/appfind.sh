
# shellcheck shell=bash

appfind() {
    if [[ -z "${1:-}" ]]; then
        printf 'Usage: appfind <app_name>\n'
        return 1
    fi

    local query="$1"
    local found=0

    printf '=== Installed Pacman Packages ===\n'

    if command -v pacman >/dev/null 2>&1; then
        if pacman -Qq | grep -iF -- "$query"; then
            found=1
        fi
    else
        printf 'Pacman is not installed.\n'
    fi

    if command -v flatpak >/dev/null 2>&1; then
        printf '\n=== Installed Flatpak Applications ===\n'

        if flatpak list --app --columns=name,application |
            grep -iF -- "$query"; then
            found=1
        fi
    fi

    if ((found == 0)); then
        printf 'No matching installed applications found.\n'
        return 1
    fi

    return 0
}
