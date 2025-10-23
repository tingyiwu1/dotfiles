require("config.lazy")
require("config.set")
require("config.remap")

-- return to absolute line numbering when cursor leaves buffer/window/split augroup numbertoggle
vim.api.nvim_create_augroup("numbertoggle", { clear = true })
vim.api.nvim_create_autocmd({ "BufEnter", "FocusGained", "WinEnter" }, {
  group = "numbertoggle",
  -- command = "set relativenumber",
  callback = function()
    local exclude_buftypes = { "help", "nofile", "nowrite" }
    if not vim.tbl_contains(exclude_buftypes, vim.bo.buftype) then
      vim.opt.relativenumber = true
    end
  end,
})
vim.api.nvim_create_autocmd({ "BufLeave", "FocusLost", "WinLeave" }, {
  group = "numbertoggle",
  -- command = "set norelativenumber",
  callback = function()
    local exclude_buftypes = { "help", "nofile", "nowrite" }
    if not vim.tbl_contains(exclude_buftypes, vim.bo.buftype) then
      vim.opt.relativenumber = false
    end
  end,
})

-- run telescope find if opened in directory; doesn't play nicely with sessions and argc() == 0 only works for `nvim`, not `nvim .`
-- vim.api.nvim_create_autocmd("VimEnter", {
--   callback = function()
--     if vim.fn.argc() == 0 then
--       vim.defer_fn(require("telescope.builtin").find_files, 0)
--     end
--   end,
-- })

vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

vim.diagnostic.config({
  update_in_insert = true,
  virtual_text = true,
  float = {
    focusable = false,
    style = "minimal",
    border = "rounded",
    source = "if_many",
    header = "",
    prefix = "",
  },
})
