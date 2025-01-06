local lspconfig = require("lspconfig")

lspconfig.html.setup({
  capabilities = require("cmp_nvim_lsp").default_capabilities(), 
  settings = {
    html = {
      validate = true,
    },
  },
  filetypes = { "html", "htm", "xhtml", "handlebars", "erb", "liquid" }, -- Для работы с несколькими типами файлов
})
