
-- Keymaps

local map = vim.keymap.set

map({"n", "v"}, "<C-c>", '"+y')
map("n", "<leader>n", function()
  if vim.bo.filetype == "neo-tree" then
    require("neo-tree.command").execute({ action = "close" })
  else
    local name = vim.api.nvim_buf_get_name(0)
    local reveal_file = vim.bo.buftype == "" and name ~= "" and name or nil
    require("neo-tree.command").execute({
      action = "focus",
      reveal_file = reveal_file,
      position = "current",
    })
  end
end, { desc = "Toggle file tree in current window" })
map("n", "<esc>", "<cmd>nohlsearch<CR>")
map("n", "<C-p>", "<cmd>Telescope find_files<CR>")
map("n", "<C-f>", "<cmd>Telescope live_grep<CR>")
map("n", "<leader>fb", "<cmd>Telescope buffers<CR>")
map("n", "<leader>fh", "<cmd>Telescope help_tags<CR>")
