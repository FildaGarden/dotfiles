vim.keymap.set('t', '<esc><esc>', '<c-\\><c-n>')

local state = {
  floating = {
    buf = -1,
    win = -1,
  },
}

local function open_floating_window(opts)
  opts = opts or {}

  -- Get editor dimensions
  local columns = vim.o.columns
  local lines = vim.o.lines

  -- Default to 80% size if not provided
  local win_width = opts.width or math.floor(columns * 0.8)
  local win_height = opts.height or math.floor(lines * 0.8)

  -- Calculate centered position
  local col = math.floor((columns - win_width) / 2)
  local row = math.floor((lines - win_height) / 2)

  -- Create a scratch buffer
  local buf = nil
  if vim.api.nvim_buf_is_valid(opts.buf) then
    buf = opts.buf
  else
    buf = vim.api.nvim_create_buf(false, true)
  end

  -- Create window config
  local win_config = {
    style = 'minimal',
    relative = 'editor',
    width = win_width,
    height = win_height,
    col = col,
    row = row,
    border = 'rounded',
  }

  -- Create the floating window
  local win = vim.api.nvim_open_win(buf, true, win_config)

  return { buf = buf, win = win }
end

local toggle_terminal = function()
  if not vim.api.nvim_win_is_valid(state.floating.win) then
    state.floating = open_floating_window { buf = state.floating.buf }
    vim.cmd 'startinsert'
    if vim.bo[state.floating.buf].buftype ~= 'terminal' then
      vim.cmd.terminal()
      vim.cmd 'startinsert'
    end
  else
    vim.api.nvim_win_hide(state.floating.win)
  end
end
vim.api.nvim_create_user_command('Floaterminal', toggle_terminal, {})
vim.keymap.set('n', '<space>t', toggle_terminal, { desc = '[T]oggle Terminal' })

return {}
