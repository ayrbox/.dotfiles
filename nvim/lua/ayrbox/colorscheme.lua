function SetColorScheme()
  vim.cmd.colorscheme('onedark');
  require('onedark').setup({
    style = 'deep',
    transparent = true,
    term_colors = true,
  })

  vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

SetColorScheme()
