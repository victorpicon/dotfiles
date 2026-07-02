return {
  {
    "AlphaTechnolog/pywal.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      local pywal = require("pywal")
      pywal.setup()
      vim.cmd("colorscheme pywal")
    end,
  },
  -- Desative o theme padrão do LazyVim (tokyonight) para não conflitar
  { "folke/tokyonight.nvim", enabled = false },
}