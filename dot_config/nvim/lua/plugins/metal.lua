-- Metal Shading Language support.
--
-- Metal is a C++14-based dialect with no maintained Treesitter grammar of its
-- own, so we reuse the `cpp` parser for highlighting, indentation and folds.
--
-- Related config lives elsewhere:
--   * filetype detection (.metal -> "metal"): lua/config/options.lua
--   * LSP (metal-lsp):                         lua/plugins/lsp.lua
return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = { ensure_installed = { "cpp" } },
    init = function()
      -- Parse `.metal` files with the C++ grammar. Runs before the plugin
      -- loads so it's registered ahead of LazyVim's FileType autocmd that
      -- starts highlighting.
      vim.treesitter.language.register("cpp", "metal")
    end,
  },
}
