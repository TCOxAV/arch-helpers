
# arch-helpers

A collection of modular CLI helpers and an Arch Linux survival guide for Arch Linux and its derivatives.

Supports **Bash, Zsh, and Fish**.

## Features

| Command | Description |
|---|---|
| `archhelp` | Displays a colour-coded Arch Linux command reference. |
| `appfind <name>` | Searches installed Pacman packages and Flatpak applications. |
| `filefind <name> [path]` | Searches files by name. Defaults to `$HOME`. |
| `greeting` | Displays the help guide when an interactive Bash/Zsh terminal starts. |

Fish automatically displays the guide through its `fish_greeting` function.

## Requirements

- Arch Linux or an Arch-based distribution.
- Bash, Zsh, or Fish.
- Pacman.
- Flatpak is optional.

## Installation

```bash
git clone https://github.com/TCOxAV/arch-helpers.git
cd arch-helpers
chmod +x install.sh
./install.sh
```

The installer detects your default shell automatically.

### Select a shell manually

```bash
./install.sh --bash
./install.sh --zsh
./install.sh --fish
```

Restart your terminal after installation.

## Usage

```bash
archhelp
appfind firefox
filefind config
filefind config ~/.config
```

## Uninstallation

For Bash:

Remove the arch-helpers block from `~/.bashrc`, then remove:

```bash
rm -r ~/.local/lib/arch-helpers
```

For Zsh:

Remove the arch-helpers block from `~/.zshrc`, then remove:

```bash
rm -r ~/.local/lib/arch-helpers
```

For Fish:

```bash
rm ~/.config/fish/functions/appfind.fish
rm ~/.config/fish/functions/archhelp.fish
rm ~/.config/fish/functions/filefind.fish
rm ~/.config/fish/functions/fish_greeting.fish
```

## License

MIT License — see [LICENSE](LICENSE) for details.
