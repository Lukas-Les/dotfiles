# dotfiles

This repository contains my personal dotfiles for various tools and shells, aiming to provide a consistent and efficient development environment.

## Installation

### Prerequisites
*   `oh-my-zsh` (for `aliases.zsh` and `zshrc`)
*   `tmux` (for `tmux.conf`)

### `aliases.zsh`

This file contains custom shell aliases and functions for common commands.

To use these aliases:
1.  Ensure `oh-my-zsh` is installed.
2.  Navigate to your `dotfiles` directory.
3.  Create a symbolic link from `aliases.zsh` to `$ZSH_CUSTOM/aliases.zsh`:
    ```bash
    ln -s "$(pwd)/aliases.zsh" "$ZSH_CUSTOM/aliases.zsh"

### `tmux.conf`

This file contains my personal tmux configuration, designed to enhance productivity with custom keybindings, status line, and plugin management.

To use this configuration:
1.  Ensure `tmux` is installed.
2.  Navigate to your `dotfiles` directory.
3.  Create a symbolic link from `tmux.conf` to `~/.tmux.conf`:
    ```bash
    ln -s "$(pwd)/tmux.conf" ~/.tmux.conf
    ```
```
