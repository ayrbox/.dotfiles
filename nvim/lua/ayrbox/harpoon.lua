
local keymap = vim.keymap.set

local harpoonUI = require("harpoon.ui")

-- Harpoon
keymap("n", "<leader>m", function() 
  require("harpoon.mark").add_file()
end)

keymap("n", "<leader>\\", function() 
  harpoonUI.toggle_quick_menu()
end)

-- Harpoon Navigation
keymap("n", "<leader>n", function() harpoonUI.nav_next() end, opts)
keymap("n", "<leader>p", function() harpoonUI.nav_prev() end, opts)


keymap("n", "<leader>1", function() harpoonUI.nav_file(1) end, opts)
keymap("n", "<leader>2", function() harpoonUI.nav_file(2) end, opts)
keymap("n", "<leader>3", function() harpoonUI.nav_file(3) end, opts)
keymap("n", "<leader>4", function() harpoonUI.nav_file(4) end, opts)
keymap("n", "<leader>5", function() harpoonUI.nav_file(5) end, opts)
keymap("n", "<leader>6", function() harpoonUI.nav_file(6) end, opts)
keymap("n", "<leader>7", function() harpoonUI.nav_file(7) end, opts)
keymap("n", "<leader>8", function() harpoonUI.nav_file(8) end, opts)
keymap("n", "<leader>9", function() harpoonUI.nav_file(9) end, opts)
keymap("n", "<leader>0", function() harpoonUI.nav_file(0) end, opts)
