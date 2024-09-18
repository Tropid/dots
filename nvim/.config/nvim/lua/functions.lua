local find_buffer_by_name = function(name)
  for _, buf in ipairs(vim.api.nvim_list_bufs()) do
    local buf_name = vim.api.nvim_buf_get_name(buf)
    if buf_name:match('.*' .. name .. '$') then
      return buf
    end
  end
  return -1
end

function CreateScratchBuffer()
  local scratch_nr = 1
  local scratch_name = 'SCRATCH'

  while true do
    scratch_name = 'SCRATCH#'..scratch_nr
    if find_buffer_by_name(scratch_name) == -1 then
      break
    end
    scratch_nr = scratch_nr + 1
  end

  local new_buf = vim.api.nvim_create_buf(true, true)
  vim.api.nvim_buf_set_name(new_buf, scratch_name)
  vim.api.nvim_set_current_buf(new_buf)
end

function DiffConflict(cmp_mode)
  local cur_buf = vim.api.nvim_get_current_buf()
  local cur_win = vim.api.nvim_get_current_win()

  local cur_line = vim.fn.line(".")
  local start_line = cur_line
  local end_line = cur_line

  local line_count = vim.api.nvim_buf_line_count(cur_buf)

  while cur_line > 0 do
    if vim.fn.getline(cur_line):match('^<<<<<<.*') then
      start_line = cur_line
      break
    end
    cur_line = cur_line - 1
  end
  while cur_line < line_count do
    if vim.fn.getline(cur_line):match('^>>>>>>.*') then
      end_line = cur_line
      break
    end
    cur_line = cur_line + 1
  end

  local lines = vim.api.nvim_buf_get_lines(cur_buf, start_line, end_line, false)

  local llines = {}
  local blines = {}
  local rlines = {}
  local mode = 'l'
  for _, line in ipairs(lines) do
    if (string.match(line, '<<<<<<.*')) then
      mode = 'l'
    elseif (string.match(line, '^|||||||.*')) then
      mode = 'b'
    elseif (string.match(line, '^======.*')) then
      mode = 'r'
    elseif (string.match(line, '^>>>>>>.*')) then
      break
    else
      if (mode == 'l') then table.insert(llines, line) end
      if (mode == 'b') then table.insert(blines, line) end
      if (mode == 'r') then table.insert(rlines, line) end
    end
  end

  local aname = ''
  local bname = ''
  local lines1 = llines
  local lines2 = rlines
  if (cmp_mode == 'o') then
    aname = 'BASE'
    bname = 'REMOTE'
    lines1 = blines
    lines2 = rlines
  elseif (cmp_mode == 'm') then
    aname = 'BASE'
    bname = 'LOCAL'
    lines1 = blines
    lines2 = llines
  elseif (cmp_mode == 'b') then
    aname = 'LOCAL'
    bname = 'REMOTE'
    lines1 = llines
    lines2 = rlines
  end

  local basebuf = find_buffer_by_name('BASE')
  if basebuf ~= -1 then
    vim.api.nvim_buf_delete(basebuf, {})
  end
  local localbuf = find_buffer_by_name('LOCAL')
  if localbuf ~= -1 then
    vim.api.nvim_buf_delete(localbuf, {})
  end
  local remotebuf = find_buffer_by_name('REMOTE')
  if remotebuf ~= -1 then
    vim.api.nvim_buf_delete(remotebuf, {})
  end

  local lbuf = vim.api.nvim_create_buf(true, true)

  vim.api.nvim_buf_set_name(lbuf, aname)
  vim.api.nvim_set_option_value('filetype', 'cpp', { buf = lbuf })
  vim.api.nvim_buf_set_lines(lbuf, 0, -1, false, lines1)

  local rbuf = vim.api.nvim_create_buf(true, true)

  vim.api.nvim_buf_set_name(rbuf, bname)
  vim.api.nvim_set_option_value('filetype', 'cpp', { buf = rbuf })
  vim.api.nvim_buf_set_lines(rbuf, 0, -1, false, lines2)

  vim.cmd('diffoff!')

  vim.cmd('split')
  local bwin = vim.api.nvim_get_current_win()

  vim.cmd('vsplit')
  local awin = vim.api.nvim_get_current_win()

  vim.api.nvim_win_set_buf(bwin, rbuf)
  vim.api.nvim_win_set_buf(awin, lbuf)

  vim.api.nvim_set_option_value('cursorline', false, { win = awin })
  vim.api.nvim_set_option_value('cursorline', false, { win = bwin })

  vim.api.nvim_set_current_win(bwin)
  vim.cmd('diffthis')

  vim.api.nvim_set_current_win(awin)
  vim.cmd('diffthis')

  vim.api.nvim_set_current_win(cur_win)
end

function AddToQuickfix()
  local line_nr = vim.fn.line('.')
  local col_nr = vim.fn.col('.')
  local file = vim.fn.expand('%')
  -- local line_content = vim.fn.getline('.')
  local text = vim.fn.input({prompt = 'Note: '})

  local qf = vim.fn.getqflist()
  table.insert(qf, {
    filename = file,
    col = col_nr,
    lnum = line_nr,
    text = text,
  })

  vim.fn.setqflist(qf)
end

function ClearQuickfix()
  vim.fn.setqflist({})
end

function SaveQuickfix()
  local qf = vim.fn.getqflist()
  local output = {}
  for _, line in ipairs(qf) do
    local file = vim.api.nvim_buf_get_name(line.bufnr)
    table.insert(output, file .. ':' .. line.lnum .. ':' .. line.col .. ':' .. line.text)
  end
  vim.fn.writefile(output, vim.fn.input('Name: '))
end
