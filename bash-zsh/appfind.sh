# Find installed apps across Pacman/AUR and Flatpak
appfind() {
    if [ -z "$1" ]; then
        echo "Usage: appfind <app_name>"
        return 1
    fi

    echo "=== Pacman / AUR ==="
    pacman -Qq | grep -i "$1"

    if command -v flatpak >/dev/null 2>&1; then
        echo "=== Flatpak ==="
        flatpak list --app --columns=name,application | grep -i "$1"
    fi
}
