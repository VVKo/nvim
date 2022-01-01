-- Visual
vim.o.conceallevel       = 0                             -- Don't hide quotes in markdown
vim.o.cmdheight          = 1
vim.o.pumheight          = 10
vim.o.showmode           = false
vim.o.showtabline        = 2                             -- Always show tabline
vim.o.title              = true
vim.o.termguicolors      = true                          -- Use true colors, required for some plugins
vim.wo.number            = true
vim.wo.relativenumber    = true
vim.wo.signcolumn        = 'yes'
vim.wo.cursorline        = true

-- Behaviour
vim.o.hlsearch           = false
vim.o.ignorecase         = true                          -- Ignore case when using lowercase in search
vim.o.smartcase          = true                          -- But don't ignore it when using upper case
vim.o.smarttab           = true
vim.o.smartindent        = true
vim.o.expandtab          = true                          -- Convert tabs to spaces.
vim.o.tabstop            = 2
vim.o.softtabstop        = 2
vim.o.shiftwidth         = 2
vim.o.splitbelow         = true
vim.o.splitright         = true
vim.o.scrolloff          = 5                            -- Minimum offset in lines to screen borders
vim.o.sidescrolloff      = 8
vim.o.mouse              = 'a'
--vim.opt.backup = false
--vim.opt.expandtab = true
--vim.opt.shiftwidth = 2
--vim.opt.softtabstop = 2
--vim.opt.number = true
--vim.opt.swapfile = false
--vim.opt.relativenumber = true
vim.opt.list = true                                     -- Show some invisible characters
vim.opt.listchars = { tab = " ", trail = "·" }

vim.cmd [[colorscheme molokai]]
vim.opt.shortmess:append "c"

vim.diagnostic.config {
  virtual_text = false,
  underline = false,            -- Keep error underline
  signs = true,                -- Keep gutter signs
}

