return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
    "nvim-telescope/telescope-ui-select.nvim"
  },
  config = function()
    local builtin = require("telescope.builtin")
    vim.keymap.set('n', "<C-p>", builtin.find_files, {})
    vim.keymap.set('n', "<C-f>", builtin.live_grep, {})

    require("telescope").setup({
      extensions = {
        ["ui-select"] = {
          require("telescope.themes").get_dropdown {}
        }
      }
    })
    require("telescope").load_extension("ui-select")
  end
}
