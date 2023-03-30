local o = vim.opt

o.splitbelow = true -- Creating vertical windows
o.splitright = true -- Creating horizontal windows
o.timeoutlen = 250 -- Wait for a mapped sequence
o.updatetime = 300 -- For CursorHold events
o.clipboard = "unnamedplus" -- Use system clipboard
o.swapfile = false -- Disable creating swapfiles

-- Tab --
o.tabstop = 2
o.softtabstop = 2
o.shiftwidth = 2 -- The number of spaces inserted for each indentation
o.expandtab = true

o.number = true -- Show line number
o.relativenumber = true

-- Ignore case in general, but become case-sensitive when uppercase is present
o.ignorecase = true
o.smartcase = true

-- File and script encoding settings for vim
o.fileencoding = "utf-8"
o.fileencodings = "ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1"

-- Wrap long lines with custom character
o.linebreak = true
o.showbreak = "↪"
o.scrolloff = 8 -- Minimum lines to keep above and below cursor when scrolling


o.undofile = true -- Persistent undo
o.completeopt:append({ "menuone", "noselect" }) -- Completion behaviour
o.smartindent = true
--o.cursorline = true -- Hightlight the current line
o.signcolumn = "yes" -- Always show the sign column, otherwise it would shift the text each time
o.termguicolors = true

-- Fold
o.foldmethod = "expr"
o.foldexpr = "nvim_treesitter#foldexpr()"
o.foldlevel = 99

--others, settings i almost forgot to port
o.ttyfast=true
o.showmatch=true
o.hlsearch=true
o.incsearch=true
o.backupdir="/home/zura/.cache/vim"
o.undodir="/home/zura/.cache/nvim/undo"
o.wildmode={"longest", "list"}
o.syntax="on" or "enable"
o.mouse='a'
