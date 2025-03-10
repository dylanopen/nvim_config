mark = require("harpoon.mark")
ui = require("harpoon.ui")

vim.keymap.set("n", "<leader>l", mark.add_file)
vim.keymap.set("n", "<leader>h", ui.toggle_quick_menu)
vim.keymap.set("n", "<leader>[", ui.nav_prev)
vim.keymap.set("n", "<leader>]", ui.nav_next)

vim.keymap.set("n", "<M-1>", function() ui.nav_file(1) end)
vim.keymap.set("n", "<M-2>", function() ui.nav_file(2) end)
vim.keymap.set("n", "<M-3>", function() ui.nav_file(3) end)
vim.keymap.set("n", "<M-4>", function() ui.nav_file(4) end)
vim.keymap.set("n", "<M-5>", function() ui.nav_file(5) end)
vim.keymap.set("n", "<M-6>", function() ui.nav_file(6) end)
vim.keymap.set("n", "<M-7>", function() ui.nav_file(7) end)
vim.keymap.set("n", "<M-8>", function() ui.nav_file(8) end)
vim.keymap.set("n", "<M-9>", function() ui.nav_file(9) end)
vim.keymap.set("n", "<M-0>", function() ui.nav_file(10) end)

