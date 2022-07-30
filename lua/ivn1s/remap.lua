local nnoremap = require("ivn1s.keymap").nnoremap
local inoremap = require("ivn1s.keymap").inoremap
local vnoremap = require("ivn1s.keymap").vnoremap

nnoremap(" r", "<cmd>Ex<CR>")
inoremap("jj", "<Esc>")
nnoremap(" f", "<cmd>Telescope find_files<CR>")
nnoremap(" p", "<cmd>Telescope buffers<CR>")
nnoremap(" t", "<cmd>Telescope<CR>")
nnoremap("<c-f>", "<cmd>Telescope live_grep<CR>")

-- Move between panes
nnoremap("<c-j>", "<cmd>wincmd j<CR>")
nnoremap("<c-k>", "<cmd>wincmd k<CR>")
nnoremap("<c-h>", "<cmd>wincmd h<CR>")
nnoremap("<c-l>", "<cmd>wincmd l<CR>")

-- Stay in visual mode when indenting
vnoremap("<", "<gv")
vnoremap(">", ">gv")

