vim.cmd("command! -nargs=0 SudoSaveFile lua require('utils').sudo_save_file()")

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

return M
