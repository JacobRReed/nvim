vim.g.mapleader = ' '

local set_keymap = vim.api.nvim_set_keymap
local function t(str)
  -- Adjust boolean arguments as needed
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end
function _G.smart_tab()
  return vim.fn.pumvisible() == 1 and t'<C-n>' or t'<Tab>'
end
function _G.smart_shift_tab()
  return vim.fn.pumvisible() == 1 and t'<C-p>' or t'<S-Tab>'
end

set_keymap('n','<leader>e','<cmd>NvimTreeToggle<cr>', {noremap=true,silent=true})

set_keymap('n', '<C-h>', '<C-w>h', {noremap = true, silent = false})
set_keymap('n', '<C-j>', '<C-w>j', {noremap = true, silent = false})
set_keymap('n', '<C-k>', '<C-w>k', {noremap = true, silent = false})
set_keymap('n', '<C-l>', '<C-w>l', {noremap = true, silent = false})

set_keymap('n', '<Leader>ff', [[<Cmd>lua require('telescope.builtin').find_files()<CR>]], { noremap = true, silent = true })
set_keymap('n', '<Leader>fa', [[<Cmd>lua require('telescope.builtin').live_grep()<CR>]], { noremap = true, silent = true })

set_keymap('i', '<Tab>', 'v:lua.smart_tab()', {expr = true, noremap = true})
set_keymap('i', '<S-Tab>', 'v:lua.smart_shift_tab()', {expr = true, noremap = true})

set_keymap('n', '<leader>g', '<cmd>LazyGit<cr>', {silent=true, noremap=true})

set_keymap('n', '<leader>/', '<cmd>CommentToggle<cr>', {silent=true, noremap=true})

set_keymap('n', '<leader>hh', '<cmd>bprevious<cr>', {silent=true, noremap=true})
set_keymap('n', '<leader>ll', '<cmd>bnext<cr>', {silent=true, noremap=true})
