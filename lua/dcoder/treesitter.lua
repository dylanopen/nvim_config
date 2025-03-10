ts = require("nvim-treesitter")
ts.setup({})

vim.cmd("TSEnable incremental_selection")
vim.cmd("TSEnable autotag")
vim.cmd("TSEnable indent")
vim.cmd("TSEnable highlight")

