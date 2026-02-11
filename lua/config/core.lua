vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.o.ignorecase = true -- searching case insensitive
vim.o.smartcase = true -- except patterns contain uppercase
vim.o.encoding = "utf-8"
vim.o.fileencoding = "utf-8"
-- visual
vim.o.number = true
vim.o.relativenumber = true

vim.o.cc = "120"
vim.o.cursorline = true
vim.o.cursorcolumn = true

vim.cmd("syntax on")

vim.o.termguicolors = true
-- highlight all trailing spaces
-- indentation
vim.o.expandtab = true -- <Tab> expands spaces instead of \t
vim.o.tabstop = 4 -- spaces per <Tab>
vim.o.shiftwidth = 4 --spaces per indentation level
vim.o.smartindent = false -- indentation is aware of newline insert
vim.o.splitright = true
vim.o.clipboard = "unnamedplus"
