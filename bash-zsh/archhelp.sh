# Universal Arch Linux GUI & CLI survival cheat sheet
archhelp() {
    local cyan='\033[0;36m'
    local yellow='\033[0;33m'
    local green='\033[0;32m'
    local magenta='\033[1;35m'
    local bold='\033[1m'
    local normal='\033[0m'

    local distro_name
    distro_name=$(grep '^PRETTY_NAME=' /etc/os-release 2>/dev/null | cut -d'"' -f2)
    [ -z "$distro_name" ] && distro_name="Arch Linux Variant"

    printf "${magenta}>>> ARCH GUI SURVIVAL GUIDE  |  System: %s <<<${normal}\n\n" "$distro_name"

    printf "${bold}${cyan}=== 1. CUSTOM SEARCH HELPERS ===${normal}\n"
    printf "${green}  appfind <name>                  ${normal}Find installed app (Pacman/AUR + Flatpak)\n"
    printf "${green}  filefind <name> [path]          ${normal}Search files by name (defaults to ~)\n"
    printf "${green}  archhelp                        ${normal}Show this cheat sheet anytime\n\n"

    printf "${bold}${cyan}=== 2. SYSTEM UPDATES (BY DISTRO & HELPER) ===${normal}\n"
    printf "${green}  garuda-update                   ${normal}Garuda Linux (auto-fixes keyrings & mirrors)\n"
    printf "${green}  eos-update                      ${normal}EndeavourOS (official wrapper + AUR)\n"
    printf "${green}  cachy-update                    ${normal}CachyOS (full system & kernel update)\n"
    printf "${green}  pamac update                    ${normal}Manjaro (official CLI updater + AUR)\n"
    printf "${green}  paru -Syu                       ${normal}Arch / Archcraft / CachyOS (via paru AUR helper)\n"
    printf "${green}  yay -Syu                        ${normal}Arch / Archcraft / EndeavourOS (via yay AUR helper)\n"
    printf "${green}  sudo pacman -Syu                ${normal}Pure Arch official repositories only\n"
    printf "${green}  flatpak update                  ${normal}Update all Flatpak desktop apps\n\n"

    printf "${bold}${cyan}=== 3. INSTALL, REMOVE & INSPECT PACKAGES ===${normal}\n"
    printf "${green}  sudo pacman -S <pkg>            ${normal}Install from official Arch repos\n"
    printf "${green}  paru -S <pkg>                   ${normal}Install from AUR (using paru)\n"
    printf "${green}  yay -S <pkg>                    ${normal}Install from AUR (using yay)\n"
    printf "${green}  sudo pacman -Rns <pkg>          ${normal}Clean uninstall (app + unused deps + configs)\n"
    printf "${green}  pacman -Qq | grep -i <name>     ${normal}Check exact installed package name\n"
    printf "${green}  pacman -Ql <pkg>                ${normal}List every file owned by an installed package\n\n"

    printf "${bold}${cyan}=== 4. SYSTEM CLEANUP & DISK HEALTH ===${normal}\n"
    printf "${green}  sudo pacman -Rns \$(pacman -Qtdq) ${normal}Remove all unused orphan dependencies\n"
    printf "${green}  sudo pacman -Sc                 ${normal}Clear old uninstalled package cache\n"
    printf "${green}  sudo journalctl --vacuum-time=7d${normal}Trim system logs older than 7 days\n"
    printf "${green}  df -h /                         ${normal}Check available root disk space\n\n"

    printf "${bold}${cyan}=== 5. SNAPSHOTS & GUI DESKTOP RESCUE ===${normal}\n"
    printf "${green}  sudo snapper list               ${normal}List Btrfs snapshots & IDs (Garuda / CachyOS)\n"
    printf "${green}  sudo snapper delete --sync <id> ${normal}Delete old snapshot & free space immediately\n"
    printf "${green}  sudo systemctl restart sddm     ${normal}Restart frozen login screen / KDE / Hyprland\n"
    printf "${green}  Ctrl + Alt + F3  (F1/F2 back)   ${normal}Switch to text TTY if GUI freezes\n"
    printf "${yellow}  * Snapper rule: NEVER delete 0 (current). Keep 1 (baseline) & latest post-update.${normal}\n"
}
