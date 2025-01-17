return	{
  'nvim-telescope/telescope.nvim', tag = '0.1.8',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local builtin = require('telescope.builtin')
		require('telescope').setup({
			pickers = {
				find_files = {
    			find_command = { "fd", "--hidden", "--glob", "" },
  			},
			}
		})
    vim.keymap.set('n', '<leader>p', builtin.find_files, {})
    vim.keymap.set('n', '<leader>s', function()
	    builtin.grep_string({ search = vim.fn.input("Grep > ") });
    end) 
  end
}
