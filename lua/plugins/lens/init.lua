local lens = require('session-lens')

local M = {}

M.config = function()
    return {
        path_display = {'shorten'},
        theme_conf = {border = false},
        previewer = true
    }
end

M.setup = function()
    lens.setup(M.config())
end

return M
