_G.Config.leader_group_clues = {
	{ mode = "n", keys = "<Leader>e", desc = "+Explore" },
	{ mode = "n", keys = "<Leader>f", desc = "+Find" },
	{ mode = "n", keys = "<Leader>g", desc = "+Git" },
	{ mode = "n", keys = "<Leader>l", desc = "+LSP" },
	{ mode = "n", keys = "<Leader>h", desc = "+Gitsigns" },
	{ mode = "n", keys = "<Leader>s", desc = "+Snippets" },
	{ mode = "n", keys = "<Leader>o", desc = "+Overseer" },

	{ mode = "x", keys = "<Leader>l", desc = "+LSP" },
}

local lmap = function(mode, lhs, rhs, desc)
	vim.api.nvim_set_keymap(mode, "<leader>" .. lhs, rhs, { desc = desc })
end

lmap("n", "ff", "<Cmd>FzfLua files<cr>", "Find Files")
lmap("n", "fg", "<Cmd>FzfLua live_grep<cr>", "Find Files")
lmap("n", "fc", "<Cmd>FzfLua grep_cWORD<cr>", "Find Files")
lmap("n", "fo", "<Cmd>FzfLua oldfiles<cr>", "Old Files")
lmap("n", "fj", "<Cmd>FzfLua jumps<cr>", "Jumps")
lmap("n", "fb", "<Cmd>FzfLua buffers<cr>", "Buffers")
lmap("n", "ft", "<Cmd>FzfLua tags<cr>", "Tags")
lmap("n", "fh", "<Cmd>FzfLua helptags<cr>", "Help")
lmap("n", "fm", "<Cmd>FzfLua marks<cr>", "Marks")

lmap("n", "eo", "<Cmd>Oil<cr>", "Config")
lmap("n", "ec", '<Cmd>Oil ' .. vim.fn.stdpath("config") .. '<cr>', "Config")
lmap("n", "ef", '<Cmd>Oil ' .. vim.fn.expand("%") .. '<cr>', "File")

lmap("n", "ld", "<Cmd>lua vim.diagnostic.open_float()<cr>", "Show Diagnostic")
lmap("n", "lD", "<Cmd>FzfLua diagnostics_workspace<cr>", "Diagnostics")
lmap("n", "li", "<Cmd>FzfLua lsp_incoming_calls<cr>", "Incoming Calls")
lmap("n", "lo", "<Cmd>FzfLua lsp_outgoing_calls<cr>", "Outgoing Calls")
lmap("n", "lr", "<Cmd>FzfLua lsp_references<cr>", "References")
lmap("n", "ls", "<Cmd>FzfLua lsp_document_symbols<cr>", "Document Symbols")
lmap("n", "lS", "<Cmd>FzfLua lsp_workspace_symbols<cr>", "Workspace Symbols")
lmap("n", "la", "<Cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action")
lmap("n", "lR", "<Cmd>lua vim.lsp.buf.rename()<cr>", "Rename")
lmap("n", "lf", '<Cmd>lua require("conform").format()<cr>', "Format")
lmap("v", "lf", '<Cmd>lua require("conform").format()<cr>', "Format Range")
lmap("n", "lh", "<Cmd>lua vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())<cr>", "Toggle Inlay Hints")
vim.api.nvim_set_keymap("n", "gd", "<Cmd>lua vim.lsp.buf.definition()<cr>", { desc = "Goto Definition"})

lmap("n", "gg", "<Cmd>G<cr>", "Git")
lmap("n", "gb", "<Cmd>FzfLua git_branches<cr>", "Branches")
lmap("n", "gc", "<Cmd>FzfLua git_bcommits<cr>", "Buffer Commits")
lmap("n", "gC", "<Cmd>FzfLua git_commits<cr>", "Commits")
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

lmap("n", "ot", '<Cmd>OverseerToggle<cr>', "Toggle UI")
lmap("n", "ol", '<Cmd>OverseerLoadBundle<cr>', "Load")
lmap("n", "os", '<Cmd>OverseerSaveBundle<cr>', "Save")
lmap("n", "ob", '<Cmd>OverseerBuild<cr>', "Build")
lmap("n", "or", '<Cmd>OverseerRun<cr>', "Run")
