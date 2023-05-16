vim.cmd.colorscheme('onedark');

--[[
local status_ok, colorscheme = pcall(vim.cmd, 'colorscheme onedark')
if not status_ok then
  vim.notify("colorscheme onedark not found")
  return
end
]]
require('onedark').setup({
  style = 'deep',
  transparent = true,
  term_colors = true,
})
