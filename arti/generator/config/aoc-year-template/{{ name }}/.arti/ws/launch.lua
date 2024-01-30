return {
    {
        name = "run",
        program = ws.output_dir(file) .. "solution",
        args = {},
        cwd = workspace_folder,
        depends = {
            "build"
        },
        default = true
    },
    {
        name = "test",
        program = ws.output_dir(file) .. "test",
        args = {},
        cwd = workspace_folder,
        depends = {
            "build"
        },
        default = true
    }
}
