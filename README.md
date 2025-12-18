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

### Prerequisites
*   tmux plugin manager
```bash
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

To use this configuration:
1.  Ensure `tmux` is installed.
2.  Ensure tmux plugin manager installed
2.  Navigate to your `dotfiles` directory.
3.  Create a symbolic link from `tmux.conf` to `~/.tmux.conf`:
```bash
ln -s "$(pwd)/tmux.conf" ~/.tmux.conf
```
4. Start tmux, press ctrl+b and then I to install plugins
5. Restart tmux

### `env-launcher`

The `env-launcher.sh` script automates the process of creating or attaching to a `tmux` session for a specific project. It can also activate a Python virtual environment using `poetry` or `uv` upon session creation.

**Usage:**

```bash
env-launcher.sh <project_name> [tool]
```

*   `<project_name>`: The name of the project, which should correspond to a directory under your `GITHUB_DIR` (e.g., if `GITHUB_DIR` is `~/github` and `project_name` is `my-app`, the script looks for `~/github/my-app`). This will also be the name of the `tmux` session.
*   `[tool]`: (Optional) Specifies the tool to activate the virtual environment.
    *   `poetry`: Activates the virtual environment managed by Poetry.
    *   `uv`: Activates a `.venv` directory (e.g., created by `uv`).

**Installation:**

For better organization, it's recommended to place executable scripts in a directory included in your `PATH`, such as `~/.local/bin`.

1.  Navigate to your `dotfiles` directory.
2.  Create a symbolic link from `env-launcher/env-launcher.sh` to `~/.local/bin/env-launcher.sh`:
    ```bash
    ln -s "$(pwd)/env-launcher/env-launcher.sh" ~/.local/bin/env-launcher
    ```
3.  Make the script executable:
    ```bash
    chmod +x ~/.local/bin/env-launcher
    ```
4. Make sure env var $GITHUB_DIR points to a dir where all your projects sits.

**Examples:**

*   Launch a project named `my-project` without activating a virtual environment:
    ```bash
    env-launcher my-project
    ```
*   Launch `my-project` and activate its Poetry virtual environment:
    ```bash
    env-launcher.sh my-project poetry
    ```
*   Launch `my-project` and activate its `uv` virtual environment:
    ```bash
    env-launcher.sh my-project uv
    ```

**Aliases (Optional):**

You can create shell aliases for convenience in your `aliases.zsh` or similar configuration:

```bash
alias el="env-launcher.sh"
alias elp="env-launcher.sh poetry"
alias elu="env-launcher.sh uv"

# Example specific project alias
alias elmyprojectp="env-launcher.sh my-project poetry"
```

