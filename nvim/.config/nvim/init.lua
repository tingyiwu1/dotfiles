if vim.g.vscode then
  print("VSCode Neovim detected")
  require("config.vscode")
else
  print("Ordinary Neovim detected")
  require("config")
end
