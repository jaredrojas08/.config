return {
	"nvimtools/none-ls.nvim",
	dependencies = { "nvimtools/none-ls-extras.nvim" },
	config = function()
		local null_ls = require("null-ls")
		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.clang_format.with({
				filetypes = { "c", "cpp", "objc", "objcpp" },
			}),
				null_ls.builtins.formatting.ocamlformat,
				null_ls.builtins.formatting.asmfmt,
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.formatting.prettier,
				null_ls.builtins.formatting.black,
				null_ls.builtins.formatting.isort,
				require("none-ls.diagnostics.eslint").with({
					condition = function(utils)
						return utils.root_has_file({
							"eslint.config.js",
							"eslint.config.mjs",
							"eslint.config.cjs",
							".eslintrc.js",
							".eslintrc.cjs",
							".eslintrc.json",
							".eslintrc.yml",
							".eslintrc.yaml",
						})
					end,
				}),
				null_ls.builtins.diagnostics.rubocop,
				null_ls.builtins.formatting.rubocop,
				null_ls.builtins.formatting.swift_format,
			},
		})

		vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
	end,
}
