return {
  "folke/sidekick.nvim",
  dependencies = {
    {
      "zbirenbaum/copilot.lua",
      cmd = "Copilot",
      event = "InsertEnter",
      config = function()
        require("copilot").setup({
          suggestion = {
            auto_trigger = true,
            debounce = 50,
            enabled = true,
            hide_during_completion = true,
            keymap = {
              accept = false,
            },
          },
          panel = { enabled = false },
        })
        -- Insert mode tab completion + fallback
        vim.keymap.set("i", "<Tab>", function()
          if require("copilot.suggestion").is_visible() then
            require("copilot.suggestion").accept()
            return
          else
            vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Tab>", true, false, true), "n", false)
          end
        end, {
          silent = true,
        })
      end,
    },
  },
  lazy = false,
  opts = {
    nes = {
      enabled = true,
    },
    cli = {
      mux = {
        enabled = true,
        backend = "tmux",
      },
      win = {
        keys = {
          prompt = false, -- telescope picker for prompts broken
        },
      },
      picker = "telescope",
    },
  },
  keys = {
    {
      "<M-.>",
      function()
        require("sidekick.cli").toggle()
      end,
      desc = "Sidekick Toggle",
      mode = { "n", "t", "i", "x" },
    },
    {
      "<leader>at",
      function()
        require("sidekick.cli").send({ msg = "{this}" })
      end,
      mode = { "x", "n" },
      desc = "Send This",
    },
    {
      "<leader>af",
      function()
        require("sidekick.cli").send({ msg = "{file}" })
      end,
      desc = "Send File",
    },
    {
      "<leader>av",
      function()
        require("sidekick.cli").send({ msg = "{selection}" })
      end,
      mode = { "x" },
      desc = "Send Visual Selection",
    },
    {
      "<tab>",
      -- Normal mode tab NES + fallback
      function()
        if require("sidekick").nes_jump_or_apply() then
          vim.notify("jumped or applied")
          return
        end

        vim.notify("sending normal tab")
        return "<tab>"
      end,
      mode = "n",
      expr = true,
      desc = "Goto/Apply Next Edit Suggestion",
    },
  },
}
