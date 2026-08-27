return {
  {
    "mason-org/mason-lspconfig.nvim",
    dependencies = {
      "saghen/blink.cmp",
      { "mason-org/mason.nvim", opts = {} },
      "neovim/nvim-lspconfig",
      {
        "folke/lazydev.nvim",
        ft = "lua", -- only load on lua files
        opts = {
          library = {
            -- See the configuration section for more details
            -- Load luvit types when the `vim.uv` word is found
            { path = "${3rd}/luv/library", words = { "vim%.uv" } },
          },
        },
      },
    },
    config = function()
      local capabilities = require("blink.cmp").get_lsp_capabilities()
      require("mason-lspconfig").setup({
        automatic_enable = {
          exclude = {
            -- "basedpyright",
          },
        },
        opts = {
          ensure_installed = { "lua_ls", "rust_analyzer" },
          capabilities = capabilities,
        },
      })

      vim.lsp.config("basedpyright", {
        -- capabilities = (function()
        --   local caps = vim.lsp.protocol.make_client_capabilities()
        --   -- make pyright not show diagnostics else we'll see duplicates from ruff
        --   caps.textDocument.publishDiagnostics.tagSupport.valueSet = { 2 }
        --   return caps
        -- end)(),
        settings = {
          basedpyright = {
            disableOrganizeImports = true,
            -- https://github.com/DetachHead/basedpyright/issues/203
            typeCheckingMode = "standard",
          },
        },
      })

      -- vim.lsp.config("pyright", {
      --   capabilities = (function()
      --     local caps = vim.lsp.protocol.make_client_capabilities()
      --     -- make pyright not show diagnostics else we'll see duplicates from ruff
      --     caps.textDocument.publishDiagnostics.tagSupport.valueSet = { 2 }
      --     return caps
      --   end)(),
      -- })
      --
      vim.lsp.config("clangd", {
        -- cmd = { "clangd", "-nocudalib" },
      })

      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("my.lsp", {}),
        callback = function(args)
          local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
          -- if client:supports_method("textDocument/implementation") then
          --   -- Create a keymap for vim.lsp.buf.implementation ...
          -- end

          -- -- Auto-format ("lint") on save.
          -- -- Usually not needed if server supports "textDocument/willSaveWaitUntil".
          -- if
          --     not client:supports_method("textDocument/willSaveWaitUntil")
          --     and client:supports_method("textDocument/formatting")
          -- then
          --   vim.keymap.set("n", "<leader>lf", function()
          --     vim.lsp.buf.format({ id = client.id })
          --   end, { desc = "[L]SP [F]ormat" })
          --
          --   -- vim.api.nvim_create_autocmd("BufWritePre", {
          --   --   group = vim.api.nvim_create_augroup("my.lsp", { clear = false }),
          --   --   buffer = args.buf,
          --   --   callback = function()
          --   --     vim.lsp.buf.format({ bufnr = args.buf, id = client.id })
          --   --   end,
          --   -- })
          -- end
        end,
      })
    end,
  },
}
