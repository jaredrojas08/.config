return {
	"3rd/image.nvim",
	build = false,
	opts = {
		backend = "kitty",
		integrations = {
			markdown = { enabled = true },
			neorg = { enabled = false },
		},
		max_width_window_percentage = 50,
		max_height_window_percentage = 40,
	},
}
