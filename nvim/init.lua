vim.opt.number = true
vim.opt.relativenumber = true
vim.g.mapleader = " "
vim.opt.swapfile = false
vim.opt.winborder = "rounded"
vim.opt.wrap = false

vim.opt.colorcolumn = '100'
vim.opt.mouse = ""
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.keymap.set("n", "<C-z>", "<nop>")

vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")

vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<C-d>", "<C-d>zz")

vim.pack.add({
    { src = "https://github.com/nvim-lua/plenary.nvim" },
    { src = "https://github.com/nvim-telescope/telescope.nvim" },
    { src = "https://github.com/nvim-mini/mini.ai" },
    { src = "https://github.com/nvim-mini/mini.completion" },
    { src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "main" },
    { src = "https://github.com/ellisonleao/gruvbox.nvim" },
    { src = "https://github.com/neovim/nvim-lspconfig" },
    { src = "https://github.com/JafarDakhan/vim-gml" },
})

require("mini.ai").setup {}
require("mini.completion").setup {}
require("gruvbox").setup({
    terminal_colors = true, -- add neovim terminal colors
    transparent_mode = true,
    italic = {
        strings = false,
        emphasis = false,
        comments = false,
        operators = false,
        folds = false,
    },
})

require("telescope").setup {
    defaults = {
        file_ignore_patterns = {
            "node_modules"
        }
    }
}

vim.cmd("colorscheme gruvbox")

vim.filetype.add({
    extension = {
        grug = "grug",
        gml = "gml",
        fsh = "glsl",
        vsh = "glsl",
    }
})

vim.api.nvim_create_autocmd('User', {
    pattern = 'TSUpdate',
    callback = function()
        require("nvim-treesitter.parsers").grug = {
            install_info = {
                path = "~/Projects/tree-sitter-grug", -- local path or git repo
                files = {"src/parser.c"}, -- note that some parsers also require src/scanner.c or src/scanner.cc
                branch = "main", -- default branch in case of git repo if different from master
            },
            filetype = "grug", -- if filetype does not match the parser name
        }
    end
})
vim.api.nvim_create_autocmd("BufEnter", {
    command = "norm zR",
})
vim.treesitter.language.register('grug', { 'grug' })
-- require("nvim-treesitter").install("grug")

vim.keymap.set("n", "<leader>it", "<cmd>InspectTree<cr>")
vim.keymap.set("n", "<leader>li", "<cmd>checkhealth vim.lsp<cr>")
vim.keymap.set("n", "<F3>", vim.lsp.buf.format)
vim.keymap.set("n", "gd", vim.lsp.buf.definition)
vim.keymap.set("n", "gR", vim.lsp.buf.rename)

vim.keymap.set("n", "<C-c>", "<Esc><cmd>noh<cr>")

vim.lsp.enable("lua_ls")
vim.lsp.enable("rust_analyzer")
vim.lsp.enable("grug-ls")
vim.lsp.enable("gopls")
vim.lsp.enable("clangd")
vim.lsp.enable("nil_ls")

vim.keymap.set("n", "<leader>pv", "<cmd>Ex<cr>")
vim.keymap.set("n", "<leader>fs", "<cmd>Telescope find_files<cr>")
vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>")

vim.cmd([[autocmd FileType * set formatoptions-=ro]])

-- Only for when debugging tree-sitter-grug folding
-- vim.opt.foldmethod = "expr"
-- vim.opt.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
