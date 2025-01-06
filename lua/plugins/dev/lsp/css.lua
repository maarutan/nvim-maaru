local lspconfig = require("lspconfig")

lspconfig.cssls.setup({
  capabilities = require("cmp_nvim_lsp").default_capabilities(),
  settings = {
    css = {
      validate = true,
    },
    scss = {
      validate = true,
    },
    less = {
      validate = true,
    },
  },
  filetypes = { "css", "scss", "less", "html", "javascriptreact", "typescriptreact" },
  root_dir = lspconfig.util.root_pattern("package.json", ".git", "node_modules"),
})

