
function archhelp --description "Arch Linux CLI survival guide"
    set -l cyan (set_color cyan)
    set -l yellow (set_color yellow)
    set -l green (set_color green)
    set -l magenta (set_color magenta)
    set -l bold (set_color --bold)
    set -l normal (set_color normal)

    set -l distro_name "Arch Linux Variant"

    if test -r /etc/os-release
        set distro_name (grep '^PRETTY_NAME=' /etc/os-release | cut -d '"' -f 2)

        if test -z "$distro_name"
            set distro_name "Arch Linux Variant"
        end
    end

    echo "$magenta>>> ARCH SURVIVAL GUIDE | System: $distro_name <<<$normal"
    echo

    echo "$bold$cyan=== 1. CUSTOM HELPERS ===$normal"
    echo "$green  appfind <name>                  $normal Search installed apps"
    echo "$green  filefind <name> [path]          $normal Search files by name"
    echo "$green  archhelp                        $normal Display this guide"
    echo

    echo "$bold$cyan=== 2. SYSTEM UPDATES ===$normal"
    echo "$green  garuda-update                   $normal Garuda Linux update helper"
    echo "$green  eos-update                      $normal EndeavourOS update helper"
    echo "$green  cachy-update                    $normal CachyOS update helper"
    echo "$green  pamac update                    $normal Manjaro package update"
    echo "$green  paru -Syu                       $normal Update system using paru"
    echo "$green  yay -Syu                        $normal Update system using yay"
    echo "$green  sudo pacman -Syu                $normal Update official repositories"
    echo "$green  flatpak update                  $normal Update Flatpak applications"
    echo

    echo "$bold$cyan=== 3. PACKAGE MANAGEMENT ===$normal"
    echo "$green  sudo pacman -S <pkg>            $normal Install a package"
    echo "$green  paru -S <pkg>                   $normal Install using paru"
    echo "$green  yay -S <pkg>                    $normal Install using yay"
    echo "$green  sudo pacman -Rns <pkg>          $normal Remove package and unused dependencies"
    echo "$green  pacman -Qq                      $normal List installed package names"
    echo "$green  pacman -Ql <pkg>                $normal List files owned by a package"
    echo

    echo "$bold$cyan=== 4. SYSTEM CLEANUP & DISK HEALTH ===$normal"
    echo "$green  pacman -Qtdq                    $normal List orphan packages"
    echo "$green  pacman -Qtdq | xargs -r sudo pacman -Rns -- $normal Remove all orphan packages"
    echo "$green  sudo pacman -Sc                 $normal Clean package cache"
    echo "$green  sudo journalctl --vacuum-time=7d $normal Remove old journal entries"
    echo "$green  df -h /                         $normal Check root disk space"
    echo "$yellow  Review orphan packages before removing them.$normal"
    echo

    echo "$bold$cyan=== 5. SNAPSHOTS & DESKTOP RESCUE ===$normal"
    echo "$green  sudo snapper list               $normal List Snapper snapshots"
    echo "$green  sudo snapper delete <id>        $normal Delete a selected snapshot"
    echo "$green  sudo systemctl restart sddm     $normal Restart the SDDM display manager"
    echo "$green  Ctrl + Alt + F3                 $normal Switch to a text terminal"
    echo "$yellow  Warning: Restarting SDDM can terminate your graphical session.$normal"
    echo "$yellow  Keep important snapshots before system changes.$normal"
end
