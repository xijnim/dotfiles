local util = require('lspconfig.util')
return {
    cmd = { '/home/xijnim/Projects/gmls/lsp/target/debug/lsp' },
    filetypes = { 'gml' },
    root_markers = {".git"},
    single_file_support = false,
}
