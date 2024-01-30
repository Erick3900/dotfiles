local function dirname(filepath)
    local path = require('plenary.path')
    return tostring(path:new(filepath):parent())
end

return {
    build_dir = workspace_folder .. dirsep .. "build",
    output_dir = function(filepath)
        return dirname(dirname(filepath)) .. dirsep .. "bin" .. dirsep
    end
}
