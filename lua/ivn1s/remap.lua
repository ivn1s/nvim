local nnoremap = require("ivn1s.keymap").nnoremap
local inoremap = require("ivn1s.keymap").inoremap
local vnoremap = require("ivn1s.keymap").vnoremap

vim.g.mapleader = " "
vim.g.maplocalleader = " "

inoremap("jj", "<Esc>")

nnoremap("<leader>e", "<cmd>Ex<CR>")
nnoremap("<leader>f", "<cmd>Telescope find_files<CR>")
nnoremap("<leader>g", "<cmd>Telescope git_files<CR>")
nnoremap("<leader>p", "<cmd>Telescope buffers<CR>")
nnoremap("<leader>t", "<cmd>Telescope<CR>")
nnoremap("<c-f>", "<cmd>Telescope live_grep<CR>")

-- Move between panes
nnoremap("<c-j>", "<cmd>wincmd j<CR>")
nnoremap("<c-k>", "<cmd>wincmd k<CR>")
nnoremap("<c-h>", "<cmd>wincmd h<CR>")
nnoremap("<c-l>", "<cmd>wincmd l<CR>")

-- Stay in visual mode when indenting
vnoremap("<", "<gv")
vnoremap(">", ">gv")

-- Follow cursor
nnoremap("n","nzzzv")
nnoremap("N","Nzzzv")
nnoremap("J","mzJ`z")
