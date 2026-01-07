return {
  "stevearc/conform.nvim",
  opts = {},
  config = function()
    require("conform").setup({
      format_on_save = function(bufnr)
        -- Disable formatting for fugitive buffers
        if vim.api.nvim_buf_get_name(bufnr):match("fugitive://") then
          return
        end
        return {
          timeout_ms = 5000,
          lsp_format = "fallback",
        }
      end,
      formatters_by_ft = {
        c = { "clang-format" },
        cpp = { "clang-format" },
        lua = { "stylua" },
        go = { "gofmt" },
        javascript = { "prettier" },
        typescript = { "prettier" },
        javascriptreact = { "prettier" },
        typescriptreact = { "prettier" },
      },
      formatters = {
        ["clang-format"] = {
          prepend_args = { "-style=file", "-fallback-style=LLVM" },
        },
        prettier = {
          prepend_args = function()
            return { "--config-precedence", "file-override" }
          end,
        },
      },
    })
  end,
}
