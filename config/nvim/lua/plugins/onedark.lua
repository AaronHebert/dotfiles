return {
  "joshdick/onedark.vim",
  priority = 1000, -- Ensure it loads first
  config = function()
    vim.cmd.colorscheme "onedark"
  end
}

