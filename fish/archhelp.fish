
function archhelp --description "Universal Arch Linux GUI & CLI survival cheat sheet"
    set -l cyan (set_color cyan)
    set -l yellow (set_color yellow)
    set -l green (set_color green)
    set -l magenta (set_color magenta)
    set -l bold (set_color --bold)
    set -l normal (set_color normal)

    set -l distro_name (grep '^PRETTY_NAME=' /etc/os-release 2>/dev/null | cut -d'"' -f2)
    if test -z "$distro_name"
        set distro_name "Arch Linux Variant"
    end

    echo "$bold$magenta>>> ARCH GUI SURVIVAL GUIDE  |  System: $distro_name <<<$normal"
    echo ""

    echo "$bold$cyan=== 1. CUSTOM SEARCH HELPERS ===$normal"
    echo "$green  appfind <name>                  $normal Find installed app (Pacman/AUR + Flatpak)"
    echo "$green  filefind <name> [path]          $normal Search files by name (defaults to ~)"
    echo "$green  archhelp                        $normal Show this cheat sheet anytime"
    echo ""

    echo "$bold$cyan=== 2. SYSTEM UPDATES (BY DISTRO & HELPER) ===$normal"
    echo "$green  garuda-update                   $normal Garuda Linux (auto-fixes keyrings & mirrors)"
    echo "$green  eos-update                      $normal EndeavourOS (official wrapper + AUR)"
    echo "$green  cachy-update                    $normal CachyOS (full system & kernel update)"
    echo "$green  pamac update                    $normal Manjaro (official CLI updater + AUR)"
    echo "$green  paru -Syu                       $normal Arch / Archcraft / CachyOS (via paru AUR helper)"
    echo "$green  yay -Syu                        $normal Arch / Archcraft / EndeavourOS (via yay AUR helper)"
    echo "$green  sudo pacman -Syu                $normal Pure Arch official repositories only"
    echo "$green  flatpak update                  $normal Update all Flatpak desktop apps"
    echo ""

    echo "$bold$cyan=== 3. INSTALL, REMOVE & INSPECT PACKAGES ===$normal"
    echo "$green  sudo pacman -S <pkg>            $normal Install from official Arch repos"
    echo "$green  paru -S <pkg>                   $normal Install from AUR (using paru)"
    echo "$green  yay -S <pkg>                    $normal Install from AUR (using yay)"
    echo "$green  sudo pacman -Rns <pkg>          $normal Clean uninstall (app + unused deps + configs)"
    echo "$green  pacman -Qq | grep -i <name>     $normal Check exact installed package name"
    echo "$green  pacman -Ql <pkg>                $normal List every file owned by an installed package"
    echo ""

    echo "$bold$cyan=== 4. SYSTEM CLEANUP & DISK HEALTH ===$normal"
    echo "$green  pacman -Qtdq                    $normal List orphan packages"
    echo "$green  set -l orphans (pacman -Qtdq)  $normal Capture orphan package list"
    echo "$green  if set -q orphans[1]; sudo pacman -Rns -- \$orphans; end$normal Remove all orphans (interactive)"
    echo "$green  sudo pacman -Sc                 $normal Clear old uninstalled package cache"
    echo "$green  sudo journalctl --vacuum-time=7d$normal Trim system logs older than 7 days"
    echo "$green  df -h /                         $normal Check available root disk space"
    echo ""

    echo "$bold$cyan=== 5. SNAPSHOTS & GUI DESKTOP RESCUE ===$normal"
    echo "$green  sudo snapper list               $normal List Btrfs snapshots & IDs (Garuda / CachyOS)"
    echo "$green  sudo snapper delete --sync <id> $normal Delete old snapshot & free space immediately"
    echo "$green  sudo systemctl restart sddm     $normal Restart frozen login screen / KDE / Hyprland"
    echo "$green  Ctrl + Alt + F3  (F1/F2 back)   $normal Switch to text TTY if GUI freezes"
    echo "$yellow  * Snapper rule: NEVER delete 0 (current). Keep 1 (baseline) & latest post-update.$normal"
end
