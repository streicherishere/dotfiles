-- General settings
--
vim.opt.clipboard:append("unnamedplus") -- use system clipboard as default register

vim.opt.scrolloff = 8 -- Specifies the number of lines to keep in view above and below the cursor while scrolling.
vim.opt.signcolumn = "yes" -- Controls the display of the sign column, showing markers, error, and warning symbols.
vim.opt.isfname:append("@-@") -- Extends the list of characters considered as part of a file name. Useful when dealing with file names containing special characters like '@' and '-'.

vim.opt.updatetime = 50 -- Specifies the time in milliseconds of inactivity needed to trigger the CursorHold event. Lower values result in more responsive behavior for features like auto-completion or syntax checking.

vim.opt.termguicolors = true -- termguicolors for colorscheme

vim.opt.nu = true -- Displays line numbers in the left gutter.
vim.opt.relativenumber = true -- Displays relative line numbers in addition to absolute line numbers.
vim.wo.number = true -- Displays absolute line numbers in the left gutter.
-- vim.opt.listchars = { space = '_', tab = '>-', trail = '~' }

-- tabs & indentation
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.textwidth = 80
vim.opt.wrap = false
vim.opt.colorcolumn = "80"
vim.opt.smartindent = true

-- for filetypes
vim.cmd("autocmd BufEnter,BufRead,BufNewFile *.sh setlocal tabstop=4 softtabstop=4 shiftwidth=4")
vim.cmd("autocmd BufEnter,BufRead,BufNewFile *.py setlocal tabstop=4 softtabstop=4 shiftwidth=4")
-- settings for docker-compose
vim.api.nvim_command("autocmd BufRead,BufNewFile docker-compose.yml.j2 setfiletype yaml")
-- settings for ansible
vim.api.nvim_command("autocmd BufRead,BufNewFile */roles/*.yml setfiletype yaml.ansible")
vim.api.nvim_command("autocmd BufRead,BufNewFile playbook-install-container.yml setfiletype yaml.ansible")

-- search settings
vim.opt.ignorecase = true -- ignore case when searching
vim.opt.smartcase = true -- if you include mixed case in your search, assumes you want case-sensitive
-- vim.opt.hlsearch = true
-- vim.opt.incsearch = true

-- undodir settings
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- keymaps
vim.g.mapleader = " "

vim.keymap.set("n", "<leader>h", ":nohlsearch<CR>")

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

vim.fn.setenv("FZF_DEFAULT_COMMAND", 'rg --files --hidden --no-ignore-vcs --glob "!.git"')
-- Remap <C-d> to scroll down half a page
-- neo-tree overwrite it
vim.api.nvim_set_keymap("n", "<C-d>", "<C-d>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-d>", "<C-d>zz")
-- Remap <C-u> to scroll up half a page
-- neo-tree overwrite it
vim.api.nvim_set_keymap("n", "<C-u>", "<C-u>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- This is going to get me cancelled
vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

vim.keymap.set("n", "=", [[<cmd>vertical resize +5<cr>]]) -- make the window biger vertically
vim.keymap.set("n", "-", [[<cmd>vertical resize -5<cr>]]) -- make the window smaller vertically
vim.keymap.set("n", "+", [[<cmd>horizontal resize +2<cr>]]) -- make the window bigger horizontally by pressing shift and =
vim.keymap.set("n", "_", [[<cmd>horizontal resize -2<cr>]]) -- make the window smaller horizontally by pressing shift and -

-- window management
vim.keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
vim.keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
vim.keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
vim.keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

vim.g.cheat_default_window_layout = "vertical_split"
vim.api.nvim_set_keymap("n", "<leader>c", ":Cheat<CR>", { silent = true })

-- quickfix management
vim.keymap.set("n", "]q", ":cnext<CR>", { silent = true })
vim.keymap.set("n", "[q", "::cNext<CR>", { silent = true })

-- trim_whitespace
vim.api.nvim_exec(
	[[
  augroup trim_whitespace
    autocmd!
    autocmd BufWritePre * %s/\s\+$//e
  augroup END
]],
	false
)
