vim.cmd("colorscheme default")

local ok, gruvbox = pcall(require, "gruvbox")
if not ok then
  vim.notify("Could not load Gruvbox plugin!")
  return
end

gruvbox.setup({
  italic = false
})

local ok, _ = pcall(vim.cmd, "colorscheme gruvbox")
if not ok then
  vim.notify("Could not set Gruvbox theme!")
  return
end

