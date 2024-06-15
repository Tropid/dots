_G.Config.leader_group_clues = {
	{ mode = "n", keys = "<Leader>e", desc = "+Explore" },
	{ mode = "n", keys = "<Leader>f", desc = "+Find" },
	{ mode = "n", keys = "<Leader>g", desc = "+Git" },
	{ mode = "n", keys = "<Leader>l", desc = "+LSP" },
	{ mode = "n", keys = "<Leader>h", desc = "+Gitsigns" },
	{ mode = "n", keys = "<Leader>s", desc = "+Snippets" },

	{ mode = "x", keys = "<Leader>l", desc = "+LSP" },
}

local lmap = function(mode, lhs, rhs, desc)
	vim.api.nvim_set_keymap(mode, "<leader>" .. lhs, rhs, { desc = desc })
end

lmap("n", "ff", "<Cmd>Telescope find_files<cr>", "Find Files")
lmap("n", "fg", "<Cmd>Telescope egrepify<cr>", "Find Files")
lmap("n", "fc", "<Cmd>Telescope grep_string<cr>", "Find Files")
lmap("n", "fo", "<Cmd>Telescope oldfiles<cr>", "Old Files")
lmap("n", "fj", "<Cmd>Telescope jumplist<cr>", "Jumps")
lmap("n", "fb", "<Cmd>Telescope buffers<cr>", "Buffers")
lmap("n", "ft", "<Cmd>Telescope tags<cr>", "Tags")

lmap("n", "ee", "<Cmd>lua MiniFiles.open()<cr>", "Config")
lmap("n", "ec", '<Cmd>lua MiniFiles.open(vim.fn.stdpath("config"))<cr>', "Config")
lmap("n", "ef", "<Cmd>lua MiniFiles.open(vim.api.nvim_buf_get_name(0))<cr>", "File")
lmap("n", "ei", "<Cmd>edit $MYVIMRC<cr>", "init.lua")

lmap("n", "ld", "<Cmd>lua vim.diagnostic.open_float()<cr>", "Show Diagnostic")
lmap("n", "lD", "<Cmd>Telescope diagnostics<cr>", "Diagnostics")
lmap("n", "li", "<Cmd>Telescope lsp_incoming_calls<cr>", "Incoming Calls")
lmap("n", "lo", "<Cmd>Telescope lsp_outgoing_calls<cr>", "Outgoing Calls")
lmap("n", "lr", "<Cmd>Telescope lsp_references<cr>", "References")
lmap("n", "ls", "<Cmd>Telescope lsp_document_symbols<cr>", "Document Symbols")
lmap("n", "lS", "<Cmd>Telescope lsp_dynamic_workspace_symbols<cr>", "Workspace Symbols")
lmap("n", "la", "<Cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action")
lmap("n", "lR", "<Cmd>lua vim.lsp.buf.rename()<cr>", "Rename")
lmap("n", "lf", '<Cmd>lua require("conform").format()<cr>', "Format")
lmap("v", "lf", '<Cmd>lua require("conform").format()<cr>', "Format Range")
lmap("n", "lh", "<Cmd>lua vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())<cr>", "Toggle Inlay Hints")

lmap("n", "gg", "<Cmd>G<cr>", "Git")
lmap("n", "gb", "<Cmd>Telescope git_branches<cr>", "Branches")
lmap("n", "gc", "<Cmd>Telescope git_bcommits<cr>", "Buffer Commits")
lmap("n", "gC", "<Cmd>Telescope git_commits<cr>", "Commits")
lmap("n", "gB", "<Cmd>G blame<cr>", "Blame")

lmap("n", "hs", "<Cmd>Gitsigns stage_hunk<cr>", "Stage Hunk")
lmap("n", "hr", "<Cmd>Gitsigns reset_hunk<cr>", "Reset Hunk")
lmap("n", "hp", "<Cmd>Gitsigns preview_hunk<cr>", "Preview Hunk")
lmap("n", "hd", "<Cmd>Gitsigns diffthis<cr>", "Diff This")
lmap("n", "hb", '<Cmd>lua require("gitsigns").blame_line{full=true}<cr>', "Diff This")

lmap("n", "sa", '<Cmd>lua require("scissors").addNewSnippet()<cr>', "New Snippet")
lmap("x", "sa", '<Cmd>lua require("scissors").addNewSnippet()<cr>', "New Snippet")
lmap("n", "se", '<Cmd>lua require("scissors").editSnippet()<cr>', "Edit Snippets")

lmap("n", "to", '<Cmd>1ToggleTerm size=40 direction=horizontal name=terminal1<cr>', "Terminal 1")
