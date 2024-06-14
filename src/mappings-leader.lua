_G.Config.leader_group_clues = {
    { mode = 'n', keys = '<Leader>b', desc = '+Buffer' },
    { mode = 'n', keys = '<Leader>e', desc = '+Explore' },
    { mode = 'n', keys = '<Leader>f', desc = '+Find' },
    { mode = 'n', keys = '<Leader>g', desc = '+Git' },
    { mode = 'n', keys = '<Leader>l', desc = '+LSP' },
    { mode = 'n', keys = '<Leader>r', desc = '+Run' },
    { mode = 'n', keys = '<Leader>o', desc = '+Other' },

    { mode = 'x', keys = '<Leader>l', desc = '+LSP' },
}

local nmap_leader = function(suffix, rhs, desc, opts)
    opts = opts or {}
    opts.desc = desc
    vim.keymap.set('n', '<Leader>' .. suffix, rhs, opts)
end

local xmap_leader = function(suffix, rhs, desc, opts)
    opts = opts or {}
    opts.desc = desc
    vim.keymap.set('x', '<Leader>' .. suffix, rhs, opts)
end

nmap_leader('ba', '<Cmd>b#<cr>',                                 'Alternate')
nmap_leader('bd', '<Cmd>lua MiniBufremove.delete()<cr>',         'Delete')
nmap_leader('bD', '<Cmd>lua MiniBufremove.delete(0, true)<cr>',  'Delete!')
nmap_leader('bs', '<Cmd>lua Config.new_scratch_buffer()<cr>',    'Scratch')
nmap_leader('bw', '<Cmd>lua MiniBufremove.wipeout()<cr>',        'Wipeout')
nmap_leader('bW', '<Cmd>lua MiniBufremove.wipeout(0, true)<cr>', 'Wipeout!')

nmap_leader('ec', '<Cmd>lua MiniFiles.open(vim.fn.stdpath("config"))<cr>',     'Config')
nmap_leader('ed', '<Cmd>lua MiniFiles.open()<cr>',                             'Directory')
nmap_leader('ef', '<Cmd>lua MiniFiles.open(vim.api.nvim_buf_get_name(0))<cr>', 'File directory')
nmap_leader('ei', '<Cmd>edit $MYVIMRC<cr>',                                    'Vim Config')
nmap_leader('eq', '<Cmd>lua Config.toggle_quickfix()<cr>',                     'Quickfix')

nmap_leader('f/', '<Cmd>Pick history scope="/"<CR>',                 '"/" history')
nmap_leader('f:', '<Cmd>Pick history scope=":"<CR>',                 '":" history')
nmap_leader('fa', '<Cmd>Pick git_hunks scope="staged"<CR>',          'Added hunks (all)')
nmap_leader('fA', '<Cmd>Pick git_hunks path="%" scope="staged"<CR>', 'Added hunks (current)')
nmap_leader('fb', '<Cmd>Pick buffers<CR>',                           'Buffers')
nmap_leader('fc', '<Cmd>Pick git_commits<CR>',                       'Commits (all)')
nmap_leader('fC', '<Cmd>Pick git_commits path="%"<CR>',              'Commits (current)')
nmap_leader('fd', '<Cmd>Pick diagnostic scope="all"<CR>',            'Diagnostic workspace')
nmap_leader('fD', '<Cmd>Pick diagnostic scope="current"<CR>',        'Diagnostic buffer')
nmap_leader('ff', '<Cmd>Pick files<CR>',                             'Files')
nmap_leader('fg', '<Cmd>Pick grep_live<CR>',                         'Grep live')
nmap_leader('fG', '<Cmd>Pick grep pattern="<cword>"<CR>',            'Grep current word')
nmap_leader('fh', '<Cmd>Pick help<CR>',                              'Help tags')
nmap_leader('fH', '<Cmd>Pick hl_groups<CR>',                         'Highlight groups')
nmap_leader('fl', '<Cmd>Pick buf_lines scope="all"<CR>',             'Lines (all)')
nmap_leader('fL', '<Cmd>Pick buf_lines scope="current"<CR>',         'Lines (current)')
nmap_leader('fm', '<Cmd>Pick git_hunks<CR>',                         'Modified hunks (all)')
nmap_leader('fM', '<Cmd>Pick git_hunks path="%"<CR>',                'Modified hunks (current)')
nmap_leader('fr', '<Cmd>Pick resume<CR>',                            'Resume')
nmap_leader('fR', '<Cmd>Pick lsp scope="references"<CR>',            'References (LSP)')
nmap_leader('fS', '<Cmd>Pick lsp scope="workspace_symbol"<CR>',      'Symbols workspace (LSP)')
nmap_leader('fs', '<Cmd>Pick lsp scope="document_symbol"<CR>',       'Symbols buffer (LSP)')
nmap_leader('fv', '<Cmd>Pick visit_paths cwd=""<CR>',                'Visit paths (all)')
nmap_leader('fV', '<Cmd>Pick visit_paths<CR>',                       'Visit paths (cwd)')

nmap_leader('gc', '<Cmd>G commit<CR>',                        'Commit')
nmap_leader('gC', '<Cmd>G commit --amend<CR>',                'Commit amend')
nmap_leader('gg', '<Cmd>G<CR>',                               'Git tab')
nmap_leader('gl', '<Cmd>G log --oneline<CR>',                 'Log')
nmap_leader('gL', '<Cmd>G log --oneline --follow -- %<CR>',   'Log buffer')
nmap_leader('go', '<Cmd>lua MiniDiff.toggle_overlay()<CR>',   'Toggle overlay')
nmap_leader('gs', '<Cmd>lua MiniGit.show_at_cursor()<CR>',    'Show at cursor')

xmap_leader('gs', '<Cmd>lua MiniGit.show_at_cursor()<CR>',    'Show at selection')

local formatting_cmd = '<Cmd>lua require("conform").format({ lsp_fallback = true })<CR>'
nmap_leader('la', '<Cmd>lua vim.lsp.buf.signature_help()<CR>', 'Arguments popup')
nmap_leader('ld', '<Cmd>lua vim.diagnostic.open_float()<CR>',  'Diagnostics popup')
nmap_leader('lf', formatting_cmd,                              'Format')
nmap_leader('li', '<Cmd>lua vim.lsp.buf.hover()<CR>',          'Information')
nmap_leader('lj', '<Cmd>lua vim.diagnostic.goto_next()<CR>',   'Next diagnostic')
nmap_leader('lk', '<Cmd>lua vim.diagnostic.goto_prev()<CR>',   'Prev diagnostic')
nmap_leader('lR', '<Cmd>lua vim.lsp.buf.references()<CR>',     'References')
nmap_leader('lr', '<Cmd>lua vim.lsp.buf.rename()<CR>',         'Rename')
nmap_leader('ls', '<Cmd>lua vim.lsp.buf.definition()<CR>',     'Source definition')

xmap_leader('lf', formatting_cmd,                              'Format selection')

nmap_leader('vv', '<Cmd>lua MiniVisits.add_label("core")<CR>',    'Add "core" label')
nmap_leader('vV', '<Cmd>lua MiniVisits.remove_label("core")<CR>', 'Remove "core" label')
nmap_leader('vl', '<Cmd>lua MiniVisits.add_label()<CR>',          'Add label')
nmap_leader('vL', '<Cmd>lua MiniVisits.remove_label()<CR>',       'Remove label')

nmap_leader('oh', '<Cmd>normal gxiagxila<cr>', 'Move arg left')
nmap_leader('ol', '<Cmd>normal gxiagxina<cr>', 'Move arg right')
nmap_leader('oH', '<Cmd>TSBufToggle highlight<cr>', 'Highlight Toggle')
nmap_leader('os', '<Cmd>lua MiniSessions.select()<cr>', 'Highlight Toggle')

-- Snippets
vim.keymap.set("n", "<leader>se", function() require("scissors").editSnippet() end)
vim.keymap.set({ "n", "x" }, "<leader>sa", function() require("scissors").addNewSnippet() end)

local map_pick_core = function(keys, cwd, desc)
  local rhs = function()
    local sort_latest = MiniVisits.gen_sort.default({ recency_weight = 1 })
    MiniExtra.pickers.visit_paths({ cwd = cwd, filter = 'core', sort = sort_latest }, { source = { name = desc } })
  end
  nmap_leader(keys, rhs, desc)
end
map_pick_core('vc', '', 'Core visits (all)')
map_pick_core('vC', nil, 'Core visits (cwd)')
