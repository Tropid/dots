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
            -- handled by rustacean
            -- require('lspconfig')['rust_analyzer'].setup { capabilities = capabilities }
            require('lspconfig')['zls'].setup { capabilities = capabilities }
            require('lspconfig')['svelte'].setup { capabilities = capabilities }
            require('lspconfig')['tsserver'].setup { capabilities = capabilities }
            require('lspconfig')['cssls'].setup { capabilities = capabilities }
            require('lspconfig')['wgsl_analyzer'].setup { capabilities = capabilities }
            require('lspconfig')['hls'].setup { capabilities = capabilities }
            require('lspconfig')['clangd'].setup { capabilities = capabilities }
            require('telescope').load_extension('projects')

            vim.api.nvim_create_autocmd('LspAttach', {
                group = vim.api.nvim_create_augroup('UserLspConfig', {}),
                callback = function(ev)
                    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

                    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { buffer = ev.buf, desc = 'Goto Declaration' })
                    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { buffer = ev.buf, desc = 'Goto Definition' })
                    vim.keymap.set('n', 'K', vim.lsp.buf.hover, { buffer = ev.buf, desc = 'Hover' })
                    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation,
                        { buffer = ev.buf, desc = 'Goto Implementation' })
                    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, { buffer = ev.buf, desc = 'Show Signature' })
                    vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition, { buffer = ev.buf, desc = 'Goto Type' })
                    vim.keymap.set('n', '<leader>lr', vim.lsp.buf.rename, { buffer = ev.buf, desc = 'Rename' })

                    if vim.o.ft == 'rust' then
                        vim.keymap.set({ 'n', 'v' }, '<leader>la', ":RustLsp codeAction<cr>",
                            { buffer = ev.buf, desc = 'Action' })
                    else
                        vim.keymap.set({ 'n', 'v' }, '<leader>la', vim.lsp.buf.code_action,
                            { buffer = ev.buf, desc = 'Action' })
                    end
                    vim.keymap.set('n', 'gr', vim.lsp.buf.references, { buffer = ev.buf, desc = 'Find References' })
                    vim.keymap.set('n', '<leader>lf', function()
                        vim.lsp.buf.format { async = true }
                    end, { buffer = ev.buf, desc = 'Format' })
                end,
            })
        end
    },
}
