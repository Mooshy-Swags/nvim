return {
  "nvim-treesitter/nvim-treesitter",
  branch = "master",
  build = ":TSUpdate",
  config = function() 
    require("nvim-treesitter.configs").setup({
      ensure_installed = {"lua", "python", "javascript", "java", "cpp", "c", "haskell"},
      highlight = {enable = true},
      indent = {enable = true}
    })
  end
}
