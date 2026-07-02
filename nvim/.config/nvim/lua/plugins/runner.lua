return {
  "CRAG666/code_runner.nvim",
  config = function()
    require("code_runner").setup({
      -- Configurações globais do plugin
      startinsert = false,
      term = {
        position = "botright",
        size = 12,
      },
      filetype = {
        -- O segredo está aqui: usamos $projectRoot para o Maven rodar do lugar certo
        java = "cd $projectRoot && mvn spring-boot:run",
      },
    })

    -- Mantém apenas o atalho principal padrão mapeado para rodar
    vim.keymap.set("n", "<leader>r", ":RunCode<CR>", { desc = "Rodar Projeto Spring Boot", silent = true })
  end,
}
