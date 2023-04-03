local lspconfig = require('lspconfig')
local lsp = require('lsp-zero').preset({})

lsp.ensure_installed({
    'bashls',
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

lspconfig.html.setup({})
lspconfig.cmake.setup({})
lspconfig.taplo.setup({})
lspconfig.cssls.setup({})
lspconfig.lua_ls.setup({})
lspconfig.bashls.setup({})
lspconfig.jsonls.setup({})
lspconfig.lua_ls.setup({})
lspconfig.yamlls.setup({})
lspconfig.pyright.setup({})
lspconfig.tsserver.setup({})
lspconfig.remark_ls.setup({})
lspconfig.rust_analyzer.setup({})
lspconfig.golangci_lint_ls.setup({})

require("clangd_extensions").setup({
    server = {
        cmd = { 'clangd', '--query-driver=/usr/bin/gcc,/usr/bin/g++' }
    }
})

local cmp = require('cmp')

local cmp_select = {
    behavior = cmp.SelectBehavior.Select
}

local cmp_mappings = lsp.defaults.cmp_mappings({
    ['<Up>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<Down>'] = cmp.mapping.select_next_item(cmp_select),
    ['<C-y>'] = cmp.mapping.confirm({ select = true }),
    ["<C-Space>"] = cmp.mapping.complete(),
})

lsp.setup_nvim_cmp({
    mapping = cmp_mappings
})

lsp.set_preferences({
    suggest_lsp_servers = false,
    sign_icons = {
        error = 'E',
        warn = 'W',
        hint = 'H',
        info = 'I'
    }
})

lsp.on_attach(function(client, bufnr)
    local opts = { buffer = bufnr, remap = false }

    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', '<space>vd', vim.diagnostic.open_float, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set({ 'n', 'i' }, '<C-h>', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set({ 'n', 'i' }, '<A-f>', function()
        vim.lsp.buf.format { async = true }
    end, opts)
end)

lsp.setup()

vim.diagnostic.config({
    virtual_text = true
})
