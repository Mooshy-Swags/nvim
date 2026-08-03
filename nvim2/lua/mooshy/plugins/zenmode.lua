
-- Zen mode (picture frame)

return {

  {
    "folke/zen-mode.nvim",
    lazy = true,
    cmd = "ZenMode",
    keys = {
      { "<leader>z", "<cmd>ZenMode<CR>", desc = "Zen mode" },
    },
    init = function()
      vim.api.nvim_create_autocmd("VimEnter", {
        group = vim.api.nvim_create_augroup("MooshyZenStartup", { clear = true }),
        callback = function()
          pcall(vim.cmd, "ZenMode")
        end,
      })
    end,
    opts = {
      window = {
        backdrop = 1,
        width = 1,
        height = 1,
      },
      border = {
        { "╭", "CmpBorderTl" },
        { "─", "CmpBorderT" },
        { "╮", "CmpBorderTr" },
        { "│", "CmpBorderR" },
        { "╯", "CmpBorderBr" },
        { "─", "CmpBorderB" },
        { "╰", "CmpBorderBl" },
        { "│", "CmpBorderL" },
      },
      plugins = {
        options = {
          enabled = true,
          ruler = false,
          showcmd = false,
          laststatus = 0,
        },
        twilight = { enabled = false },
      },
    },
    config = function(_, opts)
      local gradient = {
        Tl = "#8ed1f6",
        T = "#8ed1f6",
        Tr = "#aacdf6",
        R = "#c7c9f5",
        Br = "#ffc1f4",
        B = "#ffc1f4",
        Bl = "#e3c5f5",
        L = "#c7c9f5",
      }
      for name, color in pairs(gradient) do
        vim.api.nvim_set_hl(0, "CmpBorder" .. name, { fg = color })
      end
      require("zen-mode").setup(opts)
    end,
  },
}
