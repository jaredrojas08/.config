return {
	"danymat/neogen",
	dependencies = { "nvim-treesitter/nvim-treesitter" },
	opts = {
		snippet_engine = "nvim",
		languages = {
			cs = { template = { annotation_convention = "xmldoc" } },
		},
	},
	keys = {
		{ "<leader>nf", function() require("neogen").generate() end, desc = "Generate doc comment" },
	},
}
