-- General Neovim UI and behavior settings
vim.opt.clipboard:append("unnamedplus") -- Use system clipboard as default register
vim.opt.scrolloff = 8 -- Keep 8 lines above/below cursor when scrolling
vim.opt.signcolumn = "yes" -- Always show the sign column for LSP, Git, etc.
vim.opt.isfname:append("@-@") -- Allow '@' and '-' in filenames
vim.opt.updatetime = 50 -- Lower value for faster CursorHold events (e.g., auto-completion)
vim.opt.termguicolors = true -- Enable true colors in the terminal
vim.opt.nu = true -- Show absolute line numbers
vim.opt.relativenumber = true -- Show relative line numbers
vim.wo.number = true -- Ensure absolute line number is also shown (for consistency with relative numbers)

-- Tabs, indentation, and text formatting
vim.opt.expandtab = true -- Use spaces instead of tabs
vim.opt.tabstop = 2 -- 1 tab equals 2 spaces
vim.opt.softtabstop = 2 -- Backspace and arrow keys move by 2 spaces
vim.opt.shiftwidth = 2 -- Indent by 2 spaces
vim.opt.textwidth = 0 -- Disable automatic line wrapping
vim.opt.wrap = true -- Soft wrap lines visually at window edge
vim.opt.colorcolumn = "80" -- Highlight column 80 for line length awareness
vim.opt.smartindent = true -- Smart auto-indenting
vim.opt.list = true -- Show invisible characters
vim.opt.spell = true -- Enable spell checking
vim.opt.spelllang = { 'de', 'en' } -- Set spellcheck languages to German and English

-- Search settings
vim.opt.ignorecase = true -- Ignore case when searching
vim.opt.smartcase = true -- Case-sensitive search if uppercase characters are used in pattern
-- vim.opt.hlsearch = true -- Highlight all search matches
-- vim.opt.incsearch = true -- Highlight as you type

-- Undo history and swap file settings
vim.opt.swapfile = false -- Disable swap files
vim.opt.backup = false -- Disable backup files
vim.opt.undodir = vim.fn.stdpath("cache") .. "/undo" -- Set undo directory to a standard cache path
vim.opt.undofile = true -- Enable persistent undo history
