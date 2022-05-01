if not packer_plugins['nvim-lspconfig'].loaded then
    vim.cmd [[packadd nvim-lspconfig]]
end

vim.cmd [[packadd lspsaga.nvim]]

if not packer_plugins['nvim-lsp-installer'].loaded then
    vim.cmd [[packadd nvim-lsp-installer]]
end

vim.cmd [[packadd lsp_signature.nvim]]
-- vim.cmd([[packadd nvim-lsp-installer]])
vim.cmd([[packadd cmp-nvim-lsp]])
-- vim.cmd([[packadd aerial.nvim]])
-- vim.cmd([[packadd vim-illuminate]])

local nvim_lsp = require('lspconfig')
local lsp_installer = require('nvim-lsp-installer')
local saga = require('lspsaga')
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

-- saga.init_lsp_saga({code_action_icon = '💡'})
-- saga.init_lsp_saga()
saga.init_lsp_saga({
    error_sign = "",
    warn_sign = "",
    hint_sign = "",
    infor_sign = "",
})

-- capabilities.textDocument.completion.completionItem.snippetSupport = true
-- capabilities.textDocument.completion.completionItem.resolveSupport = {
    -- properties = {'documentation', 'detail', 'additionalTextEdits'}
-- }
--
local enhance_server_opts = {
	["gopls"] = function(opts)
		opts.settings = {
			gopls = {
				usePlaceholders = true,
				analyses = {
					nilness = true,
					shadow = true,
					unusedparams = true,
					unusewrites = true,
				},
			},
		}
	end
}


lsp_installer.on_server_ready(function(server)
	local opts = {
		capabilities = capabilities,
		flags = { debounce_text_changes = 500 },
		-- on_attach = custom_attach,
	}

	if enhance_server_opts[server.name] then
		enhance_server_opts[server.name](opts)
	end

	server:setup(opts)
end)

-- local function setup_servers()
    -- -- lsp_install.setup()
    -- local servers = lsp_install.installed_servers()
    -- for _, lsp in ipairs(servers) do
        -- nvim_lsp[lsp].setup {
            -- capabilities = capabilities,
            -- on_attach = function()
                -- require('lsp_signature').on_attach({
                    -- bind = true,
                    -- use_lspsaga = false,
                    -- floating_window = true,
                    -- fix_pos = true,
                    -- hint_enable = true,
                    -- hi_parameter = "Search",
                    -- handler_opts = {"double"}
                -- })
            -- end
        -- }
    -- end
-- end

-- lsp_install.post_install_hook = function()
    -- setup_servers() -- reload installed servers
    -- vim.cmd("bufdo e") -- this triggers the FileType autocmd that starts the server
-- end

-- setup_servers()
