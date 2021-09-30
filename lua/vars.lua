vim.g.dashboard_default_executive = 'telescope'

local set_option = vim.api.nvim_set_option
set_option("completeopt","menuone,noinsert,noselect")
set_option("shortmess", vim.api.nvim_get_option("shortmess") .. "c")
set_option('number', true)
