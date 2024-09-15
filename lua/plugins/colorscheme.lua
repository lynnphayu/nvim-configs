 return {
  -- "catppuccin/nvim",
  "navarasu/onedark.nvim",
  lazy = false ,
  name = "colorscheme",
  priority = 1000,
  config = function()
    require('onedark').setup {
      style = 'warmer'
    }
    require('onedark').load()
    -- vim.cmd.colorscheme "onedark"
  end
}
