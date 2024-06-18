-- Autocommands for filetype-specific settings and general behavior
vim.api.nvim_create_autocmd({ "BufEnter", "BufRead", "BufNewFile" }, {
  pattern = { "*.sh", "*.py" },
  callback = function()
    vim.opt_local.tabstop = 4
    vim.opt_local.softtabstop = 4
    vim.opt_local.shiftwidth = 4
  end,
  desc = "Set tab/indentation for shell and python scripts",
})

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = "docker-compose.yml.j2",
  command = "setfiletype yaml",
  desc = "Set filetype for Jinja2 Docker Compose files to yaml",
})

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = { "*/roles/*.yml", "playbook-install-container.yml" },
  command = "setfiletype yaml.ansible",
  desc = "Set filetype for Ansible role and playbook YAML files",
})

vim.api.nvim_create_autocmd("BufWritePre", {
  group = vim.api.nvim_create_augroup("trim_whitespace", { clear = true }),
  pattern = "*",
  command = [[%s/\s\+$//e]],
  desc = "Trim trailing whitespace on save",
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "qf",
  command = "setlocal modifiable",
  desc = "Make quickfix list modifiable",
})

vim.api.nvim_create_autocmd("TextYankPost", {
  group = vim.api.nvim_create_augroup("highlight_yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
  desc = "Highlight text on yank",
})