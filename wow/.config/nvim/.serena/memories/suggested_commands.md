# Suggested Commands

## Plugin Management
- `:Lazy` - Open lazy.nvim plugin manager interface
- `:Lazy update` - Update all plugins to latest versions
- `:Lazy sync` - Sync plugins (install missing, update existing)
- `:Lazy clean` - Remove unused plugins

## LSP & Development Tools
- `:Mason` - Open Mason LSP/tool installer
- `:LspInfo` - Show LSP client information for current buffer
- `:LspRestart` - Restart LSP clients
- `:ConformInfo` - Show conform formatter information

## Essential Keymaps
- `<Space>` - Leader key
- `-` - Open Oil file manager for navigation
- `jk` - Exit insert mode
- `<leader>f` - Format current buffer
- `<leader>s*` - Telescope search commands (files, grep, etc.)
- `gr*` - LSP actions prefix (grn=rename, gra=code action, grd=definition, grr=references)

## File Navigation & Search
- Oil.nvim file manager via `-` key
- Harpoon for quick file switching
- Telescope for fuzzy finding files and text

## Git Integration
- Gitsigns for git hunks and blame
- Neogit for git operations
- Git-blame plugin for line-by-line attribution

## System Commands (Darwin/macOS)
Standard Unix commands are available:
- `git` - Version control
- `ls` - List directory contents
- `cd` - Change directory
- `grep` - Search text patterns
- `find` - Find files and directories