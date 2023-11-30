return {
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = {
            "williamboman/mason.nvim",
            "neovim/nvim-lspconfig",
            "hrsh7th/cmp-nvim-lsp",
            "ziglang/zig.vim",
            { "folke/neodev.nvim", opts = {} },
        },
        config = function()
            require("mason").setup()
            require("mason-lspconfig").setup()

            local capabilities = require('cmp_nvim_lsp').default_capabilities()
            require('lspconfig')['lua_ls'].setup { capabilities = capabilities }
            require('lspconfig')['vimls'].setup { capabilities = capabilities }
            require('lspconfig')['rust_analyzer'].setup { capabilities = capabilities }
            require('lspconfig')['zls'].setup { capabilities = capabilities }
            require('lspconfig')['svelte'].setup { capabilities = capabilities }
            require('lspconfig')['tsserver'].setup { capabilities = capabilities }
            require('lspconfig')['hls'].setup { capabilities = capabilities }
            require('telescope').load_extension('projects')

            vim.api.nvim_create_autocmd('LspAttach', {
              group = vim.api.nvim_create_augroup('UserLspConfig', {}),
              callback = function(ev)
                vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

                local opts = { buffer = ev.buf }
                vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
                vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
                vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
                vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
                vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
                vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition, opts)
                vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
                vim.keymap.set({ 'n', 'v' }, '<leader>ra', vim.lsp.buf.code_action, opts)
                vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
                vim.keymap.set('n', '<leader>rf', function()
                  vim.lsp.buf.format { async = true }
                end, opts)
              end,
            })
        end
    },
}
