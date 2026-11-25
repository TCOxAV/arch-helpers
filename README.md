# arch-helper

Modular CLI helpers and a startup survival guide for **Arch Linux and its variants** (Garuda Linux, EndeavourOS, CachyOS, Manjaro, Archcraft, and Pure Arch).

Every helper lives in its own standalone file and works seamlessly across **Fish**, **Bash**, and **Zsh**.

## Included Helpers

| Helper | Description |
| :--- | :--- |
| `archhelp` | Color-coded Arch survival cheat sheet covering distro updaters, Pacman/AUR, cleanup, Btrfs snapshots, and GUI rescue commands. |
| `appfind <name>` | Searches installed apps by partial name across **Pacman/AUR** and **Flatpak**. |
| `filefind <name> [path]` | Searches for files by name (case-insensitive). Defaults to `$HOME` or accepts an optional path. |
| `greeting` | Auto-runs `archhelp` whenever you open a new interactive terminal (`fish_greeting.fish` / `greeting.sh`). |

## Repository Structure

```text
arch-helper/
├── install.sh              # Auto-detects shell (or accepts --fish / --bash / --zsh)
├── readme.md
├── fish/                   # Fish shell functions (Garuda, CachyOS, etc.)
│   ├── appfind.fish
│   ├── archhelp.fish
│   ├── filefind.fish
│   └── fish_greeting.fish
└── bash-zsh/               # Bash & Zsh modular scripts (Pure Arch, EndeavourOS, Manjaro, Archcraft)
    ├── appfind.sh
    ├── archhelp.sh
    ├── filefind.sh
    └── greeting.sh
```

## Quick Installation

```bash
git clone https://github.com/TCOxAV/arch-helpers.git
cd arch-helper
./install.sh
```

### Target a Specific Shell Manually
```bash
./install.sh --fish
./install.sh --bash
./install.sh --zsh
```
