vim.g.netrw_banner = 0

vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.smartindent = true
vim.opt.wrap = false
vim.opt.laststatus = 0
vim.opt.clipboard = "unnamedplus"
vim.opt.swapfile = false

vim.cmd "set wildignore+=*/tmp/**.so,*.swp,*.zip,*.class,*.pyc,*.db,*.sqlite,*.dex,node_modules/**,.shadow-cljs/**,.clj-kondo/**,target/**"



-- local options = {
--     nu = true,
--     relativenumber = true,
--     tabstop = 4,
--     softtabstop = 4,
--     shiftwidth = 4,
--     expandtab = true,
--     hlsearch = false,
--     incsearch = true,
--     smartindent = true,
--     wrap = false,
--     laststatus = 0,
--     clipboard = "unnamedplus",
--     swapfile = false
-- }

-- for k, v in pairs(options) do
--     vim.opt[k] = v
-- end
