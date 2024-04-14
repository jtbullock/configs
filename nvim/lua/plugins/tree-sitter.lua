return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		local config = require("nvim-treesitter.configs")
		config.setup({
			ensure_installed = {"lua", "javascript"},
			highlight = { enable = true },
			indent = { enable = false }
		})

		vim.keymap.set('n', '<C-e>', ':Neotree filesystem reveal left<CR>', {})
	end
}
