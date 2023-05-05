return {
    {
        name = "Run",
        program = ws.build_dir .. dirsep .. "program",
        args = {},
        cwd = workspace_folder,
        depends = {
            "Build"
        },
        default = true
    }
}
