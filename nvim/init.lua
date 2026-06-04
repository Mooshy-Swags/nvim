
-- init
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set mouse=a")
vim.cmd("set nu rnu")
vim.g.mapleader = " "


-- Keymaps

vim.opt.clipboard = ""

vim.g.clipboard = {
  name = 'OSC 52',
  copy = { ['+'] = require('vim.ui.clipboard.osc52').copy('+'), ... },
  paste = { ['+'] = require('vim.ui.clipboard.osc52').paste('+'), ... },
}

vim.keymap.set({'n', 'v'}, "<C-c>", '"+y')
vim.keymap.set({'n', 'v'}, "<C-v>", '"+p')
vim.keymap.set('n', '<leader>n', ':Neotree filesystem reveal left<CR>')
vim.api.nvim_set_keymap('n', '<leader>pyw', ':setlocal expandtab tabstop=2 softtabstop=2 shiftwidth=2<CR>', { noremap = true, silent = true })

-- vim.keymap.set('i', "<C-r>", 'copilot#Accept("<CR>")', {expr = true, replace_keycodes = false})
-- vim.g.copilot_no_tab_map = true
-- vim.b.copilot_enabled = true

-- Lazy load
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- Lazy
require("lazy").setup("plugins")
vim.cmd(":Neotree filesystem reveal left")
vim.cmd(":vertical resize -12")


