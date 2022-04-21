local M = {'onsails/lspkind-nvim'}

M.config = function()
	local resolve_name = function(icon, name)
		return string.format('%s (%s)', icon, name)
	end

	require('lspkind').init({
		with_text = false,
		symbol_map = {
			Struct = resolve_name('פּ', 'struct'),
			Class = resolve_name('', 'class'),
			Constructor = resolve_name('', 'constructor'),
			Method = resolve_name('', 'method'),
			Field = resolve_name('', 'field'),
			Property = resolve_name('', 'property'),
			Constant = resolve_name('', 'constant'),
			Variable = resolve_name('', 'variable'),
			Function = resolve_name('', 'function'),
			Interface = resolve_name('', 'interface'),
			Enum = resolve_name('', 'enum'),
			EnumMember = resolve_name('', 'enum member'),
			Module = resolve_name('', 'module'),
			Unit = resolve_name('', 'unit'),
			Value = resolve_name('', 'value'),
			Keyword = resolve_name('', 'keyword'),
			Operator = resolve_name('', 'operator'),
			TypeParameter = resolve_name('', 'type parameter'),
			Snippet = resolve_name('', 'snippet'),
			Color = resolve_name('', 'color'),
			File = resolve_name('', 'file'),
			Folder = resolve_name('', 'folder'),
			Text = resolve_name('', 'text'),
		},
	})
end

return M