return {
  "stevearc/conform.nvim",
  opts = {},
  config = function()
    require("conform").setup({
      format_on_save = function(bufnr)
        local buftype = vim.api.nvim_buf_get_option(bufnr, "buftype")
        if buftype == "nofile" then
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
      },
      formatters = {
        ["clang-format"] = {
          prepend_args = { "-style=file", "-fallback-style=LLVM" },
        },
      },
    })
  end,
}
