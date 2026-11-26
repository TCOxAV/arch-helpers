
# shellcheck shell=bash

filefind() {
    if [[ -z "${1:-}" ]]; then
        printf 'Usage: filefind <filename> [path]\n'
        return 1
    fi

    local search_name="$1"
    local search_path="${2:-$HOME}"

    if [[ ! -d "$search_path" ]]; then
        printf 'Error: Directory does not exist: %s\n' "$search_path"
        return 1
    fi

    find "$search_path" -iname "*${search_name}*" 2>/dev/null
}
