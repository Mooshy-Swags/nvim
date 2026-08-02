
-- Noice

return {

  {
    "rcarriga/nvim-notify",
    lazy = false,
    opts = {
      background_colour = "#000000",
    },
    config = function(_, opts)
      require("notify").setup(opts)
    end,
  },

  {
    "folke/noice.nvim",
    lazy = false,
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
    opts = {
      lsp = {
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true,
        },
      },
      routes = {
        {
          filter = {
            event = "msg_show",
            any = {
              { find = "%d+L, %d+B" },
              { find = "; after #%d+" },
              { find = "; before #%d+" },
            },
          },
          view = "mini",
        },
      },
    },
    config = function(_, opts)
      require("noice").setup(opts)
    end,
  },
}
