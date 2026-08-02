
-- Completion

return {

  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "onsails/lspkind.nvim",
    },
    config = function()
      local cmp = require("cmp")
      local lspkind = require("lspkind")

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

      cmp.setup({
        snippet = {
          expand = function(args)
            vim.snippet.expand(args.body)
          end,
        },
        window = {
          completion = cmp.config.window.bordered({
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
          }),
          documentation = cmp.config.window.bordered({
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
          }),
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif vim.snippet.active({ direction = 1 }) then
              vim.snippet.jump(1)
            else
              fallback()
            end
          end, { "i", "s" }),
          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif vim.snippet.active({ direction = -1 }) then
              vim.snippet.jump(-1)
            else
              fallback()
            end
          end, { "i", "s" }),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "buffer" },
          { name = "path" },
        }, {
          { name = "buffer" },
        }),
        formatting = {
          fields = { "kind", "abbr", "menu" },
          format = lspkind.cmp_format({
            mode = "symbol_text",
            maxwidth = 50,
            ellipsis_char = "...",
          }),
        },
        experimental = {
          ghost_text = true,
        },
      })

      cmp.setup.cmdline(":", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = "cmdline" },
        }, {
          { name = "buffer" },
        }),
      })

      cmp.setup.cmdline("/", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = "buffer" },
        },
      })
    end,
  },
}
