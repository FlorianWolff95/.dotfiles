# Personal Dotfiles

## Using Stow to Manage Dotfiles

To use the dotfiles in this repository, you can utilize `stow`. Follow these steps:

1. Install `stow` if not already installed:
   ```bash
   sudo apt install stow # For Debian-based systems
   sudo pacman -S stow   # For Arch-based systems
   ```

2. Navigate to the directory containing the dotfiles:
   ```bash
   cd ~/.dotfiles
   ```

3. Use `stow` to create symbolic links for the desired configuration:
   ```bash
   stow hyprland
   stow kanshi
   stow kitty
   stow nvim
   stow starship
   stow yazi
   ```

This will create symbolic links in your home directory for the respective configurations.

## Required Programs

To fully utilize the dotfiles, ensure the following programs are installed:

- **Hyprland Setup**:
  - kitty
  - wofi
  - waybar
  - font-awesome
  - hyprshot
  - swaynotificationcenter
  - libnotify
  - hyprlock
  - hypridle
  - hyprpaper
  - xdg-desktop-portal-hyprland
  - kanshi

- **Neovim Setup**:
  - luajitPackages.luarocks
  - ripgrep
  - lazygit
  - stylua
  - mypy
  - isort
  - nodejs
  - statix
  - nixfmt-classic
  - go
  - golangci-lint
  - gotools
  - golines
  - rustup
  - tree-sitter