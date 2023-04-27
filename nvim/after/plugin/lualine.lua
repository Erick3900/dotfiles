require('lualine').setup({
    options = {
        globalstatus = true,
        component_separators = { left = '|', right = '|' },
        section_separators = { left = '', right = '' },
        disabled_filetypes = {
            statusline = { 'packer', 'NvimTree' }
        },
    },
    sections = {
        lualine_a = {
            {
                'mode',
                fmt = function(str)
                    return str:sub(1, 1)
                end
            }
        },
        lualine_b = { 'branch', 'diff', 'diagnostics' },
        lualine_c = { 'filename' },
        lualine_x = { 'fileformat', 'filetype' },
        lualine_y = { 'progress' },
        lualine_z = { 'location' }
    }
})
