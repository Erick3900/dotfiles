return {
    {
        name = "configure",
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
        name = "build",
        type = "shell",
        command = "cmake",
        args = {
            "--build " .. ws.build_dir,
            "-j" .. number_of_cores,
        },
        cwd = ws.build_dir,
        depends = {
            "configure"
        },
        default = true,
    },
    {
        name = "clean",
        type = "shell",
        command = "cmake",
        args = {
            "--build " .. ws.build_dir,
            "--target clean"
        },
        cwd = ws.build_dir
    },
    {
        name = "new_problem",
        type = "lua",
        callback = function(runTask)
            local name = ""

            vim.ui.input({
                prompt = "Name: ",
                default = "",
            }, function(str)
                name = str
            end)

            local path = require('plenary.path')

            local npath = path:new(workspace_folder .. dirsep .. name)
            npath:mkdir()

            runTask({
                name = "ArtiGen Cp Template",
                type = "shell",
                command = "/opt/arti/generator/bin/arti-gen",
                args = {
                    "-t cp-problem",
                    "-n solution"
                },
                cwd = tostring(npath)
            }, function()
                vim.cmd(":e " .. tostring(npath) .. dirsep .. "solution.cpp")
            end)
        end
    },
}
