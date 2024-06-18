local utils = require("utils")

-- Keymaps
vim.g.mapleader = " "

vim.keymap.set("n", "<leader>h", ":nohlsearch<CR>", { desc = "Clear search highlights" })

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]], { desc = "Paste without overwriting register" })

vim.fn.setenv("FZF_DEFAULT_COMMAND", 'rg --files --hidden --no-ignore-vcs --glob "!.git"')

-- Remap <C-d> to scroll down half a page
-- neo-tree overwrite it
vim.api.nvim_set_keymap("n", "<C-d>", "<C-d>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Scroll down half page and center" })

-- Remap <C-u> to scroll up half a page
-- neo-tree overwrite it
vim.api.nvim_set_keymap("n", "<C-u>", "<C-u>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Scroll up half page and center" })

vim.keymap.set("n", "n", "nzzzv", { desc = "Next search result (centered)" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Prev search result (centered)" })

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "Yank to system clipboard" })
vim.keymap.set("n", "<leader>Y", [["+Y]], { desc = "Yank line to system clipboard" })

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]], { desc = "Delete without yanking" })

-- This is going to get me cancelled
vim.keymap.set("i", "<C-c>", "<Esc>", { desc = "Escape insert mode" })

vim.keymap.set(
  "n",
  "<leader>s",
  [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
  { desc = "Search and replace word under cursor" }
)
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true, desc = "Make file executable" })

vim.keymap.set("n", "=", [[<cmd>vertical resize +5<cr>]], { desc = "Increase window width" })
vim.keymap.set("n", "-", [[<cmd>vertical resize -5<cr>]], { desc = "Decrease window width" })
vim.keymap.set("n", "+", [[<cmd>horizontal resize +2<cr>]], { desc = "Increase window height" })
vim.keymap.set("n", "_", [[<cmd>horizontal resize -2<cr>]], { desc = "Decrease window height" })

-- window management
vim.keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
vim.keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
vim.keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })
vim.keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })

vim.g.cheat_default_window_layout = "vertical_split"

-- Utility Keymaps
vim.keymap.set("n", "<leader>w", ":SudoSaveFile<CR>", { noremap = true, silent = true, desc = "Save with sudo" })
vim.keymap.set("n", "<leader>gY", utils.copy_repo_url, { desc = "Copy Git repo URL" })
vim.keymap.set("n", "<leader>gB", utils.open_repo_in_browser, { desc = "Open Git repo in browser" })
vim.keymap.set("n", "<leader>f", utils.copy_finish_branch, { desc = "Copy 'finish <branch-name>' to clipboard" })