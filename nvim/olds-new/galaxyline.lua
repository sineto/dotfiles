local M = {'glepnir/galaxyline.nvim'}

M.requires = {
	{'kyazdani42/nvim-web-devicons'},
	require('specs.gitgutter')
}

-- TODO: fix width in narrow screen
-- TODO: truncate long texts like filename and git branch
-- TODO: pin diagnostics panel even with have no errors/warnings/infos

M.config = function()
  local gl = require('galaxyline')
	local condition = require('galaxyline.condition')
	local provider_vcs = require('galaxyline.provider_vcs')
	local gl_util = require('utils.galaxyline')

  local colors = {
    bg = '#19181A',
    fg = '#FCFCFA',
    fg2 = '#939293',
    section_bg = '#221F22',
    yellow = '#FFD866',
    cyan = '#18FF9E',
    green = '#A9DC76',
    orange = '#FC9867',
    magenta = '#AB9DF2',
    blue = '#78DCE8',
    red = '#E06C75'
  }

	local fg_color = colors.fg2
	local bg_color = colors.bg

	local function is_normal_file()
		local special_files =  {
			'help',
			'NvimTree',
			'startify'
		}

		for _, ft in ipairs(special_files) do
			if vim.bo.filetype == ft then
				return false
			end
		end
		return true
	end

	local function has_filetype()
		return vim.bo.filetype ~= '' and is_normal_file()
	end

	local function is_normal_not_empty_file()
		return is_normal_file() and has_filetype() and condition.buffer_not_empty()
	end

	local function is_git_workspace()
		return is_normal_file() and condition.check_git_workspace()
	end

	local function is_git_file()
		return is_normal_not_empty_file() and condition.check_git_workspace()
	end

  local function get_file_encode()
    local encode = vim.bo.fenc ~= '' and vim.bo.fenc or vim.o.enc
    return ' ' .. string.upper(encode)
  end

  local function def_mode_color()
    local mode_colors = {
      n = colors.green,
      i = colors.blue,
      c = colors.yellow,
      V = colors.orange,
      [''] = colors.orange,
      v = colors.orange,
      R = colors.red,
      s = colors.orange,
      S = colors.orange,
      [''] = colors.orange,
      t = colors.magenta,
      rm = colors.cyan
    }

    local color = mode_colors[vim.fn.mode()]
    if color == nil then
      color = colors.red
    end

    return color
  end

	local components = {
    first_element = {
      provider = function() return '▋' end,
      highlight = { colors.bg, colors.bg }
    },
		vi_mode = {
			provider = function()
        local alias = {
          n = ' NORMAL',
          i = ' INSERT',
          c = ' COMMAND',
          v = ' VISUAL',
          V = ' V-LINE',
          [''] = ' V-BLOCK',
          R = ' REPLACE',
          s = ' SELECT',
          S = ' S-LINE',
          [''] = ' V-BLOCK',
          t = ' TERMINAL',
          rm = ' --MORE'
        }
        vim.api.nvim_command('hi GalaxyViMode gui=bold guibg='..def_mode_color())
        local mode = vim.fn.mode()
        return string.format(' %s ', alias[mode] or mode)
			end,
			condition = is_normal_file,
			highlight = {colors.bg, colors.bg},
      separator = ' ',
      separator_highlight = {colors.section_bg, colors.section_bg}
		},
    macro = {
      provider = function()
        local reg = vim.fn.reg_recording()

        if (reg == nil) or (reg == '') then
          return ''
        else
          return '  ' .. vim.call('reg_recording') .. ' '
        end
      end,
      highlight = {colors.red, colors.section_bg},
    },
    file_name = {
			icon = {
				provider = 'FileIcon',
				condition = has_filetype,
				highlight = {require('galaxyline.provider_fileinfo').get_file_icon_color, colors.section_bg},
			},
      name = {
        provider = 'FileName',
        condition = buffer_not_empty,
        highlight = {colors.fg, colors.section_bg},
        separator = ' ',
        separator_highlight = {colors.section_bg, colors.bg},
      }
    },
		git = {
			icon = {
				provider = function()
					return string.format(' %s ', '')
				end,
				condition = is_git_workspace,
				highlight = {colors.fg, colors.bg},
			},
			branch = {
				provider = function()
					local branch = require('galaxyline.provider_vcs').get_git_branch()
					return string.format('%s ', branch)
				end,
				condition = is_git_workspace,
				highlight = {colors.fg, colors.bg},
			},
			diff = {
				added = {
					provider = function()
						return provider_vcs.diff_add() or '0 '
					end,
					icon = string.format('%s', '+'),
					condition = is_git_file,
					separator_highlight = {bg_color, bg_color},
					highlight = {colors.fg, colors.bg},
				},
				modified = {
					provider = function()
						return provider_vcs.diff_modified() or '0 '
					end,
					icon = string.format('%s', '~'),
					condition = is_git_file,
					separator_highlight = {bg_color, bg_color},
					highlight = {colors.fg, colors.bg},
				},
				removed = {
					provider = function()
						return provider_vcs.diff_remove() or '0 '
					end,
					icon = string.format('%s', '-'),
					condition = is_git_file,
					separator = ' ',
					separator_highlight = {bg_color, bg_color},
					highlight = {colors.fg, colors.bg},
				},
			},
		},
		lsp = {
			server = {
				provider = function()
					local question_icon = '?'
					local fallback_name = string.format('%s ', question_icon:gsub('%s+', ''))
					local server_name = require('galaxyline.provider_lsp')
						.get_lsp_client(fallback_name)

					return string.format(' LSP: %s ', server_name)
				end,
				condition = is_normal_not_empty_file,
				separator = ' ',
				separator_highlight = {bg_color, bg_color},
				highlight = {colors.fg2, colors.bg},
			},
			diagnostics = {
				error = {
					provider = 'DiagnosticError',
					icon = string.format('%s ', ''),
					highlight = {colors.red, colors.bg},
				},
				warn = {
					provider = 'DiagnosticWarn',
					icon = string.format('%s ', ''),
					highlight = {colors.yellow, colors.bg},
				},
				info = {
					provider = 'DiagnosticInfo',
					icon = string.format('%s ', ''),
					highlight = {colors.fg2, colors.bg},
				},
				hint = {
					provider = 'DiagnosticHint',
					icon = string.format('%s ', ''),
					highlight = {colors.fg2, colors.bg},
				},
			},
		},
    file_format = {
      provider = get_file_encode,
      highlight = { colors.fg2, colors.section_bg },
      separator = ' ',
      separator_highlight = { colors.section_bg, colors.bg },
    },
		file_type = {
			icon = {
				provider = 'FileIcon',
				condition = has_filetype,
				highlight = {require('galaxyline.provider_fileinfo').get_file_icon_color, colors.section_bg},
        separator = ' ',
        separator_highlight = {colors.section_bg, colors.section_bg}
			},
			type = {
				provider = function() return vim.bo.filetype end,
				condition = has_filetype,
				highlight = {colors.fg2, colors.section_bg},
			},
		},
    line_info = {
      provider = 'LineColumn',
      highlight = { colors.fg2, colors.section_bg },
      separator = ' ',
      separator_highlight = { colors.fg2, colors.section_bg },
    },
    percent = {
      provider = 'LinePercent',
      highlight = {colors.fg2, colors.section_bg},
      separator = ' ',
      separator_highlight = { colors.fg2, colors.section_bg },
    },
		whitespace = {
			provider = 'Whitespace',
			highlight = {colors.bg, colors.bg},
		},
	}

	local section = gl.section
	local git = components.git
	local lsp = components.lsp
	local file_type = components.file_type

	gl_util.add_component(section.left, {
    { FirstElement = components.first_element },
		{ ViMode = components.vi_mode },
		-- { Macro = components.macro },
    { FileIcon = components.file_name.icon },
    { FileName = components.file_name.name },
		{ GitIcon = git.icon },
		{ GitBranch = git.branch },
		{ GitDiffAdded = git.diff.added },
		{ GitDiffModified = git.diff.modified },
		{ GitDiffRemoved = git.diff.removed },
	})

	gl_util.add_component(section.right, {
		-- { LspServer = lsp.server },
		{ LspDiagnosticError = lsp.diagnostics.error },
		{ LspDiagnosticWarning = lsp.diagnostics.warn },
		{ LspDiagnosticInformation = lsp.diagnostics.info },
		{ LspDiagnosticHint = lsp.diagnostics.hint },
    { FileFormat = components.file_format },
		-- { FileIcon = file_type.icon },
		-- { FileTypeName = file_type.type },
    { LineColumn = components.line_info },
    { LinePercent = components.percent },
		{ Padding = {
			provider = function() return ' ' end,
			highlight = {colors.section_bg, colors.section_bg},
		}},
	})
end

return M
