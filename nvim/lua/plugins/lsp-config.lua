return {
	{
		"mason-org/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"mason-org/mason-lspconfig.nvim",
		opts = {},
		dependencies = {
			{ "mason-org/mason.nvim", opts = {} },
			"neovim/nvim-lspconfig",
		},
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "pyright", "omnisharp", "clangd", "ocamllsp", "asm-lsp", "jdtls" },
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			vim.lsp.config("*", { capabilities = capabilities })
			vim.lsp.enable("lua_ls", "pyright", "omnisharp", "clangd", "ocamllsp", "asm-lsp", "jdtls")

			vim.diagnostic.config({
				virtual_text = true,
				signs = true,
				underline = true,
			})

			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
			vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
		end,
	},

	{
		{
			"scalameta/nvim-metals",
			dependencies = { "nvim-lua/plenary.nvim", "hrsh7th/cmp-nvim-lsp" },
			ft = { "scala", "sbt" },
			opts = function()
				local metals_config = require("metals").bare_config()
				metals_config.capabilities = require("cmp_nvim_lsp").default_capabilities()
				metals_config.settings = {
					showImplicitArguments = true,
					excludedPackages = { "akka.actor.typed.javadsl", "com.github.swagger.akka.javadsl" },
				}
				return metals_config
			end,
			config = function(self, metals_config)
				local nvim_metals_group = vim.api.nvim_create_augroup("nvim-metals", { clear = true })
				vim.api.nvim_create_autocmd("FileType", {
					pattern = { "scala", "sbt" },
					callback = function()
						require("metals").initialize_or_attach(metals_config)
					end,
					group = nvim_metals_group,
				})
			end,
		},
	},
}
