local border = {
	{ "🭽", "FloatBorder" },
	{ "▔", "FloatBorder" },
	{ "🭾", "FloatBorder" },
	{ "▕", "FloatBorder" },
	{ "🭿", "FloatBorder" },
	{ "▁", "FloatBorder" },
	{ "🭼", "FloatBorder" },
	{ "▏", "FloatBorder" },
}

-- LSP settings (for overriding per client)
local handlers = {
	["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" }),
	["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = border }),
}

return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"folke/lazydev.nvim",
		},
		config = function()
			local lspconfig = require("lspconfig")
			require("mason").setup()
			require("lazydev").setup()

			lspconfig.clangd.setup({ handlers = handlers })
			lspconfig.clojure_lsp.setup({ handlers = handlers })
			lspconfig.gleam.setup({ handlers = handlers })
			lspconfig.gopls.setup({ handlers = handlers })
			lspconfig.jsonls.setup({ handlers = handlers })
			lspconfig.lua_ls.setup({ handlers = handlers })
			lspconfig.pyright.setup({ handlers = handlers })
			-- lspconfig.ruff.setup({ handlers = handlers })
			lspconfig.rust_analyzer.setup({ handlers = handlers })
			lspconfig.zls.setup({ handlers = handlers })

			lspconfig.omnisharp.setup({
				cmd = { "dotnet", vim.fn.stdpath("data") .. "/mason/packages/omnisharp/libexec/OmniSharp.dll" },
				settings = {
					EnableEditorConfigSupport = true,
				},
				handlers = handlers,
			})
		end,
	},
}
