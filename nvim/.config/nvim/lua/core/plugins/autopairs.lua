return {
	"windwp/nvim-autopairs",
	event = "InsertEnter",
	dependencies = { "hrsh7th/nvim-cmp" },
	config = function()
		require("nvim-autopairs").setup({
			disable_filetype = { "tex" },
		})
		local npairs = require("nvim-autopairs")
		local Rule = require("nvim-autopairs.rule")
	end,
}
