local telescope_ok, telescope_builtin = pcall(require, "telescope.builtin")
if not telescope_ok then
  return
end

local map_options = {
  noremap = true,
  silent = true
}

vim.keymap.set("n", "<leader>ff", telescope_builtin.find_files, map_options)
vim.keymap.set("n", "<C-p>", telescope_builtin.git_files, map_options)
vim.keymap.set("n", "<leader>ps", function()
  telescope_builtin.grep_string({ search = vim.fn.input("search: ") })
end, map_options)
