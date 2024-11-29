return {
	"smjonas/inc-rename.nvim",
	dependencies = {
		"ThePrimeagen/refactoring.nvim",
	},
	cmd = "IncRename",
	keys = {
		{
			"<leader>rn",
			function()
				return ":IncRename" .. vim.fn.expand("<cword>")
			end,
			desc = "Incremental refactor",
			mode = "n",
			noremap = true,
			expr = true,
		},
	},
	config = true,
}
