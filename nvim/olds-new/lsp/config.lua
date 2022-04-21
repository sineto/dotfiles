local M = {}

local global_attachments = {}
local server_attachments = {}

function M.run_attachments(client, bufnr)
	for _, fn in ipairs(global_attachments) do
		fn(client, bufnr)
	end

	local attachments = server_attachments or {}
	for _, fn in ipairs(attachments[client.name] or {}) do
		fn(client, bufnr)
	end
end

function M.push_attachment(server_name, fn)
	if server_name == nil then
		table.insert(global_attachments, fn)
	else
		local attachments = server_attachments[server_name] or {}
		table.insert(attachments, fn)
		server_attachments[server_name] = attachments
	end
end

local special_setups = {}
function M.set_special_setup(server_name, fn)
	special_setups[server_name] = fn
end

function M.setup_server(name, opts)
	local lspconfig = require('lspconfig')
	local setup_fn = special_setups[name] or lspconfig[name].setup

	setup_fn(opts)
end

return M