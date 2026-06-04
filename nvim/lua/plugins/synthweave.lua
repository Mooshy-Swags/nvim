return {
  "samharju/synthweave.nvim",
  priority = 1000,
  config = function()
    local synthweave = require("synthweave")
    synthweave.setup({})
    vim.cmd.colorscheme "synthweave-transparent"
    end
}
