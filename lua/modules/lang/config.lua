local config = {}
local exec = vim.api.nvim_command

function config.lang_go() vim.g.go_doc_keywordprg_enabled = false end

return config
