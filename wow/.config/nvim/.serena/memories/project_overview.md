# Project Overview

## Purpose
This is a personal Neovim configuration built on top of the lazy.nvim plugin manager. The configuration follows a modular plugin-based architecture with individual plugin configurations in separate files.

## Tech Stack
- **Editor**: Neovim
- **Plugin Manager**: lazy.nvim
- **Configuration Language**: Lua
- **System**: Darwin (macOS)

## Directory Structure
```
.
├── init.lua                 # Main entry point with basic Neovim settings, keymaps, autocommands
├── lazy-lock.json          # Plugin version lockfile managed by lazy.nvim
├── CLAUDE.md               # Project documentation for Claude Code
└── lua/
    └── plugins/            # Individual plugin configurations (one per file)
        ├── lsp.lua         # LSP setup with Mason
        ├── telescope.lua   # Fuzzy finding
        ├── blink-cmp.lua   # Completion engine
        ├── conform.lua     # Code formatting
        ├── gitsigns.lua    # Git integration
        ├── harpoon.lua     # Quick file switching
        ├── oil.lua         # File navigation
        ├── treesitter.lua  # Syntax highlighting
        └── [others...]     # Additional plugin configs
```

## Key Components
- **LSP**: Comprehensive LSP setup with Mason for automatic installation
- **Completion**: Uses blink.cmp with LuaSnip for snippets
- **Formatting**: Conform.nvim for code formatting
- **Fuzzy Finding**: Telescope with fzf-native for file/text search
- **Git Integration**: Gitsigns, git-blame, and neogit
- **File Navigation**: Oil.nvim for file browsing, Harpoon for quick file switching
- **UI Enhancements**: Noice.nvim, smear cursor, pulse effects
- **Colorscheme**: Rose Pine in dawn (light) variant