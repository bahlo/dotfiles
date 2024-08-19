return {
    "nvim-treesitter/nvim-treesitter",
    config = function()
        require("nvim-treesitter.configs").setup({
            ensure_installed = { "lua", "markdown", "go", "rust", "typescript", "tsx" },
            auto_install = true,
        })
    end,
    build = ":TSUpdate",
    opts = {},
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects"
    }
}
