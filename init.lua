_G.Config = {
  path_package = vim.fn.stdpath('data') .. '/site/',
  path_source = vim.fn.stdpath('config') .. '/src/',
}

local path_package = vim.fn.stdpath('data') ..'/site'
local mini_path = path_package .. '/pack/deps/start/mini.nvim'
if not vim.loop.fs_stat(mini_path) then
    vim.cmd('echo "Installing `mini.nvim`" | redraw')
    local clone_cmd = {
        'git', 'clone', '--filter=blob:none',
        'https://github.com/echasnovski/mini.nvim', mini_path,
    }
    vim.fn.system(clone_cmd)
    vim.cmd('packadd mini.nvim | helptags ALL')
end

require('mini.deps').setup({ path = { package = path_package } })

local add, now, later = MiniDeps.add, MiniDeps.now, MiniDeps.later
local source = function(path) dofile(Config.path_source .. path) end

now(function() source('functions.lua') end)
now(function() source('settings.lua') end)
now(function() source('mappings.lua') end)
now(function() source('mappings-leader.lua') end)

-- Step one
now(function()
    add('ribru17/bamboo.nvim')
    vim.cmd('colorscheme bamboo')
end)

now(function()
    require('mini.notify').setup({
        window = { config = { border = 'double' } }
    })
    vim.notify = MiniNotify.make_notify()
end)

now(function() require('mini.tabline').setup() end)
now(function() require('mini.statusline').setup() end)
now(function() require('mini.basics').setup({
    options = { extra_ui = true, },
    mappings = { windows = true, },
    autocommands = { relnum_in_visual_mode = true, },
}) end)

-- Step two

later(function() require('mini.extra').setup() end)

later(function()
    local ai = require('mini.ai')
    ai.setup({
        custom_textobjects = {
            B = MiniExtra.gen_ai_spec.buffer(),
            F = ai.gen_spec.treesitter({ a = '@function.outer', i = '@function.inner' }),
        },
    })
end)

later(function() require('mini.align').setup() end)
later(function() require('mini.bracketed').setup() end)
later(function() require('mini.bufremove').setup() end)
later(function() require('mini.files').setup() end)

later(function() require('mini.operators').setup() end)
later(function() require('mini.pairs').setup() end)

later(function()
    require('mini.pick').setup()
    vim.ui.select = MiniPick.ui_select
end)

later(function() require('mini.surround').setup() end)

later(function() require('mini.visits').setup() end)

later(function()
    local miniclue = require('mini.clue')
    miniclue.setup({
        clues = {
            Config.leader_group_clues,
            miniclue.gen_clues.builtin_completion(),
            miniclue.gen_clues.g(),
            miniclue.gen_clues.marks(),
            miniclue.gen_clues.registers(),
            miniclue.gen_clues.windows({ submode_resize = true }),
            miniclue.gen_clues.z(),
        },
        triggers = {
            { mode = 'n', keys = '<Leader>' }, -- Leader triggers
            { mode = 'x', keys = '<Leader>' },
            { mode = 'n', keys = [[\]] },      -- mini.basics
            { mode = 'n', keys = '[' },        -- mini.bracketed
            { mode = 'n', keys = ']' },
            { mode = 'x', keys = '[' },
            { mode = 'x', keys = ']' },
            { mode = 'i', keys = '<C-x>' },    -- Built-in completion
            { mode = 'n', keys = 'g' },        -- `g` key
            { mode = 'x', keys = 'g' },
            { mode = 'n', keys = "'" },        -- Marks
            { mode = 'n', keys = '`' },
            { mode = 'x', keys = "'" },
            { mode = 'x', keys = '`' },
            { mode = 'n', keys = '"' },        -- Registers
            { mode = 'x', keys = '"' },
            { mode = 'i', keys = '<C-r>' },
            { mode = 'c', keys = '<C-r>' },
            { mode = 'n', keys = '<C-w>' },    -- Window commands
            { mode = 'n', keys = 'z' },        -- `z` key
            { mode = 'x', keys = 'z' },
        },
    })
end)

later(function()
  require('mini.completion').setup({
    lsp_completion = {
      source_func = 'omnifunc',
      auto_setup = false,
      process_items = function(items, base)
        -- Don't show 'Text' and 'Snippet' suggestions
        items = vim.tbl_filter(function(x) return x.kind ~= 1 and x.kind ~= 15 end, items)
        return MiniCompletion.default_process_items(items, base)
      end,
    },
    window = {
      info = { border = 'double' },
      signature = { border = 'double' },
    },
  })
end)

later(function() require('mini.diff').setup() end)

later(function() require('mini.git').setup() end)

later(function()
  local hipatterns = require('mini.hipatterns')
  local hi_words = MiniExtra.gen_highlighter.words
  hipatterns.setup({
    highlighters = {
      fixme = hi_words({ 'FIXME', 'Fixme', 'fixme' }, 'MiniHipatternsFixme'),
      hack = hi_words({ 'HACK', 'Hack', 'hack' }, 'MiniHipatternsHack'),
      todo = hi_words({ 'TODO', 'Todo', 'todo' }, 'MiniHipatternsTodo'),
      note = hi_words({ 'NOTE', 'Note', 'note' }, 'MiniHipatternsNote'),

      hex_color = hipatterns.gen_highlighter.hex_color(),
    },
  })
end)

later(function()
  require('mini.misc').setup({ make_global = { 'put', 'put_text', 'stat_summary', 'bench_time' } })
  MiniMisc.setup_auto_root()
  MiniMisc.setup_restore_cursor()
end)

later(function()
    source('snippets.lua')
end)

later(function() require('mini.sessions').setup() end)

later(function() require('mini.starter').setup() end)

later(function() require('mini.jump').setup() end)

later(function() require('mini.jump2d').setup() end)

-- Dependencies

now(function()
    add('nvim-tree/nvim-web-devicons')
    require('nvim-web-devicons').setup()
end)

later(function()
    local ts_spec = {
        source = 'nvim-treesitter/nvim-treesitter',
        checkout = 'master',
        monitor = 'main',
        hooks = { post_checkout = function() vim.cmd('TSUpdate') end },
    }
    add({ source = 'nvim-treesitter/nvim-treesitter-textobjects', depends = { ts_spec } })
    source('plugins/nvim-treesitter.lua')
end)

later(function()
    add({ source = 'williamboman/mason.nvim' })
    require('mason').setup()
end)

later(function()
  add('stevearc/conform.nvim')
  source('plugins/conform.lua')
end)

later(function()
  add('neovim/nvim-lspconfig')
  source('plugins/nvim-lspconfig.lua')
end)

later(function()
  add('tpope/vim-fugitive')
end)

later(function()
  add('akinsho/toggleterm.nvim')
  require('toggleterm').setup()
end)
