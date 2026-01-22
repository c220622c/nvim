
return {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      auto_install = true,
      ensure_installed = { "c", "vim", "fish","bash","dash","python", "rust", },
      sync_install = false,
      highlight = { enable = true },
      indent = { enable = true },
    },
    opts_extend = { "ensure_installed" },
    lazy = false,
    build = ':TSUpdate'
}
