# Task Completion Workflow

## After Making Configuration Changes

### Plugin-Related Changes
1. **Plugin Updates**: Run `:Lazy sync` to ensure all plugins are properly installed/updated
2. **LSP Changes**: Run `:LspRestart` if modifying LSP configurations
3. **Mason Tools**: Use `:Mason` to verify language servers and formatters are installed

### Configuration Validation
1. **Restart Neovim**: Reload configuration to test changes
2. **Check Plugin Status**: Use `:Lazy` to verify no plugin errors
3. **Test LSP**: Use `:LspInfo` to ensure language servers are working
4. **Test Formatting**: Use `<leader>f` to verify formatters work correctly

### File System Operations
- **Git Operations**: Use standard git commands for version control
- **File Management**: Leverage Oil.nvim (`-` key) for file operations
- **Search Verification**: Test Telescope functionality with `<leader>s*` commands

## No Specific Testing Framework
- This is a personal Neovim configuration, not a software project
- No automated testing, linting, or formatting commands required
- Validation is primarily functional testing within Neovim

## Recommended Verification Steps
1. Open Neovim and check for any startup errors
2. Test key plugin functionality (LSP, completion, formatting)
3. Verify keymaps work as expected
4. Check that lazy loading is functioning properly