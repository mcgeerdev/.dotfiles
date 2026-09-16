# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview
This is a personal Neovim configuration built on top of the lazy.nvim plugin manager. The configuration follows a modular plugin-based architecture with individual plugin configurations in separate files.

## Architecture & Structure

### Core Configuration
- `init.lua`: Main entry point containing basic Neovim settings, keymaps, autocommands, and Telescope configuration
- `lazy-lock.json`: Plugin version lockfile managed by lazy.nvim
- Uses lazy.nvim for plugin management with automatic plugin loading

### Plugin Organization
- `lua/plugins/`: Individual plugin configurations, each in their own file
- Plugins use lazy loading based on events, commands, or file types
- Plugin configurations return lazy.nvim plugin specifications

### Key Components
- **LSP**: Comprehensive LSP setup with Mason for automatic installation (`lua/plugins/lsp.lua`)
- **Completion**: Uses blink.cmp with LuaSnip for snippets
- **Formatting**: Conform.nvim for code formatting (`lua/plugins/conform.lua`)
- **Fuzzy Finding**: Telescope with fzf-native for file/text search
- **Git Integration**: Gitsigns, git-blame, and neogit
- **File Navigation**: Oil.nvim for file browsing, Harpoon for quick file switching
- **UI Enhancements**: Noice.nvim, smear cursor, pulse effects

## Common Development Commands

### Plugin Management
- `:Lazy`: Open lazy.nvim plugin manager
- `:Lazy update`: Update all plugins
- `:Lazy sync`: Sync plugins (install missing, update existing)
- `:Mason`: Open Mason LSP/tool installer

### LSP & Development Tools
- `:LspInfo`: Show LSP client information
- `:LspRestart`: Restart LSP clients
- `:ConformInfo`: Show conform formatter information

### Essential Keymaps
- Leader key: `<Space>`
- File navigation: `-` opens Oil file manager
- LSP actions: `gr*` prefix (grn=rename, gra=code action, etc.)
- Search: `<leader>s*` prefix for telescope searches
- Format: `<leader>f` to format current buffer
- Exit modes: `jk` to exit insert mode

## Configuration Patterns

### Plugin Structure
Each plugin file in `lua/plugins/` follows this pattern:
```lua
return {
  "plugin/name",
  event = "event_name", -- or cmd, ft, keys, etc.
  opts = { ... }, -- plugin options
  config = function() ... end -- for complex setup
}
```

### LSP Configuration
- Language servers defined in `servers` table in `lua/plugins/lsp.lua`
- Mason auto-installs tools listed in `ensure_installed`
- Custom LSP keymaps created on LspAttach autocmd

### Formatting Setup
- Formatters configured in `formatters_by_ft` table in conform.nvim
- Format-on-save enabled with LSP fallback
- Manual formatting via `<leader>f`

## Development Notes
- Uses Rose Pine colorscheme in dawn (light) variant
- Treesitter for syntax highlighting with Go, Lua, and other languages
- Background setting configured for light mode
- Font size managed through WezTerm terminal configuration