return {
    {
        name = "run",
        cwd = workspace_folder,
        program = "./run",
        args = {
            file,
            "in"
        },
        default = true,
        depends = {
            "build"
        }
    },
    {
        name = "copy",
        cwd = workspace_folder,
        program = "/opt/arti/sub/bin/arti-sub",
        args = {
            "-I include",
            "-f "..file,
            "| xclip -selection clipboard"
        }
    },
    {
        name = "arti-sub",
        cwd = workspace_folder,
        program = "/opt/arti/sub/bin/arti-sub",
        args = {
            "-I include",
            "-f "..file,
            "-o "..file
        },
        on_exit = function(_)
            vim.api.nvim_command("silent! :e")
        end
    }
}
