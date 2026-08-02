
-- Keymaps

local map = vim.keymap.set

map({"n", "v"}, "<C-c>", '"+y')
vim.api.nvim_set_keymap("n", "<leader>n", "<cmd>Neotree filesystem reveal left<CR>", {noremap = true, silent = true})
map("n", "<esc>", "<cmd>nohlsearch<CR>")
map("n", "<C-p>", "<cmd>Telescope find_files<CR>")
map("n", "<C-f>", "<cmd>Telescope live_grep<CR>")
map("n", "<leader>fb", "<cmd>Telescope buffers<CR>")
map("n", "<leader>fh", "<cmd>Telescope help_tags<CR>")
