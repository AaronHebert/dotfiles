return {
  {
    "nvim-treesitter/nvim-treesitter", 
    build = ":TSUpdate",
    config = function () 
      local config = require("nvim-treesitter.configs")

      config.setup({
        ensure_installed = { "ruby", "lua", "vim", "vimdoc", "javascript", "html" },
        sync_install = false,
        highlight = { enable = true },
        indent = { enable = true },  
        })
   	end 
  }
}
