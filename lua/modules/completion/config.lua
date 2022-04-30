local config = {}

function config.nvim_lsp() require('modules.completion.lspconfig') end

function gen_lspkind_icons()
    return {
        Text = "",
        Method = "",
        Function = "",
        Constructor = "",
        Field = "",
        Variable = "",
        Class = "ﴯ",
        Interface = "",
        Module = "",
        Property = "ﰠ",
        Unit = "",
        Value = "",
        Enum = "",
        Keyword = "",
        Snippet = "",
        Color = "",
        File = "",
        Reference = "",
        Folder = "",
        EnumMember = "",
        Constant = "",
        Struct = "",
        Event = "",
        Operator = "",
        TypeParameter = "",
    }
end


function config.cmp()
	local cmp = require("cmp")
    cmp.setup({
        mapping = cmp.mapping.preset.insert({
            ["<Tab>"] = cmp.mapping(function(fallback)
                if cmp.visible() then
                    cmp.select_next_item()
                elseif has_words_before() then
                    cmp.complete()
                else
                    fallback()
                end
            end, { "i", "s" }),
            ["<S-Tab>"] = cmp.mapping(function(fallback)
                if cmp.visible() then
                    cmp.select_prev_item()
                else
                    fallback()
                end
            end, { "i", "s" }),
        }),
        formatting = {
			format = function(entry, vim_item)
				local lspkind_icons = gen_lspkind_icons()
				-- load lspkind icons
				vim_item.kind = string.format("%s %s", lspkind_icons[vim_item.kind], vim_item.kind)
				vim_item.menu = ({
					buffer = "[BUF]",
					nvim_lsp = "[LSP]",
					path = "[PATH]",
                    cmp_tabnine = "[TN]",
				})[entry.source.name]

				return vim_item
			end,
		},
        sources = cmp.config.sources({
            { name = 'nvim_lsp' },
            { name = 'buffer' },
            { name = 'path' },
            { name = 'cmp_tabnine' },
        })
    })
	-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
	cmp.setup.cmdline('/', {
		mapping = cmp.mapping.preset.cmdline(),
		sources = {
			{ name = 'buffer' }
		}
	})
	-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
	cmp.setup.cmdline(':', {
		mapping = cmp.mapping.preset.cmdline(),
		sources = cmp.config.sources({
			{ name = 'path' }
		}, {
			{ name = 'cmdline' }
		})
	})
end

-- function config.autopairs()
    -- require('nvim-autopairs').setup({
        -- disable_filetype = {"TelescopePrompt"},
        -- ignored_next_char = string.gsub([[ [%w%%%'%[%"%.] ]], "%s+", ""),
        -- enable_moveright = true,
        -- -- add bracket pairs after quote
        -- enable_afterquote = true,
        -- -- check bracket in same line
        -- enable_check_bracket_line = true,
        -- check_ts = true
    -- })

    -- require("nvim-autopairs.completion.compe").setup({
        -- map_cr = true,
        -- map_complete = true
    -- })
-- end

return config
