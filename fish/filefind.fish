function filefind --description "Search files by name (defaults to home directory)"
    if test (count $argv) -eq 0
        echo "Usage: filefind <filename> [optional_path]"
        return 1
    end

    set -l search_path $HOME
    if test (count $argv) -ge 2
        set search_path $argv
    end

    find $search_path -iname "*$argv*" 2>/dev/null
end
