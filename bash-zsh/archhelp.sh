
# shellcheck shell=bash

archhelp() {
    local cyan=$'\033[0;36m'
    local yellow=$'\033[0;33m'
    local green=$'\033[0;32m'
    local magenta=$'\033[1;35m'
    local bold=$'\033[1m'
    local normal=$'\033[0m'

    local distro_name="Arch Linux Variant"

    if [[ -r /etc/os-release ]]; then
        # shellcheck disable=SC1091
        . /etc/os-release
        distro_name="${PRETTY_NAME:-Arch Linux Variant}"
    fi

    printf '%s\n\n' "${magenta}>>> ARCH SURVIVAL GUIDE | System: ${distro_name} <<<${normal}"

    printf '%s\n' "${bold}${cyan}=== 1. CUSTOM HELPERS ===${normal}"
    printf '%s\n' "${green}  appfind <name>                  ${normal}Search installed apps"
    printf '%s\n' "${green}  filefind <name> [path]          ${normal}Search files by name"
    printf '%s\n\n' "${green}  archhelp                        ${normal}Display this guide"

    printf '%s\n' "${bold}${cyan}=== 2. SYSTEM UPDATES ===${normal}"
    printf '%s\n' "${green}  garuda-update                   ${normal}Garuda Linux update helper"
    printf '%s\n' "${green}  eos-update                      ${normal}EndeavourOS update helper"
    printf '%s\n' "${green}  cachy-update                    ${normal}CachyOS update helper"
    printf '%s\n' "${green}  pamac update                    ${normal}Manjaro package update"
    printf '%s\n' "${green}  paru -Syu                       ${normal}Update system using paru"
    printf '%s\n' "${green}  yay -Syu                        ${normal}Update system using yay"
    printf '%s\n' "${green}  sudo pacman -Syu                ${normal}Update official repositories"
    printf '%s\n\n' "${green}  flatpak update                  ${normal}Update Flatpak applications"

    printf '%s\n' "${bold}${cyan}=== 3. PACKAGE MANAGEMENT ===${normal}"
    printf '%s\n' "${green}  sudo pacman -S <pkg>            ${normal}Install a package"
    printf '%s\n' "${green}  paru -S <pkg>                   ${normal}Install using paru"
    printf '%s\n' "${green}  yay -S <pkg>                    ${normal}Install using yay"
    printf '%s\n' "${green}  sudo pacman -Rns <pkg>          ${normal}Remove package and unused dependencies"
    printf '%s\n' "${green}  pacman -Qq                      ${normal}List installed package names"
    printf '%s\n\n' "${green}  pacman -Ql <pkg>                ${normal}List files owned by a package"

    printf '%s\n' "${bold}${cyan}=== 4. SYSTEM CLEANUP & DISK HEALTH ===${normal}"
    printf '%s\n' "${green}  pacman -Qtdq                    ${normal}List orphan packages"
    printf '%s\n' "${green}  pacman -Qtdq | xargs -r sudo pacman -Rns --${normal} Remove all orphan packages"
    printf '%s\n' "${green}  sudo pacman -Sc                 ${normal}Clean package cache"
    printf '%s\n' "${green}  sudo journalctl --vacuum-time=7d ${normal}Remove old journal entries"
    printf '%s\n' "${green}  df -h /                         ${normal}Check root disk space"
    printf '%s\n\n' "${yellow}  Review orphan packages before removing them.${normal}"

    printf '%s\n' "${bold}${cyan}=== 5. SNAPSHOTS & DESKTOP RESCUE ===${normal}"
    printf '%s\n' "${green}  sudo snapper list               ${normal}List Snapper snapshots"
    printf '%s\n' "${green}  sudo snapper delete <id>        ${normal}Delete a selected snapshot"
    printf '%s\n' "${green}  sudo systemctl restart sddm     ${normal}Restart the SDDM display manager"
    printf '%s\n' "${green}  Ctrl + Alt + F3                 ${normal}Switch to a text terminal"
    printf '%s\n' "${yellow}  Warning: Restarting SDDM can terminate your graphical session.${normal}"
    printf '%s\n' "${yellow}  Keep important snapshots before system changes.${normal}"
}
