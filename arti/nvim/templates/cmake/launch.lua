return {
    {
        name = "run",
        program = ws.build_dir .. dirsep .. "program",
        args = {},
        cwd = workspace_folder,
        depends = {
            "build"
        },
        default = true
    }
}
