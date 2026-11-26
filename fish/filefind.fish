
function filefind --description "Search files by name"
    if test (count $argv) -lt 1
        echo "Usage: filefind <filename> [path]"
        return 1
    end

    set -l search_name "$argv[1]"
    set -l search_path "$HOME"

    if test (count $argv) -ge 2
        set search_path "$argv[2]"
    end

    if not test -d "$search_path"
        echo "Error: Directory does not exist: $search_path"
        return 1
    end

    find "$search_path" -iname "*$search_name*" 2>/dev/null
end
