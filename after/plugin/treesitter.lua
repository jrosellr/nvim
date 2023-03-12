local treesitter_ok, treesitter_configs = pcall(require, "nvim-treesitter.configs")
if not treesitter_ok then
  return
end

treesitter_configs.setup({
  ensure_installed = {
    "c",
    "lua",
    "vim",
    "help",
    "query",
    "go"
  },
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
})
