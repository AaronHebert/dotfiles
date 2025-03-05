return {
  "vimwiki/vimwiki",
  event = "BufEnter *.md",
  keys = { "<leader>ww", "<leader>wt" },

	init = function()
		vim.g.vimwiki_folding = ""
		vim.g.vimwiki_list = {
      {
        path = "~/vimwiki/personal/",
        syntax = "markdown",
        ext = "md",
      },
      {
        path = "~/vimwiki/ted/",
        syntax = "markdown",
        ext = "md",
      },
    }
  
	vim.g.vimwiki_ext2syntax = {
		[".md"] = "markdown",
		[".markdown"] = "markdown",
		[".mdown"] = "markdown",
	}
	end,
}
