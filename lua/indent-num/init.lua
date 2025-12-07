local M = {}

local function adjust_indent(count, direction)
	count = tonumber(count) or 1
	count = math.max(count, 1)

	local indent_cmd = direction == "indent" and ">>" or "<<"
	for _ = 1, count do
		vim.cmd("normal! " .. indent_cmd)
	end
end

function M.Indentnum(count)
	adjust_indent(count, "indent")
end

function M.Unindentnum(count)
	adjust_indent(count, "unindent")
end

function M.setup()
	vim.api.nvim_create_user_command("Indentnum", function(opts)
		M.Indentnum(opts.args)
	end, { nargs = "?" })

	vim.api.nvim_create_user_command("Unindentnum", function(opts)
		M.Unindentnum(opts.args)
	end, { nargs = "?" })

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

return M
