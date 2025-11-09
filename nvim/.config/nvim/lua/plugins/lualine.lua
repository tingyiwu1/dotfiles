return {
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      local opts = require("lualine").get_config()

      opts.sections = opts.sections or {}
      opts.sections.lualine_c = { "filename" }
      opts.sections.lualine_x = { "encoding", "filetype" }

      -- Copilot status
      table.insert(opts.sections.lualine_c, {
        function()
          return " "
        end,
        color = function()
          local status = require("sidekick.status").get()
          if status then
            return status.kind == "Error" and "DiagnosticError" or status.busy and "DiagnosticWarn" or "Special"
          end
        end,
        cond = function()
          local status = require("sidekick.status")
          return status.get() ~= nil
        end,
      })

      -- CLI session status
      table.insert(opts.sections.lualine_x, 1, {
        function()
          local status = require("sidekick.status").cli()
          return " " .. (#status > 1 and #status or "")
        end,
        cond = function()
          return #require("sidekick.status").cli() > 0
        end,
        color = function()
          return "Special"
        end,
      })

      require("lualine").setup(opts)
    end,
  },
}
