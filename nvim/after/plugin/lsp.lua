local lspconfig = require('lspconfig')
local lsp = require('lsp-zero').preset({})

vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)

vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    callback = function(ev)
        vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

        local opts = { buffer = ev.buf }

        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
        vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
        vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, opts)
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
        vim.keymap.set({ 'n', 'i' }, '<A-f>', function()
            vim.lsp.buf.format { async = true }
        end, opts)
    end,
})

lsp.ensure_installed({
    'bashls',
    'clangd',
    'cmake',
    'cssls',
    'golangci_lint_ls',
    'html',
    'jsonls',
    'tsserver',
    'lua_ls',
    'remark_ls',
    'pyright',
    'rust_analyzer',
    'taplo',
    'yamlls'
})

lspconfig.lua_ls.setup({})
lspconfig.bashls.setup({})
lspconfig.cmake.setup({})
lspconfig.cssls.setup({})
lspconfig.golangci_lint_ls.setup({})
lspconfig.html.setup({})
lspconfig.jsonls.setup({})
lspconfig.tsserver.setup({})
lspconfig.lua_ls.setup({})
lspconfig.remark_ls.setup({})
lspconfig.pyright.setup({})
lspconfig.rust_analyzer.setup({})
lspconfig.taplo.setup({})
lspconfig.yamlls.setup({})

require("clangd_extensions").setup({})

lsp.setup()
