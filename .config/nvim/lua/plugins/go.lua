return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        gopls = {
          settings = {
            gopls = {
              gofumpt = true,
              analyses = {
                unusedparams = true,
                shadow = true,
              },
              staticcheck = true,
            },
          },
        },
      },
      setup = {
        gopls = function(_, opts)
          -- La función correcta en Snacks es .on_attach (sin el .util en algunas configs)
          -- o directamente usar la API nativa de Neovim que nunca falla:
          vim.api.nvim_create_autocmd("LspAttach", {
            callback = function(args)
              local client = vim.lsp.get_client_by_id(args.data.client_id)
              if client and client.name == "gopls" then
                client.server_capabilities.documentFormattingProvider = true
              end
            end,
          })
        end,
      },
    },
  },
}
