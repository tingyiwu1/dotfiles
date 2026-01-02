return {
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    build = ":TSUpdate",
    lazy = false,
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      {
        "nvim-treesitter/nvim-treesitter-context",
        config = function()
          require("treesitter-context").setup({
            multiwindow = true,
          })
        end,
      },
    },
    config = function()
      require("nvim-treesitter.configs").setup({
        modules = {},
        -- a list of parser names, or "all" (the listed parsers must always be installed)
        ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline", "go", "rust" },

        ignore_install = { "latex" },
        -- install parsers synchronously (only applied to `ensure_installed`)
        sync_install = false,

        -- automatically install missing parsers when entering buffer
        -- recommendation: set to false if you don't have `tree-sitter` cli installed locally
        auto_install = true,

        highlight = {
          enable = true,

          -- or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
          disable = function(lang, buf)
            local disable = { "latex" }
            if vim.tbl_contains(disable, lang) then
              return true
            end
            local max_filesize = 100 * 1024 -- 100 kb
            local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
            if ok and stats and stats.size > max_filesize then
              return true
            end
          end,

          -- setting this to true will run `:h syntax` and tree-sitter at the same time.
          -- set this to `true` if you depend on 'syntax' being enabled (like for indentation).
          -- using this option may slow down your editor, and you may see some duplicate highlights.
          -- instead of true it can also be a list of languages
          additional_vim_regex_highlighting = { "latex" },
        },
        textobjects = {
          select = {
            enable = true,
            lookahead = true,
            keymaps = {
              -- You can use the capture groups defined in textobjects.scm
              ["af"] = "@function.outer",
              ["if"] = "@function.inner",
              ["ac"] = "@class.outer",
              ["ic"] = "@class.inner",
            },
            -- You can choose the select mode (default is charwise 'v')
            --
            -- Can also be a function which gets passed a table with the keys
            -- * query_string: eg '@function.inner'
            -- * method: eg 'v' or 'o'
            -- and should return the mode ('v', 'V', or '<c-v>') or a table
            -- mapping query_strings to modes.
            selection_modes = {
              ["@parameter.outer"] = "v", -- charwise
              ["@function.outer"] = "V", -- linewise
              ["@class.outer"] = "V", -- blockwise
            },
          },
          move = {
            enable = true,
            set_jumps = true, -- whether to set jumps in the jumplist
            goto_next_start = {
              -- ["]m"] = "@function.outer",
              ["]]"] = "@class.inner",
            },
            goto_next_end = {
              ["]M"] = "@function.outer",
              ["]["] = "@class.outer",
            },
            goto_previous_start = {
              -- ["[m"] = "@function.outer",
              ["[["] = "@class.inner",
            },
            goto_previous_end = {
              ["[M"] = "@function.outer",
              ["[]"] = "@class.outer",
            },
          },
        },
      })
      local map = vim.keymap.set
      map("n", "]m", function()
        require("nvim-treesitter.textobjects.move").goto_next_start("@function.outer")
        vim.cmd("normal! zt")
      end)
      map("n", "[m", function()
        require("nvim-treesitter.textobjects.move").goto_previous_start("@function.outer")
        vim.cmd("normal! zt")
      end)
    end,
  },
}
