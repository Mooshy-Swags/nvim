return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim"
  },
  config = function()
    require("mason").setup()
    
    local lspconfig = require("lspconfig")

    require("mason-lspconfig").setup({
      ensure_installed = {
        "lua_ls",
        "pyright",
        "clangd",
        -- "hls",
        "jdtls"
      },
      -- This handler automatically sets up any server installed via Mason
      handlers = {
        function(server_name)
          -- Use the new vim.lsp.config if available, or fallback
          lspconfig[server_name].setup({})
        end,
      }
    })

    -- Keymaps (these remain the same)
    vim.keymap.set('n', "K", vim.lsp.buf.hover, {})
    vim.keymap.set('n', "gD", vim.lsp.buf.declaration, {})
    vim.keymap.set('n', "gd", vim.lsp.buf.definition, {})
    vim.keymap.set({'n', 'v'}, "<leader>ca", vim.lsp.buf.code_action, {})
  end
}
