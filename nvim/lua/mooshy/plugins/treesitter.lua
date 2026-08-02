
-- Treesitter

return {

  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    lazy = false,
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter").setup({})

      require("nvim-treesitter").install {
        "bash",
        "c",
        "comment",
        "css",
        "html",
        "javascript",
        "json",
        "lua",
        "luadoc",
        "markdown",
        "markdown_inline",
        "python",
        "query",
        "regex",
        "toml",
        "typescript",
        "vim",
        "vimdoc",
        "yaml",
      }

      vim.api.nvim_create_autocmd("FileType", {
        callback = function()
          pcall(vim.treesitter.start)
        end,
      })
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    branch = "main",
    dependencies = {
      { "nvim-treesitter/nvim-treesitter", branch = "main" },
    },
    init = function()
      vim.g.no_plugin_maps = true
    end,
    config = function()
      local textobjects = require("nvim-treesitter-textobjects")

      textobjects.setup({
        select = {
          lookahead = true,
          selection_modes = {
            ["@parameter.outer"] = "v",
            ["@function.outer"] = "V",
            ["@class.outer"] = "<c-v>",
          },
          include_surrounding_whitespace = true,
        },
        move = {
          set_jumps = true,
        },
      })

      local select = require("nvim-treesitter-textobjects.select")
      local move = require("nvim-treesitter-textobjects.move")
      local swap = require("nvim-treesitter-textobjects.swap")

      local map = vim.keymap.set

      map({ "x", "o" }, "af", function()
        select.select_textobject("@function.outer", "textobjects")
      end)
      map({ "x", "o" }, "if", function()
        select.select_textobject("@function.inner", "textobjects")
      end)
      map({ "x", "o" }, "ac", function()
        select.select_textobject("@class.outer", "textobjects")
      end)
      map({ "x", "o" }, "ic", function()
        select.select_textobject("@class.inner", "textobjects")
      end)

      map({ "n", "x", "o" }, "]m", function()
        move.goto_next_start("@function.outer", "textobjects")
      end)
      map({ "n", "x", "o" }, "[m", function()
        move.goto_previous_start("@function.outer", "textobjects")
      end)
      map({ "n", "x", "o" }, "]M", function()
        move.goto_next_end("@function.outer", "textobjects")
      end)
      map({ "n", "x", "o" }, "[M", function()
        move.goto_previous_end("@function.outer", "textobjects")
      end)

      map({ "n", "x", "o" }, "]]", function()
        move.goto_next_start("@class.outer", "textobjects")
      end)
      map({ "n", "x", "o" }, "[[", function()
        move.goto_previous_start("@class.outer", "textobjects")
      end)
      map({ "n", "x", "o" }, "][", function()
        move.goto_next_end("@class.outer", "textobjects")
      end)
      map({ "n", "x", "o" }, "[]", function()
        move.goto_previous_end("@class.outer", "textobjects")
      end)

      map("n", "<leader>a", function()
        swap.swap_next("@parameter.inner")
      end)
      map("n", "<leader>A", function()
        swap.swap_previous("@parameter.inner")
      end)

      local repeat_move = require("nvim-treesitter-textobjects.repeatable_move")
      map({ "n", "x", "o" }, ";", repeat_move.repeat_last_move_next)
      map({ "n", "x", "o" }, ",", repeat_move.repeat_last_move_previous)
      map({ "n", "x", "o" }, "f", repeat_move.builtin_f_expr, { expr = true })
      map({ "n", "x", "o" }, "F", repeat_move.builtin_F_expr, { expr = true })
      map({ "n", "x", "o" }, "t", repeat_move.builtin_t_expr, { expr = true })
      map({ "n", "x", "o" }, "T", repeat_move.builtin_T_expr, { expr = true })
    end,
  },
}
