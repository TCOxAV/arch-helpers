function appfind --description "Find installed apps across Pacman/AUR and Flatpak"
    if test (count $argv) -eq 0
        echo "Usage: appfind <app_name>"
        return 1
    end

    echo "=== Pacman / AUR ==="
    pacman -Qq | grep -i $argv

    if type -q flatpak
        echo "=== Flatpak ==="
        flatpak list --app --columns=name,application | grep -i $argv
    end
end
