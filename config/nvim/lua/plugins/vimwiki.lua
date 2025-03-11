return {
  "vimwiki/vimwiki",
  event = "BufEnter *.markdown",
  keys = { "<leader>ww", "<leader>wt" },

	init = function()
		vim.g.vimwiki_folding = ""
		vim.g.vimwiki_list = {
      {
        path = "~/vimwiki/ted/",
        syntax = "markdown",
        ext = "markdown",
      },
      {
        path = "~/vimwiki/personal/",
        syntax = "markdown",
        ext = "markdown",
      },
    }
  
	end,
}
