return {
  "andweeb/presence.nvim",
  config = function()
    require("presence").setup({
      -- Opções de personalização
      auto_update         = true,
      neovim_image_text   = "I use arch btw", -- Texto ao passar o mouse no logo
      main_image          = "file",                   -- Pode ser "neovim" ou "file"
      editing_text        = "Suffering at %s",              -- %s é o nome do arquivo
      reading_text        = "Trying to understand %s",
      workspace_text      = "WOrking on %s",        -- %s é o nome do diretório
    })
  end
}