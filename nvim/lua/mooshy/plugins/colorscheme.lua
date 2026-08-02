
-- Color schemes

--[[

Styles available:
candyland
synthweave
dracula
nightfly
moonfly
vague
fogbell
photon
nordic
tokyonight

]]

local active_colorscheme = "candyland"

return {

--[[ Default layout

  {
    "",
    lazy = active_colorscheme ~= "",
    priority = 1000,
    opts = {},
    config = function(_, opts)
      require("").setup(opts)
      if active_colorscheme == "" then
        vim.cmd.colorscheme("")
      end
    end,
  },

]]

-- Synthweave

  {
    "samharju/synthweave.nvim",
    lazy = active_colorscheme ~= "synthweave",
    priority = 1000,
    opts = {},
    config = function(_, opts)
      require("synthweave").setup(opts)
      if active_colorscheme == "synthweave" then
        vim.cmd.colorscheme("synthweave-transparent")
      end
    end,
  },

  {
    "Mofiqul/dracula.nvim",
    lazy = active_colorscheme ~= "dracula",
    priority = 1000,
    opts = {transparent_bg=true},
    config = function(_, opts)
      require("dracula").setup(opts)
      if active_colorscheme == "dracula" then
        vim.cmd.colorscheme("dracula")
      end
    end,
  },

  {
    "bluz71/vim-nightfly-colors",
    name = "nightfly",
    lazy = active_colorscheme ~= "nightfly",
    priority = 1000,
    config = function()
      vim.g.nightflyTransparent = true
      if active_colorscheme == "nightfly" then
        vim.cmd.colorscheme("nightfly")
      end
    end,
  },

  {
    "bluz71/vim-moonfly-colors",
    name = "moonfly",
    lazy = active_colorscheme ~= "moonfly",
    priority = 1000,
    config = function()
      vim.g.moonflyTransparent = true
      if active_colorscheme == "moonfly" then
        vim.cmd.colorscheme("moonfly")
      end
    end,
  },

  {
    "vague-theme/vague.nvim",
    lazy = active_colorscheme ~= "vague",
    priority = 1000,
    opts = {transparent=true},
    config = function(_, opts)
      require("vague").setup(opts)
      if active_colorscheme == "vague" then
        vim.cmd.colorscheme("vague")
      end
    end,
  },

  {
    "jaredgorski/fogbell.vim",
    name = "fogbell",
    lazy = active_colorscheme ~= "fogbell",
    priority = 1000,
    config = function()
      if active_colorscheme == "fogbell" then
        vim.cmd.colorscheme("fogbell")
      end
    end,
  },

  {
    "axvr/photon.vim",
    name = "photon",
    lazy = active_colorscheme ~= "photon",
    priority = 1000,
    config = function()
      if active_colorscheme == "photon" then
        vim.cmd.colorscheme("photon")
      end
    end,
  },

  {
    "AlexvZyl/nordic.nvim",
    lazy = active_colorscheme ~= "nordic",
    priority = 1000,
    opts = {transparent={bg=true}},
    config = function(_, opts)
      require("nordic").setup(opts)
      if active_colorscheme == "nordic" then
        vim.cmd.colorscheme("nordic")
      end
    end,
  },

  {
    "folke/tokyonight.nvim",
    lazy = active_colorscheme ~= "tokyonight",
    priority = 1000,
    opts = {style="moon", transparent=true},
    config = function(_, opts)
      require("tokyonight").setup(opts)
      if active_colorscheme == "tokyonight" then
        vim.cmd.colorscheme("tokyonight")
      end
    end,
  },

  {
    "AmberLehmann/candyland.nvim",
    lazy = active_colorscheme ~= "candyland",
    priority = 1000,
    opts = { transparent = true },
    config = function(_, opts)
      vim.cmd.colorscheme("candyland")
      if active_colorscheme == "candyland" and opts.transparent then
        vim.api.nvim_set_hl(0, "Comment", { fg = "#7f8fa8", italic = true })
        for _, group in ipairs({
          "Normal",
          "NormalNC",
          "EndOfBuffer",
          "SignColumn",
          "LineNr",
          "CursorLineNr",
          "CursorLine",
          "CursorColumn",
          "ColorColumn",
          "FoldColumn",
          "WinSeparator",
          "NormalFloat",
          "FloatBorder",
          "FloatTitle",
          "NormalSB",
          "StatusLine",
          "StatusLineNC",
          "WinBar",
          "WinBarNC",
          "TabLine",
          "TabLineFill",
          "TabLineSel",
          "Pmenu",
          "PmenuKind",
          "PmenuExtra",
          "PmenuSbar",
          "PmenuThumb",
          "MsgArea",
          "MsgSeparator",
          "NotifyBackground",
          "NotifyERRORBody",
          "NotifyWARNBody",
          "NotifyINFOBody",
          "NotifyDEBUGBody",
          "NotifyTRACEBody",
          "NoiceVirtualText",
          "CmpDocumentation",
          "CmpDocumentationBorder",
        }) do
          local hl = vim.api.nvim_get_hl(0, { name = group })
          hl.bg = "NONE"
          vim.api.nvim_set_hl(0, group, hl)
        end
      end
    end,
  },

}
