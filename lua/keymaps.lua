vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Quick way to get back to normal mode TODO Better-Escape
vim.keymap.set('i', "jk", "<Esc>", { desc = 'Escape to normal mode' })

-- File Explorer
vim.keymap.set('n', "<leader>e", vim.cmd.Ex, { desc = 'Open netrw (default File Explorer)' })

-- Quick Split
vim.keymap.set('n', '\\', vim.cmd.sp, {desc = 'Split screen'})
vim.keymap.set('n', '|', vim.cmd.vs, {desc = 'Split screen vertically'})

--Quick Close
vim.keymap.set('n', '<leader>q',vim.cmd.q, {desc = 'Quit'})

function Smart_splits_keymaps()
	local splits = require('smart-splits')
	vim.keymap.set('n', '<A-S-h>', splits.resize_left,{desc = 'Resize current window left'})
	vim.keymap.set('n', '<A-S-j>', splits.resize_down,{desc = 'Resize current window down'})
	vim.keymap.set('n', '<A-S-k>', splits.resize_up,{desc = 'Resize current window up'})
	vim.keymap.set('n', '<A-S-l>', splits.resize_right,{desc = 'Resize current window right'})
	-- moving between splits
	vim.keymap.set('n', '<C-h>', splits.move_cursor_left,{desc = 'Move focus to left window'})
	vim.keymap.set('n', '<C-j>', splits.move_cursor_down,{desc = 'Move focus to down window'})
	vim.keymap.set('n', '<C-k>', splits.move_cursor_up,{desc = 'Move focus to up window'})
	vim.keymap.set('n', '<C-l>', splits.move_cursor_right,{desc = 'Move focus to right window'})
	-- swapping buffers between windows
	vim.keymap.set('n', '<S-a>', splits.swap_buf_left,{desc = 'Swap current window with left one'})
	vim.keymap.set('n', '<S-w>', splits.swap_buf_down,{desc = 'Swap current window with down one'})
	vim.keymap.set('n', '<S-s>', splits.swap_buf_up,{desc = 'Swap current window with up one'})
	vim.keymap.set('n', '<S-d>', splits.swap_buf_right,{desc = 'Swap current window with right one'})
end
-- TODO
function Telescope_keymaps()
	local builtin = require('telescope.builtin')
	vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'find files' })
	vim.keymap.set('n', '<leader>fg', builtin.git_files, { desc = 'find git files' })
	vim.keymap.set('n', '<leader>fG', builtin.live_grep, { desc = 'wtf?' })
	vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'search on buffers' })
	vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'wtf?' })
end

function Lsp_keymaps()
	vim.keymap.set('n', '<leader>w', function()
		vim.lsp.buf.format()
		vim.cmd.w()
	end, { desc = 'format buffer with LSP and save' })
	vim.keymap.set('n', '<leader>lr', vim.lsp.buf.rename, { desc = '[L]sp [R]ename' })
	vim.keymap.set('n', '<leader>la', vim.lsp.buf.code_action, { desc = '[L]sp Code [A]ction' })
	vim.keymap.set('v', '<leader>la', vim.lsp.buf.code_action, { desc = '[L]sp Code [A]ction' })
	vim.keymap.set('n', '<leader>ld', vim.diagnostic.open_float, { desc = '[L]sp Hover [D]iagnostics' })

	vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = '[G]oto [D]efinition' })
	--  vim.keymap.set('n','gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
	vim.keymap.set('n', 'gI', vim.lsp.buf.implementation, { desc = '[G]oto [I]mplementation' })
	vim.keymap.set('n', 'gT', vim.lsp.buf.type_definition, { desc = 'Type [D]efinition' })
	vim.keymap.set('n', '<leader>ds', require('telescope.builtin').lsp_document_symbols,
		{ desc = '[D]ocument [S]ymbols' })
	vim.keymap.set('n', '<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols,
		{ desc = '[W]orkspace [S]ymbols' })

	-- See `:help K` for why this keymap
	vim.keymap.set('n', 'K', vim.lsp.buf.hover, { desc = 'Hover Documentation' })
	vim.keymap.set('n', '<leader>k', vim.lsp.buf.signature_help, { desc = 'Signature Documentation' })

	-- Lesser used LSP functionality
	vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { desc = '[G]oto [D]eclaration' })
	vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, { desc = '[W]orkspace [A]dd Folder' })
	vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, { desc = '[W]orkspace [R]emove Folder' })
	vim.keymap.set('n', '<leader>wl', function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, { desc = '[W]orkspace [L]ist Folders' })
end

function Cmp_keymaps(cmp)
	local luasnip = require('luasnip')
	return cmp.mapping.preset.insert({
		["<Up>"] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Select },
		["<Down>"] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Select },
		["<C-p>"] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Insert },
		["<C-n>"] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Insert },
		["<C-k>"] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Insert },
		["<C-j>"] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Insert },
		["<C-u>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
		["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
		["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
		["<C-y>"] = cmp.config.disable,
		["<C-e>"] = cmp.mapping { i = cmp.mapping.abort(), c = cmp.mapping.close() },
		["<CR>"] = cmp.mapping.confirm { select = false },
		["<Tab>"] = cmp.mapping(function(fallback)
			local col = vim.fn.col('.') - 1
			if cmp.visible() then
				cmp.select_next_item()
			elseif luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			elseif col ~= 0 and vim.fn.getline('.'):sub(col, col):match('%s') == nil then
				cmp.complete()
			else
				fallback()
			end
		end, { "i", "s" }),
		["<S-Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, { "i", "s" }),
	})
end
