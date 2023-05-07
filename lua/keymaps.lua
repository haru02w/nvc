vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.keymap.set('i', '<C-BS>', '<C-w>', { desc = 'delete previous word' })

-- File Explorer
vim.keymap.set('n', "<leader>e", vim.cmd.Ex, { desc = 'Open netrw (default File Explorer)' })

-- Quick Split
vim.keymap.set('n', '<leader>\\', vim.cmd.sp, { desc = 'Split screen' })
vim.keymap.set('n', '<leader>|', vim.cmd.vs, { desc = 'Split screen vertically' })

-- Move lines around
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = 'move selected lines down' })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = 'move selected lines up' })

-- Append next line without moving cursor
vim.keymap.set('n', '<leader>j', 'mzJ`z', { desc = 'append next line' })

-- Move half page around keeping cursor in the middle
vim.keymap.set('n', 'J', '<C-d>zz', { desc = 'move cursor half page down' })
vim.keymap.set('n', 'K', '<C-u>zz', { desc = 'move cursor half page up' })

-- Next search term kepping cursor in the middle
vim.keymap.set('n', 'n', 'nzzzv', { desc = 'next search term' })
vim.keymap.set('n', 'N', 'Nzzzv', { desc = 'next search term' })

-- Paste without losing yanked text
vim.keymap.set('x', 'p', '\"_dP', { desc = 'a better paste' })

-- remap normal p to <leader>p
vim.keymap.set('x', '<leader>p', 'p', { desc = 'normal paste' })

-- system clipboard
vim.keymap.set({ 'n', 'v' }, '<leader>y', '\"+y', { desc = 'copy to system clipboard' })
vim.keymap.set('n', '<leader>Y', '\"+Y', { desc = 'copy to system clipboard the text at right of cursor' })

-- Navigate buffers
vim.keymap.set("n", "<S-h>", vim.cmd.BufferLineCyclePrev, { desc = 'go to previous buffer' })
vim.keymap.set("n", "<S-l>", vim.cmd.BufferLineCycleNext, { desc = 'go to next buffer' })

-- Move buffers
vim.keymap.set("n", "<leader>bh", vim.cmd.BufferLineMovePrev, { desc = 'go to previous buffer' })
vim.keymap.set("n", "<leader>bl", vim.cmd.BufferLineMoveNext, { desc = 'go to next buffer' })

-- close buffer: commented because vim-bbye is installed
-- vim.keymap.set('n', '<leader>c', vim.cmd.bdelete, { desc = 'delete buffer' })

-- Stay in indent mode
vim.keymap.set("v", "<", "<gv", { desc = 'indent left' })
vim.keymap.set("v", ">", ">gv", { desc = 'indent right' })

--disable search highlight
vim.keymap.set("n", "<leader>n", vim.cmd.nohlsearch, { desc = 'disable search highlight' })

-- don't know why this exists
vim.keymap.set('n', 'Q', '<nop>')

function Smart_splits_keymaps()
	local splits = require('smart-splits')
	-- resizing splits
	vim.keymap.set('n', '<C-A-h>', splits.resize_left, { desc = 'Resize current window left' })
	vim.keymap.set('n', '<C-A-j>', splits.resize_down, { desc = 'Resize current window down' })
	vim.keymap.set('n', '<C-A-k>', splits.resize_up, { desc = 'Resize current window up' })
	vim.keymap.set('n', '<C-A-l>', splits.resize_right, { desc = 'Resize current window right' })
	-- moving between splits
	vim.keymap.set('n', '<C-h>', splits.move_cursor_left, { desc = 'Move focus to left window' })
	vim.keymap.set('n', '<C-j>', splits.move_cursor_down, { desc = 'Move focus to down window' })
	vim.keymap.set('n', '<C-k>', splits.move_cursor_up, { desc = 'Move focus to up window' })
	vim.keymap.set('n', '<C-l>', splits.move_cursor_right, { desc = 'Move focus to right window' })
	-- swapping buffers between windows
	vim.keymap.set('n', '<A-H>', splits.swap_buf_left, { desc = 'Swap current window with left one' })
	vim.keymap.set('n', '<A-K>', splits.swap_buf_down, { desc = 'Swap current window with down one' })
	vim.keymap.set('n', '<A-J>', splits.swap_buf_up, { desc = 'Swap current window with up one' })
	vim.keymap.set('n', '<A-L>', splits.swap_buf_right, { desc = 'Swap current window with right one' })
end

function Telescope_keymaps() --TODO implement more fuzzyfinding
	local tcbuiltin = require('telescope.builtin')
	vim.keymap.set('n', '<leader>ff', tcbuiltin.find_files, { desc = '[f]ind [f]iles' })
	vim.keymap.set('n', '<leader>fg', tcbuiltin.git_files, { desc = '[f]ind [g]it files' })
	--vim.keymap.set('n', '<leader>fG', tc.builtin.live_grep, { desc = 'wtf?' })
	vim.keymap.set('n', '<leader>fb', tcbuiltin.buffers, { desc = '[f]ind on [b]uffers' })
	vim.keymap.set('n', '<leader>fh', tcbuiltin.help_tags, { desc = '[f]ind in [h]elp manuals' })
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

	-- not working, don't know why TODO
	--vim.keymap.set('n','gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')

	vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = '[G]oto [D]efinition' })
	vim.keymap.set('n', 'gI', vim.lsp.buf.implementation, { desc = '[G]oto [I]mplementation' })
	vim.keymap.set('n', 'gT', vim.lsp.buf.type_definition, { desc = 'Type [D]efinition' })
	vim.keymap.set('n', '<leader>ds', require('telescope.builtin').lsp_document_symbols,
		{ desc = '[D]ocument [S]ymbols' })
	vim.keymap.set('n', '<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols,
		{ desc = '[W]orkspace [S]ymbols' })

	-- See `:help K` for why this keymap
	vim.keymap.set('n', '<leader>k', vim.lsp.buf.hover, { desc = 'Hover Documentation' })
	vim.keymap.set('n', '<leader>K', vim.lsp.buf.signature_help, { desc = 'Signature Documentation' })

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
		["<Up>"] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Insert },
		["<Down>"] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Insert },
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

function ToggleTerm_keymaps() --TODO disable most things except floating terminals (use tmux)
	vim.keymap.set('n', '<leader>tF', '<cmd>ToggleTerm direction=tab<CR>', { desc = 'open tab terminal' })
	vim.keymap.set('n', '<leader>tf', '<cmd>ToggleTerm direction=float<CR>', { desc = 'open floating terminal' })
	vim.keymap.set('n', '<leader>t\\', '<cmd>ToggleTerm direction=horizontal size=10<CR>',
		{ desc = 'open horizontal terminal' })
	vim.keymap.set('n', '<leader>t|', '<cmd>ToggleTerm direction=vertical size=50<CR>',
		{ desc = 'open vertical terminal' })

	vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], { desc = 'bind terminal escape' })
	vim.keymap.set('t', 'jk', [[<C-\><C-n>]], { desc = 'quick terminal escape' })
	vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], { desc = 'goto left window' })
	vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], { desc = 'goto down window' })
	vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], { desc = 'goto up window' })
	vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], { desc = 'goto right window' })
	vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], { desc = 'default navigation prefix to escape' })
end

function Comment_keymaps()
	local api = require('Comment.api')
	local esc = vim.api.nvim_replace_termcodes(
		'<ESC>', true, false, true
	)

	vim.keymap.set('n', '<leader>/', api.toggle.linewise.current, { desc = 'linewise comment a line' })
	vim.keymap.set('n', '<leader>?', api.toggle.blockwise.current, { desc = 'blockwise comment a line' })

	vim.keymap.set('x', '<leader>/',
		function()
			vim.api.nvim_feedkeys(esc, 'nx', false)
			api.toggle.blockwise(vim.fn.visualmode())
		end, { desc = 'blockwise comment selected text' })

	vim.keymap.set('x', '<leader>?', function()
		vim.api.nvim_feedkeys(esc, 'nx', false)
		api.toggle.linewise(vim.fn.visualmode())
	end, { desc = 'linewise comment selected text' })
end

function Undotree_keymaps()
	vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle, { desc = 'UndoTree Toggle' })
end

function Fugitive_keymaps()
	vim.keymap.set('n', '<leader>G', vim.cmd.Git, { desc = 'Open Git Status' })
end

function Bbye_keymaps()
	vim.keymap.set('n', '<leader>c', vim.cmd.Bdelete, { desc = 'close buffer' })
end
