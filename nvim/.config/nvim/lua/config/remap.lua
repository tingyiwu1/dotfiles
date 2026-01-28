vim.g.mapleader = " "

local map = vim.keymap.set

map("n", "<leader>w", "<Cmd>write<CR>")
map("n", "<leader>q", "<Cmd>:quit<CR>")
map("n", "<leader>Q", "<Cmd>:wqa<CR>")
map("n", "<leader>x", "<Cmd>!chmod +x %<CR>", { silent = true })

map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

map("n", "<C-]>", "<C-]>zt")

-- Toggle relative line numbers
map("n", "<leader>ln", ":set relativenumber!<CR>")

map("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
map("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
map("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
map("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- Move lines up/down
map("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

-- Yank to system clipboard
map({ "n", "v" }, "<leader>y", [["+y]])
map("n", "<leader>Y", [["+Y]])

-- Delete without yank
map({ "n", "v" }, "<leader>d", '"_d')

-- Telescope
map("n", "<leader>sf", require("telescope.builtin").find_files)
map("n", "<leader>SF", require("telescope.builtin").live_grep)
map("n", "<leader>sc", function()
  require("telescope.builtin").find_files({
    cwd = vim.fn.stdpath("config"),
  })
end)
map("n", "<leader>sk", require("telescope.builtin").keymaps)
map("n", "<leader>sr", require("telescope.builtin").lsp_references)
map("n", "<leader>sh", require("telescope.builtin").help_tags)
map("n", "<leader>sm", function()
  require("telescope.builtin").man_pages({
    -- apropos is slow, so use cached version
    man_cmd = { vim.fn.stdpath("config") .. "/scripts/apropos_cached.sh" },
  })
end)
map("n", "<leader>sb", function()
  require("telescope.builtin").buffers({
    sort_mru = true,
  })
end)

-- LSP
map("n", "<leader>lr", ":lsp restart<CR>", { desc = "[L]SP [R]estart" })
map("n", "<leader>li", ":checkhealth vim.lsp<CR>", { desc = "[L]SP [I]nfo" })

-- Git
map("n", "<leader>gs", ":vert Git<CR>")
map("n", "<leader>gd", ":Gvdiffsplit<CR>")
map("n", "<leader>gm", ":Gvdiffsplit!<CR>")
map("n", "<leader>gb", ":Git blame<CR>")

-- Harpoon
map("n", "<leader>ha", function()
  require("harpoon"):list():add()
end)
map("n", "<leader>hA", function()
  require("harpoon"):list():prepend()
end)
map("n", "<leader>hl", function()
  require("harpoon").ui:toggle_quick_menu(require("harpoon"):list())
end)

for _, idx in ipairs({ 1, 2, 3, 4, 5 }) do
  map("n", string.format("<leader>%d", idx), function()
    require("harpoon"):list():select(idx)
  end)
end
