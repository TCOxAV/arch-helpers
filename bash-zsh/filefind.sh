# Search files by name (defaults to home directory)
filefind() {
    if [ -z "$1" ]; then
        echo "Usage: filefind <filename> [optional_path]"
        return 1
    fi

    local search_path="${2:-$HOME}"
    find "$search_path" -iname "*$1*" 2>/dev/null
}
