local M = {}

M.sudo_save_file = function()
	local filepath = vim.fn.expand("%")
	if #filepath == 0 then
		vim.api.nvim_err_writeln("E32: No file name")
		return
	end

	local tmpfile = vim.fn.tempname()

	-- Schreiben Sie den Inhalt der aktuellen Datei in eine temporäre Datei
	vim.api.nvim_command("write " .. tmpfile)

	-- Verwenden Sie sudo, um die temporäre Datei in die ursprüngliche Datei zu kopieren
	local cmd =
		string.format("sudo dd if=%s of=%s bs=1048576", vim.fn.shellescape(tmpfile), vim.fn.shellescape(filepath))
	local success = M.sudo_exec(cmd)

	-- Löschen Sie die temporäre Datei
	vim.fn.delete(tmpfile)

	if success then
		-- Aktualisieren Sie die Ansicht, um die Änderungen anzuzeigen
		vim.cmd("checktime")
	else
		-- Drucken Sie eine Fehlermeldung, wenn etwas schief geht
		vim.api.nvim_err_writeln("Failed to save file with sudo")
	end
end

M.sudo_exec = function(cmd)
	vim.fn.inputsave()
	local password = vim.fn.inputsecret("Password: ")
	vim.fn.inputrestore()

	if not password or #password == 0 then
		vim.api.nvim_err_writeln("Invalid password, sudo aborted")
		return false
	end

	local out = vim.fn.system(string.format("sudo -p '' -S %s", cmd), password)

	return vim.v.shell_error == 0
end

vim.keymap.set("n", "<leader>f", function()
	local first_line = vim.fn.getline(1)
	local branch_name = first_line:match("'(.-)'")
	if branch_name then
		local finish_text = "finish " .. branch_name .. "\n"
		vim.fn.setreg("+", finish_text)
		print("✔ Copied: '" .. finish_text .. "' to clipboard")
	else
		print("❌ No branch name found")
	end
end, { desc = "Copy 'finish <branch-name>' to clipboard" })

local function get_repo_url()
  local file_dir = vim.fn.expand("%:p:h")
  local git_cmd = string.format('git -C %q config --get remote.origin.url', file_dir)
  local remote_url = vim.fn.systemlist(git_cmd)[1]

  if not remote_url or remote_url == "" then
    vim.notify("No Git remote URL found!", vim.log.levels.ERROR)
    return nil
  end

  -- Convert SSH to HTTPS
  local url = remote_url
  url = url:gsub("^git@([^:]+):", "https://%1/")
  url = url:gsub("%.git$", "")
  return url
end

local function copy_repo_url()
  local url = get_repo_url()
  if url then
    vim.fn.setreg('+', url)
    vim.notify("📋 Copied repo URL to clipboard:\n" .. url)
  end
end

local function open_repo_in_browser()
  local url = get_repo_url()
  if url then
    local opener = vim.fn.has("mac") == 1 and "open"
                or vim.fn.has("win32") == 1 and "start"
                or "xdg-open"
    vim.fn.jobstart({ opener, url }, { detach = true })
    vim.notify("🌐 Opened repo URL in browser:\n" .. url)
  end
end

-- Keymaps
vim.keymap.set("n", "<leader>gY", copy_repo_url, { desc = "Copy Git repo URL" })
vim.keymap.set("n", "<leader>gB", open_repo_in_browser, { desc = "Open Git repo in browser" })


return k
