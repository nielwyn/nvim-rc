return {
  "nvim-treesitter/nvim-treesitter",
  branch = "master",
  lazy = false,
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter.configs").setup {
      ensure_installed = {
        "lua", "vim", "vimdoc", "query", "javascript", "typescript", "rust"
      },
      highlight = { enable = true },
    }
  end,
}
