return {
    {
        name = "conan",
        type = "shell",
        command = "conan",
        args = {
            "install",
            "--output-folder=" .. ws.build_dir,
            "--build=missing",
            "-s build_type=" .. state.build_mode,
            workspace_folder
        },
        cwd = workspace_folder
    },
    {
        name = "configure",
        type = "shell",
        command = {
            {
                command = "cmake",
                args = {
                    "-S " .. workspace_folder,
                    "-B " .. ws.build_dir,
                    "-DCMAKE_TOOLCHAIN_FILE=conan_toolchain.cmake",
                    "-DCMAKE_EXPORT_COMPILE_COMMANDS=1",
                    "-DCMAKE_BUILD_TYPE=" .. state.build_mode
                }
            },
            {
                command = "ln",
                args = {
                    "-f",
                    "-s",
                    ws.build_dir .. dirsep .. "compile_commands.json",
                    workspace_folder .. dirsep .. "compile_commands.json"
                }
            }
        },
        cwd = workspace_folder,
        depends = {
            "conan"
        }
    },
    {
        name = "build",
        type = "shell",
        command = "cmake",
        args = {
            "--build " .. ws.build_dir,
            "--config " .. state.build_mode,
            "-j " .. number_of_cores
        },
        cwd = ws.build_dir,
        depends = {
            "configure"
        },
        default = true,
    }
}
