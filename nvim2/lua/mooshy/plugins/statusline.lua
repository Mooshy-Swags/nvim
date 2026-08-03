
-- Statusline

return {

  {
    "nvim-lualine/lualine.nvim",
    lazy = false,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    opts = {
      options = {
        theme = {
          normal = {
            a = { fg = "#3b5ba6", bg = "NONE", gui = "bold" },
            b = { fg = "#d0d0d0", bg = "NONE" },
            c = { fg = "#d0d0d0", bg = "NONE" },
          },
          insert = {
            a = { fg = "#8ed1f6", bg = "NONE", gui = "bold" },
            b = { fg = "#d0d0d0", bg = "NONE" },
            c = { fg = "#d0d0d0", bg = "NONE" },
          },
          visual = {
            a = { fg = "#ffc1f4", bg = "NONE", gui = "bold" },
            b = { fg = "#d0d0d0", bg = "NONE" },
            c = { fg = "#d0d0d0", bg = "NONE" },
          },
          command = {
            a = { fg = "#b491f5", bg = "NONE", gui = "bold" },
            b = { fg = "#d0d0d0", bg = "NONE" },
            c = { fg = "#d0d0d0", bg = "NONE" },
          },
          replace = {
            a = { fg = "#ffc1f4", bg = "NONE", gui = "bold" },
            b = { fg = "#d0d0d0", bg = "NONE" },
            c = { fg = "#d0d0d0", bg = "NONE" },
          },
          terminal = {
            a = { fg = "#3b5ba6", bg = "NONE", gui = "bold" },
            b = { fg = "#d0d0d0", bg = "NONE" },
            c = { fg = "#d0d0d0", bg = "NONE" },
          },
          inactive = {
            a = { fg = "#888888", bg = "NONE" },
            b = { fg = "#888888", bg = "NONE" },
            c = { fg = "#888888", bg = "NONE" },
          },
        },
        section_separators = { left = "", right = "" },
        component_separators = { left = "", right = "" },
      },
    },
    config = function(_, opts)
      require("lualine").setup(opts)
    end,
  },
}
