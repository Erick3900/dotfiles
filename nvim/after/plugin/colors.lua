local serpent = require('arti.serpent')
local theme_path = vim.fn.stdpath('config')..'/lua/alcachofa/colorschemes/current.lua'

local function SetTheme(theme)
    local _themes = {
        ['nightfox'] = function()
            require('nightfox').setup(require('alcachofa.colorschemes.nightfox'))
            vim.cmd.colorscheme("carbonfox")
        end,
        ['monokai-pro'] = function()
            require('monokai-pro').setup(require('alcachofa.colorschemes.monokai-pro'))
            vim.cmd.colorscheme("monokai-pro")
        end,
        ['kanagawa'] = function()
            require('kanagawa').setup(require('alcachofa.colorschemes.kanagawa'))
            vim.cmd.colorscheme("kanagawa-dragon")
        end
    }

    if _themes[theme] == nil then
        theme = 'monokai-pro'
    end

    _themes[theme]()
end

vim.api.nvim_create_user_command(
    "SetTheme",
    function(opts)
        local theme = opts.fargs[1]

        if theme == nil then
            error("Theme required")
        end

        local f = require("io").open(theme_path, "w")

        if f then
            f:write(serpent.dump({
                value = theme
            }))
            f:close()
        else
            error(vim.fn.stdpath('config'))
        end

        SetTheme(theme)
    end,
    {
        nargs = 1,
        desc = "ArtiWs",
        complete = function(_, _)
            return {
                "kanagawa",
                "monokai-pro",
                "nightfox"
            }
        end
    }
)

local ok, theme = pcall(loadfile, theme_path)

SetTheme((function()
    if ok and theme ~= nil then
        local ret = theme()
        if ret ~= nil and ret.value ~= nil then
            return ret.value
        end
    end

    return nil
end)())
