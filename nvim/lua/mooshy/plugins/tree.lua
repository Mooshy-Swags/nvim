
-- File tree

return {

  {
    "nvim-neo-tree/neo-tree.nvim",
    cmd = "Neotree",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    config = function()
      require("neo-tree").setup({
        close_if_last_window = true,
        window = {
          position = "left",
          width = 28,
        },
        popup_border_style = "rounded",
        default_component_configs = {
          indent = { with_expanders = true },
        },
        filesystem = {
          filtered_items = {
            visible = true,
            hide_dotfiles = false,
            hide_gitignored = true,
          },
        },
      })
    end,
  },
}
