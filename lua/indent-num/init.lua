local M = {}

function M.Indentnum(count)
	count = tonumber(count) or 1
	count = math.max(count, 1)

	for _ = 1, count do
		vim.cmd("normal! >>")
	end
end

function M.Unindentnum(count)
	count = tonumber(count) or 1
	count = math.max(count, 1)

	for _ = 1, count do
		vim.cmd("normal! <<")
	end
end

function M.setup()
	vim.api.nvim_create_user_command("Indentnum", function(opts)
		local count = tonumber(opts.args) or 1
		count = math.max(count, 1)
		for _ = 1, count do
			vim.cmd("normal! >>")
		end
	end, {
		nargs = "?",
	})

	vim.api.nvim_create_user_command("Unindentnum", function(opts)
		local count = tonumber(opts.args) or 1
		count = math.max(count, 1)
		for _ = 1, count do
			vim.cmd("normal! <<")
		end
	end, {
		nargs = "?",
	})

	vim.api.nvim_set_keymap(
		"n",
		"<Tab>",
		":lua require('indent-num').Indentnum(vim.v.count)<CR>",
		{ noremap = true, silent = true }
	)

	vim.api.nvim_set_keymap(
		"n",
		"<S-Tab>",
		":lua require('indent-num').Unindentnum(vim.v.count)<CR>",
		{ noremap = true, silent = true }
	)
end

if vim.fn.has("nvim") == 1 then
	M.setup()
end
return M
