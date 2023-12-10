return {
    {
        'simrat39/rust-tools.nvim',
        config = function()
            local extension_path = vim.fn.stdpath('data') .. '/mason/packages/codelldb/extension/'
            local codelldb_path = extension_path .. 'adapter/codelldb'
            local liblldb_path = extension_path .. 'lldb/lib/liblldb'
            local this_os = vim.loop.os_uname().sysname;

            -- The path in windows is different
            if this_os:find 'Windows' then
                extension_path = vim.fn.stdpath('data') .. '\\mason\\packages\\codelldb\\extension\\'
                codelldb_path = extension_path .. 'adapter\\codelldb.exe'
                liblldb_path = extension_path .. 'lldb\\bin\\liblldb.dll'
            else
                -- The liblldb extension is .so for linux and .dylib for macOS
                liblldb_path = liblldb_path .. (this_os == "Linux" and ".so" or ".dylib")
            end

            local rt = require("rust-tools")
            rt.setup({
                server = {
                    cmd = { vim.fn.stdpath('data') .. '/mason/bin/rust-analyzer.cmd' },
                    on_attach = function(_, bufnr)
                        -- Hover actions
                        vim.keymap.set("n", "K", rt.hover_actions.hover_actions, { buffer = bufnr })
                        -- Code action groups
                        vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
                    end,
                },

                dap = {
                    adapter = {
                        type = "server",
                        port = "5734",
                        host = "127.0.0.1",
                        executable = {
                            command = codelldb_path,
                            args = { "--liblldb", liblldb_path, "--port", "5734" },
                        },
                    },
                },
            })
        end
    }
}
