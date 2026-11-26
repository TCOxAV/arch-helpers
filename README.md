
# arch-helpers

A collection of useful CLI helpers and an Arch Linux survival guide for Arch Linux and its derivatives.

Supports **Bash, Zsh, and Fish**.

## Features

| Command | Description |
|---|---|
| `archhelp` | Displays a colour-coded Arch Linux command reference. |
| `appfind <name>` | Searches installed Pacman packages and Flatpak applications. |
| `filefind <name> [path]` | Searches files by name. Defaults to `$HOME`. |

Fish automatically displays the guide using its `fish_greeting` function. Bash and Zsh display it when an interactive terminal starts.

## Requirements

- Arch Linux or an Arch-based distribution.
- Git 2.25 or newer.
- Bash, Zsh, or Fish.
- Pacman.
- Flatpak is optional.

---

## Installation

There are two ways to install arch-helpers.

### Option 1: Standard installation

Clone the complete repository:

```bash
git clone https://github.com/TCOxAV/arch-helpers.git
cd arch-helpers
chmod +x install.sh
./install.sh
```

The installer automatically detects your default shell.

### Option 2: Shell-specific installation

Don't need every shell implementation? Use Git Sparse Checkout to download only the files required for your shell.

Combined with Git's partial clone, this avoids downloading unnecessary file contents.

**Bash**

```bash
git clone --filter=blob:none --sparse https://github.com/TCOxAV/arch-helpers.git
cd arch-helpers

git sparse-checkout set install.sh README.md bash-zsh

chmod +x install.sh
./install.sh --bash
```

**Zsh**

```bash
git clone --filter=blob:none --sparse https://github.com/TCOxAV/arch-helpers.git
cd arch-helpers

git sparse-checkout set install.sh README.md bash-zsh

chmod +x install.sh
./install.sh --zsh
```

**Fish**

```bash
git clone --filter=blob:none --sparse https://github.com/TCOxAV/arch-helpers.git
cd arch-helpers

git sparse-checkout set install.sh README.md fish

chmod +x install.sh
./install.sh --fish
```

### Manual shell selection

If you cloned the complete repository, you can select your shell manually:

```bash
./install.sh --bash
./install.sh --zsh
./install.sh --fish
```

Restart your terminal after installation.

---

## Usage

### archhelp

Displays the Arch Linux command reference.

```bash
archhelp
```

### appfind

Searches installed Pacman packages and Flatpak applications.

```bash
appfind firefox
appfind steam
appfind vscode
```

### filefind

Searches files by name.

```bash
filefind config
filefind notes ~/Documents
```

If no search directory is provided, it searches your home directory.

---

## Updating

Navigate to your cloned repository and pull the latest changes:

```bash
cd arch-helpers
git pull
```

For sparse checkouts, Git continues to update only the selected files.

Run the installer again if you need to refresh the installed helper files.

---

## Uninstallation

### Bash

Remove the arch-helpers block from `~/.bashrc`, then remove the installed helpers:

```bash
rm -rf ~/.local/lib/arch-helpers
```

### Zsh

Remove the arch-helpers block from `~/.zshrc`, then remove the installed helpers:

```bash
rm -rf ~/.local/lib/arch-helpers
```

### Fish

Remove the installed Fish functions:

```bash
rm ~/.config/fish/functions/appfind.fish
rm ~/.config/fish/functions/archhelp.fish
rm ~/.config/fish/functions/filefind.fish
rm ~/.config/fish/functions/fish_greeting.fish
```

---

## Repository Structure

```text
arch-helpers/
├── README.md
├── LICENSE
├── install.sh
├── bash-zsh/
│   ├── appfind.sh
│   ├── archhelp.sh
│   ├── filefind.sh
│   └── greeting.sh
└── fish/
    ├── appfind.fish
    ├── archhelp.fish
    ├── filefind.fish
    └── fish_greeting.fish
```

---

## Contributing

Contributions, bug reports, and suggestions are welcome!

If you find a bug or have an idea for a new helper, feel free to visit my [Google Form](https://forms.gle/mJ5Gf8xbK4qNMM1NA).

When contributing, please maintain compatibility with the supported shells.

---

## License

MIT License — see [LICENSE](LICENSE) for details.
