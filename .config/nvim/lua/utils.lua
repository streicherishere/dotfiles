local M = {}

--- Saves the current file using sudo privileges if needed.
-- This function writes the current buffer to a temporary file, then uses `sudo dd` to copy
-- it to the original file path. It handles cases where the user might not have write
-- permissions to the file, prompting for a password if necessary. After saving, it cleans
-- up the temporary file and updates Neovim's view of the file.
M.sudo_save_file = function()
	local filepath = vim.fn.expand("%")
	if #filepath == 0 then
		vim.api.nvim_err_writeln("E32: No file name")
		return
	end

	local tmpfile = vim.fn.tempname()

	-- Write the current buffer content to a temporary file
	vim.api.nvim_command("write " .. tmpfile)

	-- Internal helper to execute a sudo command with password prompt
	local function sudo_exec(cmd)
		vim.fn.inputsave()
		local password = vim.fn.inputsecret("Password: ")
		vim.fn.inputrestore()

		if not password or #password == 0 then
			vim.api.nvim_err_writeln("Invalid password, sudo aborted")
			return false
		end

		-- Execute sudo command with password provided via stdin
		local out = vim.fn.system(string.format("sudo -p '' -S %s", cmd), password)
		return vim.v.shell_error == 0
	end

	-- Use sudo to copy the temporary file to the original file path
	local cmd =
		string.format("sudo dd if=%s of=%s bs=1048576", vim.fn.shellescape(tmpfile), vim.fn.shellescape(filepath))
	local success = sudo_exec(cmd)

	-- Delete the temporary file
	vim.fn.delete(tmpfile)

	if success then
		-- Update Neovim's view to reflect external changes
		vim.cmd("checktime")
	else
		-- Print an error message if sudo save failed
		vim.api.nvim_err_writeln("Failed to save file with sudo")
	end
end

--- Retrieves the base URL of the current Git repository.
-- Converts SSH URLs to HTTPS for easier browsing.
-- @return string|nil The repository URL or nil if not found.
M.get_repo_url = function()
  local file_dir = vim.fn.expand("%:p:h")
  local git_cmd = string.format('git -C %q config --get remote.origin.url', file_dir)
  local remote_url = vim.fn.systemlist(git_cmd)[1]

  if not remote_url or remote_url == "" then
    vim.notify("No Git remote URL found!", vim.log.levels.ERROR)
    return nil
  end

  -- Convert SSH to HTTPS and remove .git suffix
  local url = remote_url
  url = url:gsub("^git@([^:]+):", "https://%1/")
  url = url:gsub("%.git$", "")
  return url
end

--- Copies the Git repository URL to the system clipboard.
M.copy_repo_url = function()
  local url = M.get_repo_url()
  if url then
    vim.fn.setreg('+', url)
    vim.notify("📋 Copied repo URL to clipboard:\n" .. url)
  end
end

--- Opens the Git repository URL in the default web browser.
M.open_repo_in_browser = function()
  local url = M.get_repo_url()
  if url then
    local opener = vim.fn.has("mac") == 1 and "open"
                or vim.fn.has("win32") == 1 and "start"
                or "xdg-open"
    vim.fn.jobstart({ opener, url }, { detach = true })
    vim.notify("🌐 Opened repo URL in browser:\n" .. url)
  end
end

--- Copies a 'finish <branch-name>' string to the clipboard.
-- The branch name is extracted from the first line of the current buffer.
M.copy_finish_branch = function()
	local first_line = vim.fn.getline(1)
	local branch_name = first_line:match("'(.-)'")
	if branch_name then
		local finish_text = "finish " .. branch_name .. "\n"
		vim.fn.setreg("+", finish_text)
		print("✔ Copied: '" .. finish_text .. "' to clipboard")
	else
		print("❌ No branch name found")
	end
end

-- Create a user command for SudoSaveFile for easy access
vim.api.nvim_create_user_command("SudoSaveFile", M.sudo_save_file, {})

-- Export functions that should be accessible from outside this module
return M