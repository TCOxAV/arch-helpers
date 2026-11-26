
function appfind --description "Search installed applications"
    if test (count $argv) -lt 1
        echo "Usage: appfind <app_name>"
        return 1
    end

    set -l query "$argv[1]"
    set -l found 0

    echo "=== Installed Pacman Packages ==="

    if type -q pacman
        if pacman -Qq | grep -iF -- "$query"
            set found 1
        end
    else
        echo "Pacman is not installed."
    end

    if type -q flatpak
        echo
        echo "=== Installed Flatpak Applications ==="

        if flatpak list --app --columns=name,application | grep -iF -- "$query"
            set found 1
        end
    end

    if test $found -eq 0
        echo "No matching installed applications found."
        return 1
    end

    return 0
end
