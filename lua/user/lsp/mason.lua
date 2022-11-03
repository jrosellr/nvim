local servers = {
	"sumneko_lua",
  "gopls",
}

local settings = {
	ui = {
		border = "none",
		icons = {
			package_installed = "◍",
			package_pending = "◍",
			package_uninstalled = "◍",
		},
	},
	log_level = vim.log.levels.INFO,
	max_concurrent_installers = 4,
}

require("mason").setup(settings)
require("mason-lspconfig").setup({
	ensure_installed = servers,
	automatic_installation = true,
})

local ok, lspconfig = pcall(require, "lspconfig")
if not ok then
	return
end

local ok, handlers = pcall(require, "user.lsp.handlers")
if not ok then
	return
end

local opts = {}

for _, server in pairs(servers) do
	opts = {
		on_attach = handlers.on_attach,
		capabilities = handlers.capabilities,
	}

	server = vim.split(server, "@")[1]

	local ok, conf_opts = pcall(require, "user.lsp.settings." .. server)
	if ok then
		opts = vim.tbl_deep_extend("force", conf_opts, opts)
	end

	lspconfig[server].setup(opts)
end

