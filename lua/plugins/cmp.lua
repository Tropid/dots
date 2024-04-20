return {
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline",

            -- "hrsh7th/cmp-vsnip",
            -- "hrsh7th/vim-vsnip",

            {
                'L3MON4D3/LuaSnip',
                version = "v2.*"
            },
            'saadparwaiz1/cmp_luasnip',
        },
        config = function()
            local cmp = require('cmp')

            local ls = require('luasnip')
            -- luasnip key bindings
            vim.keymap.set({ "i" }, "<c-l>", function() ls.expand() end, { silent = true })
            vim.keymap.set({ "i", "s" }, "<c-k>", function() ls.jump(-1) end, { silent = true })
            vim.keymap.set({ "i", "s" }, "<c-j>", function() ls.jump(1) end, { silent = true })

            vim.keymap.set({ "i", "s" }, "<c-e>", function()
                if ls.choice_active() then
                    ls.change_choice(1)
                end
            end, { silent = true })

            -- require("luasnip.loaders.from_snipmate").load()
            require("luasnip.loaders.from_vscode").lazy_load {
                paths = {
                    vim.fn.stdpath('config') .. '/snippets_json',
                }
            }

            cmp.setup({
                formatting = {
                    fields = { 'kind', 'abbr', 'menu' },
                    expandable_indicator = false,
                    format = function(entry, vim_item)
                        local kind_icons = {
                            Text = "",
                            Method = "",
                            Function = "",
                            Constructor = "",
                            Field = "", -- 
                            Variable = "",
                            Class = '', -- ﴯ
                            Interface = "",
                            Module = "",
                            Property = "ﰠ",
                            Unit = "",
                            Value = "",
                            Enum = "",
                            Keyword = "",
                            Snippet = "",
                            Color = "",
                            File = "",
                            Reference = "",
                            Folder = "",
                            EnumMember = "",
                            Constant = "",
                            Struct = "",
                            Event = "",
                            Operator = '', -- 
                            TypeParameter = '  ',
                        }

                        vim_item.kind = (kind_icons[vim_item.kind] or '') .. " "
                        -- vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- show icons with the name of the item kind

                        -- limit completion width
                        local MAX_LABEL_WIDTH = 35
                        local label = vim_item.abbr
                        local truncated_label = vim.fn.strcharpart(label, 0, MAX_LABEL_WIDTH)
                        if truncated_label ~= label then
                            vim_item.abbr = truncated_label .. '…'
                        end

                        -- set a name for each source
                        vim_item.menu = ({
                            buffer = "[Buffer]",
                            nvim_lsp = "[LSP]",
                            luasnip = "[Snippet]",
                            nvim_lua = "[Lua]",
                            latex_symbols = "[LaTeX]",
                        })[entry.source.name]

                        return vim_item
                    end,
                },
                snippet = {
                    expand = function(args)
                        -- vim.fn["vsnip#anonymous"](args.body)
                        require('luasnip').lsp_expand(args.body)
                    end,
                },
                window = {
                    completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered(),
                },
                mapping = cmp.mapping.preset.insert({
                    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-f>'] = cmp.mapping.scroll_docs(4),
                    ['<C-Space>'] = cmp.mapping.complete(),
                    ['<C-e>'] = cmp.mapping.abort(),
                    ['<cr>'] = cmp.mapping.confirm({ select = true }),
                }),
                sources = cmp.config.sources({
                    { name = 'nvim_lsp' },
                    -- { name = 'vsnip' },
                    { name = 'luasnip' },
                }, {
                    { name = 'buffer' },
                })
            })

            cmp.setup.filetype('gitcommit', {
                sources = cmp.config.sources({
                    { name = 'git' },
                }, {
                    { name = 'buffer' },
                })
            })

            cmp.setup.cmdline({ '/', '?' }, {
                mapping = cmp.mapping.preset.cmdline(),
                sources = {
                    { name = 'buffer' }
                }
            })

            cmp.setup.cmdline(':', {
                mapping = cmp.mapping.preset.cmdline(),
                sources = cmp.config.sources({
                    { name = 'path' }
                }, {
                    { name = 'cmdline' }
                })
            })
        end
    },
}
