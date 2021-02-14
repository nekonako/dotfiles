local gl = require('galaxyline')
local utils = require('utils')

local gls = gl.section
gl.short_line_list = {'defx', 'packager', 'vista', 'NvimTree'}

local colors = {
    bg = '#1B1515',
    fg = '#F8EAB6',
    blue = '#F79F20',
    green = '#B6D031',
    purple = '#E6B673',
    cyan = '#FF7733',
    red = '#FF5341',
    yellow = '#F0BC2C',
    gray1 = '#151A1E',
    gray2 = '#343434',
}

-- Local helper functions
local buffer_not_empty = function() return not utils.is_buffer_empty() end

local checkwidth = function()
    return utils.has_width_gt(40) and buffer_not_empty()
end

local mode_color = function()
    local mode_colors = {
        n = colors.red,
        i = colors.green,
        c = colors.green,
        V = colors.purple,
        [''] = colors.purple,
        v = colors.purple,
        R = colors.red1,
        t = colors.blue
    }

    if mode_colors[vim.fn.mode()] ~= nil then
        return mode_colors[vim.fn.mode()]
    else
        print(vim.fn.mode())
        return colors.purple
    end
end

local function file_readonly()
    if vim.bo.filetype == 'help' then return '' end
    if vim.bo.readonly == true then return '  ' end
    return ''
end

local function get_current_file_name()
    local file = vim.fn.expand('%:t')
    if vim.fn.empty(file) == 1 then return '' end
    if string.len(file_readonly()) ~= 0 then return file .. file_readonly() end
    -- if vim.bo.modifiable then
    --     if vim.bo.modified then return file .. '  ' end
    -- end
    return file .. ' '
end

-- Left side
gls.left[1] = {
    ViMode = {
        provider = function()
            local alias = {
                n = 'NORMAL',
                i = 'INSERT',
                c = 'COMMAND',
                v = 'VISUAL',
                V = 'V-LINE',
                [''] = 'VISUAL',
                R = 'REPLACE',
                t = 'TERMINAL',
                s = 'SELECT',
                S = 'S-LINE'
            }
            vim.api.nvim_command('hi GalaxyViMode guibg=' .. mode_color())
            if alias[vim.fn.mode()] ~= nil then
                return '    ' .. alias[vim.fn.mode()] .. ' '
            else
                return '  V-BLOCK '
            end
        end,
        highlight = {colors.bg, colors.bg}
    }
}
gls.left[2] = {
    FileIcon = {
        provider = {function() return '  ' end, 'FileIcon'},
        condition = buffer_not_empty,
        highlight = {
            colors.bg,
            -- require('galaxyline.provider_fileinfo').get_file_icon,
            colors.yellow
        }
    }
}
gls.left[3] = {
    FileName = {
        provider = get_current_file_name,
        condition = buffer_not_empty,
        highlight = {colors.bg, colors.yellow},
        separator = " ",
        separator_highlight = {colors.gray1, colors.bg}
    }
}
gls.left[9] = {
    DiagnosticError = {
        provider = 'DiagnosticError',
        icon = '  ',
        highlight = {colors.red, colors.bg}
    }
}
gls.left[10] = {
    Space = {
        provider = function() return ' ' end,
        highlight = {colors.fg, colors.bg}
    }
}
gls.left[11] = {
    DiagnosticWarn = {
        provider = 'DiagnosticWarn',
        icon = '  ',
        highlight = {colors.blue, colors.bg}
    }
}
gls.left[12] = {
    Space = {
        provider = function() return ' ' end,
        highlight = {colors.fg, colors.bg}
    }
}
gls.left[13] = {
    DiagnosticInfo = {
        provider = 'DiagnosticInfo',
        icon = '  ',
        highlight = {colors.blue, colors.bg},
        separator = ' ',
        separator_highlight = {colors.gray1, colors.bg}
    }
}

-- Right side
-- gls.right[1] = {
--     FileFormat = {
--         provider = function() return ' ' .. vim.bo.filetype end,
--         highlight = {colors.fg, colors.section_bg},
--         separator = '',
--         separator_highlight = {colors.section_bg, colors.bg}
--     }
-- }
gls.right[1] = {
    DiffAdd = {
        provider = 'DiffAdd',
        condition = checkwidth,
        icon = '+',
        highlight = {colors.green, colors.bg}
    }
}
gls.right[2] = {
    DiffModified = {
        provider = 'DiffModified',
        condition = checkwidth,
        icon = '~',
        highlight = {colors.purple, colors.bg}
    }
}
gls.right[3] = {
    DiffRemove = {
        provider = 'DiffRemove',
        condition = checkwidth,
        icon = '-',
        highlight = {colors.red, colors.bg}
    }
}
gls.right[4] = {
    Space = {
        provider = function() return ' ' end,
        highlight = {colors.fg, colors.bg}
    }
}
gls.right[5] = {
    GitIcon = {
        provider = function() return '    ' end,
        condition = buffer_not_empty and
            require('galaxyline.provider_vcs').check_git_workspace,
        highlight = {colors.bg, colors.yellow}
    }
}
gls.right[6] = {
    GitBranch = {
        provider = 'GitBranch',
        condition = buffer_not_empty,
        highlight = {colors.bg, colors.yellow}
    }
}

gls.right[7] = {
    PerCent = {
        provider =  {function() return '   ' end, 'LinePercent', function() return ' ' end,},
        -- separator = ' ',
        -- separator_highlight = {colors.bg, colors.blue},
        highlight = {colors.bg, colors.green}
    }
}

-- gls.right[8] = {
--     LineInfo = {
--         provider = {function() return '    ' end, 'LineColumn', function() return ' ' end,},
--         highlight = {colors.bg, colors.green},
--         -- separator = ' | ',
--         -- -- separator_highlight = {colors.bg, colors.section_bg}
--         -- -- separator = '',
--         -- separator_highlight = {colors.bg, colors.blue}
--     }
-- }

-- Short status line

gls.short_line_left[1] = {
    BufferType = {
        provider = {function() return '    ' end, 'FileTypeName', function() return ' ' end, },
        highlight = {colors.bg, colors.yellow},
        separator = '  ',
        separator_highlight = {colors.gray1, colors.bg}
    }
}

-- gls.short_line_right[1] = {
--     BufferIcon = {
--         provider = 'BufferIcon',
--         highlight = {colors.yellow, colors.gray1},
--         separator = ' ',
--         separator_highlight = {colors.gray1, colors.bg}
--     }
-- }

-- Force manual load so that nvim boots with a status line
gl.load_galaxyline()

