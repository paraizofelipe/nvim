--[[ vim.g.semshi_error_sign = false ]]
--[[ vim.g.semshi_simplify_markup = false ]]

vim.cmd([[
    let g:semshi#error_sign = 0
    let g:semshi#simplify_markup = 0
]])

vim.api.nvim_set_hl(0, "semshiParameter", { link = "GruvboxBlueBold" })
vim.api.nvim_set_hl(0, "semshiAttribute", { link = "GruvboxAqua" })
vim.api.nvim_set_hl(0, "semshiBuiltin", { link = "GruvboxPurple" })
vim.api.nvim_set_hl(0, "semshiSelected", { fg = "#504945", bg = "#a89984" })
--[[ vim.api.nvim_set_hl(0, "semshiSelected", { link = "TermCursor" }) ]]
