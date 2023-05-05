return {
    {
        name = "Configure",
        type = "shell",
        command = "cmake",
        args = {
            "-S " .. workspace_folder,
            "-B " .. ws.build_dir,
            "-DCMAKE_EXPORT_COMPILE_COMMANDS=1",
            "-DCMAKE_BUILD_TYPE=" .. state.build_mode
        },
        cwd = workspace_folder
    },
    {
        name = "Build",
        type = "shell",
        command = "cmake",
        args = {
            "--build " .. ws.build_dir,
            "-j" .. number_of_cores,
        },
        cwd = ws.build_dir,
        depends = {
            "Configure"
        },
        default = true,
    },
    {
        name = "Clean",
        type = "shell",
        command = "cmake",
        args = {
            "--build " .. ws.build_dir,
            "--target clean"
        },
        cwd = ws.build_dir
    }
}
