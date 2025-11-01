
---@brief
---
--- https://github.com/xijnim/grug-ls
---
--- An LSP Server for the Grug language 
---@type vim.lsp.Config

return {
    cmd = { 'grug-ls' },
    filetypes = { 'grug' },
    root_markers = { "mod_api.json" },
    single_file_support = false,
}
