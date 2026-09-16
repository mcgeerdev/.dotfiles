# Code Style & Conventions

## Configuration Language
- **Primary Language**: Lua
- **Configuration Style**: Functional, using table-based configuration

## Plugin Configuration Pattern
Each plugin file in `lua/plugins/` follows this standard pattern:
```lua
return {
  "plugin/name",
  event = "event_name", -- or cmd, ft, keys, etc.
  opts = { ... }, -- plugin options
  config = function() ... end -- for complex setup
}
```

## File Organization
- **Modular Architecture**: Each plugin has its own dedicated file
- **Lazy Loading**: Plugins use lazy loading based on events, commands, or file types
- **Plugin Specifications**: All configurations return lazy.nvim plugin specifications

## Naming Conventions
- Plugin files named after the main plugin (e.g., `telescope.lua`, `lsp.lua`)
- Kebab-case for multi-word plugin files (e.g., `git-blame.lua`, `blink-cmp.lua`)
- Clear, descriptive filenames that match plugin functionality

## Configuration Principles
- **Minimal Core**: Keep `init.lua` focused on basic Neovim settings and essential keymaps
- **Plugin Isolation**: Each plugin configuration is self-contained
- **Lazy Loading**: Optimize startup time through event-based plugin loading
- **Sensible Defaults**: Prefer configuration that works out of the box

## Code Structure
- Leader key set to `<Space>`
- Tab width set to 2 spaces
- Light mode configuration (background = "light")
- Rose Pine colorscheme in dawn variant