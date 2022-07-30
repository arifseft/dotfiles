local cmd = vim.cmd -- to execute Vim commands e.g. cmd('pwd')
local fn = vim.fn -- to call Vim functions e.g. fn.bufnr()
local g = vim.g -- a table to access global variables
local opt = vim.opt -- to set options

opt.autoindent = true
opt.autoread = true
opt.backspace = {"indent", "eol", "start"}
opt.clipboard = "unnamedplus"
opt.completeopt = "menuone,noinsert,noselect"
opt.cursorcolumn = false
opt.cursorline = false
opt.encoding = "utf-8" -- Set default encoding to UTF-8
opt.expandtab = true -- Use spaces instead of tabs
-- opt.foldenable = true
opt.foldlevel = 99 -- Disable fold default
-- opt.foldmethod = "indent"
opt.formatoptions = "l"
opt.hidden = true -- Enable background buffers
opt.hlsearch = true -- Highlight found searches
opt.ignorecase = true -- Ignore case
opt.inccommand = "split" -- Get a preview of replacements
opt.incsearch = true -- Shows the match while typing
opt.joinspaces = false -- No double spaces with join
opt.linebreak = true -- Stop words being broken on wrap
opt.list = false -- Show some invisible characters
opt.mouse = "a"
opt.number = false -- Show line numbers
opt.numberwidth = 5 -- Make the gutter wider by default
opt.scrolloff = 4 -- Lines of context
opt.shiftround = true -- Round indent
opt.shiftwidth = 4 -- Size of an indent
opt.showmode = false -- Don't display mode
opt.sidescrolloff = 8 -- Columns of context
opt.signcolumn = "yes:1" -- always show signcolumns
opt.smartcase = true -- Do not ignore case with capitals
opt.smartindent = true -- Insert indents automatically
opt.spelllang = "en"
opt.splitbelow = true -- Put new windows below current
opt.splitright = true -- Put new windows right of current
opt.tabstop = 4 -- Number of spaces tabs count for
opt.termguicolors = true -- You will have bad experience for diagnostic messages when it's default 4000.
opt.timeoutlen = 500
-- opt.updatetime = 250 -- don't give |ins-completion-menu| messages.
opt.wrap = false
opt.swapfile = false

local function map(mode, lhs, rhs, opts)
	local options = { noremap = true }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Map leader to space
g.mapleader = ","

g.blade_custom_directives = { "javascript" }

-- Plugins
local function packer_init()
  local fn = vim.fn
  local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
  if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap = fn.system {
      "git",
      "clone",
      "--depth",
      "1",
      "https://github.com/wbthomason/packer.nvim",
      install_path,
    }
    vim.cmd [[packadd packer.nvim]]
  end
  -- vim.cmd "autocmd BufWritePost init.lua source <afile> | PackerCompile"
end

packer_init()

require("packer").startup(function()
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
	use({ "nvim-treesitter/playground", run = ":TSInstall query" })
	use("nvim-treesitter/nvim-treesitter-textobjects")
	use("JoosepAlviste/nvim-ts-context-commentstring")
	use("editorconfig/editorconfig-vim")
	use("folke/which-key.nvim")
	use("tami5/lspsaga.nvim")
	use("godlygeek/tabular")
	use("jwalton512/vim-blade")
	use({ "tamago324/lir.nvim", requires = "kyazdani42/nvim-web-devicons" })
	use({ "lewis6991/gitsigns.nvim", requires = { "nvim-lua/plenary.nvim" } })
	use("neovim/nvim-lspconfig")
	use("norcalli/nvim-colorizer.lua")
	use("nvim-lua/popup.nvim")
	use({
		"nvim-telescope/telescope.nvim",
		requires = {
			{ "nvim-telescope/telescope-live-grep-raw.nvim" },
		},
	})
	use("onsails/lspkind-nvim")
	use("ray-x/lsp_signature.nvim")
	use("ray-x/go.nvim")
	use("ray-x/guihua.lua")
	use("terryma/vim-multiple-cursors")
	use("tpope/vim-repeat")
	use("wbthomason/packer.nvim")
	use("mattn/emmet-vim")
  use {
      'nvim-lualine/lualine.nvim',
      requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }
  use { 'RRethy/nvim-base16' }
  use { 'numToStr/Comment.nvim' }
  use { 'windwp/nvim-autopairs' }
  use { 'ms-jpq/coq_nvim', branch = 'coq' }
  use { 'ms-jpq/coq.artifacts', branch = 'artifacts' }
  use {'akinsho/bufferline.nvim', tag = "v2.*", requires = 'kyazdani42/nvim-web-devicons'}
  use {
    'phaazon/hop.nvim',
    branch = 'v1',
    config = function()
      require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
    end
  }
end)

map('', 'f', "<cmd>HopWordAC<cr>")
map('', 'F', "<cmd>HopWordBC<cr>")

require('base16-colorscheme').setup({
    base00 = "#1B2B34",
    base01 = "#343D46",
    base02 = "#4F5B66",
    base03 = "#65737E",
    base04 = "#A7ADBA",
    base05 = "#C0C5CE",
    base06 = "#CDD3DE",
    base07 = "#D8DEE9",
    base08 = "#EC5f67",
    base09 = "#F99157",
    base0A = "#FAC863",
    base0B = "#99C794",
    base0C = "#5FB3B3",
    base0D = "#6699CC",
    base0E = "#C594C5",
    base0F = "#AB7967",
})

-- function light()
--     -- cmd("set background=light")
--     cmd('colorscheme base16-one-light')
-- end
--
-- function dark()
--     -- cmd("set background=dark")
--     cmd('colorscheme base16-onedark')
-- end
--
-- dark()
--
-- cmd("command TLight silent lua light()")
-- cmd("command TDark silent lua dark()")

require("nvim-autopairs").setup()

require('Comment').setup()

require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'base16',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {},
    always_divide_middle = true,
    globalstatus = false,
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {}
}

require('bufferline').setup {
  options = {
    mode = "buffers", -- set to "tabs" to only show tabpages instead
    -- numbers = "none" | "ordinal" | "buffer_id" | "both" | function({ ordinal, id, lower, raise }): string,
    numbers = "none",
    close_command = "bdelete! %d",       -- can be a string | function, see "Mouse actions"
    right_mouse_command = "bdelete! %d", -- can be a string | function, see "Mouse actions"
    left_mouse_command = "buffer %d",    -- can be a string | function, see "Mouse actions"
    middle_mouse_command = nil,          -- can be a string | function, see "Mouse actions"
    -- NOTE: this plugin is designed with this icon in mind,
    -- and so changing this is NOT recommended, this is intended
    -- as an escape hatch for people who cannot bear it for whatever reason
    indicator_icon = '▎',
    buffer_close_icon = '',
    modified_icon = '●',
    close_icon = '',
    left_trunc_marker = '',
    right_trunc_marker = '',
    --- name_formatter can be used to change the buffer's label in the bufferline.
    --- Please note some names can/will break the
    --- bufferline so use this at your discretion knowing that it has
    --- some limitations that will *NOT* be fixed.
    name_formatter = function(buf)  -- buf contains a "name", "path" and "bufnr"
      -- remove extension from markdown files for example
      if buf.name:match('%.md') then
        return vim.fn.fnamemodify(buf.name, ':t:r')
      end
    end,
    max_name_length = 18,
    max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
    tab_size = 18,
    diagnostics = "nvim_lsp",
    -- diagnostics = false | "nvim_lsp" | "coc",
    diagnostics_update_in_insert = false,
    diagnostics_indicator = function(count, level, diagnostics_dict, context)
      return "("..count..")"
    end,
    -- NOTE: this will be called a lot so don't do any heavy processing here
    -- custom_filter = function(buf_number, buf_numbers)
    --   -- filter out filetypes you don't want to see
    --   if vim.bo[buf_number].filetype ~= "<i-dont-want-to-see-this>" then
    --     return true
    --   end
    --   -- filter out by buffer name
    --   if vim.fn.bufname(buf_number) ~= "<buffer-name-I-dont-want>" then
    --     return true
    --   end
    --   -- filter out based on arbitrary rules
    --   -- e.g. filter out vim wiki buffer from tabline in your work repo
    --   if vim.fn.getcwd() == "<work-repo>" and vim.bo[buf_number].filetype ~= "wiki" then
    --     return true
    --   end
    --   -- filter out by it's index number in list (don't show first buffer)
    --   if buf_numbers[1] ~= buf_number then
    --     return true
    --   end
    -- end,
    -- offsets = {{filetype = "NvimTree", text = "File Explorer" | function , text_align = "left" | "center" | "right"}},
    color_icons = true, -- whether or not to add the filetype icon highlights
    -- show_buffer_icons = true | false, -- disable filetype icons for buffers
    -- show_buffer_close_icons = true | false,
    -- show_buffer_default_icon = true | false, -- whether or not an unrecognised filetype should show a default icon
    -- show_close_icon = true | false,
    -- show_tab_indicators = true | false,
    -- persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
    -- -- can also be a table containing 2 custom separators
    -- -- [focused and unfocused]. eg: { '|', '|' }
    -- separator_style = "slant" | "thick" | "thin" | { 'any', 'any' },
    -- enforce_regular_tabs = false | true,
    -- always_show_bufferline = true | false,
    -- sort_by = 'insert_after_current' |'insert_at_end' | 'id' | 'extension' | 'relative_directory' | 'directory' | 'tabs' | function(buffer_a, buffer_b)
    --   -- add custom logic
    --   return buffer_a.modified > buffer_b.modified
    -- end
  }
}

require("go").setup({
    goimport = 'gopls', -- if set to 'gopls' will use golsp format
    gofmt = 'gopls', -- if set to gopls will use golsp format
    max_line_len = 120,
    tag_transform = false,
    test_dir = '',
    comment_placeholder = ' ?  ',
    lsp_cfg = true, -- false: use your own lspconfig
    lsp_gofumpt = true, -- true: set default gofmt in gopls format to gofumpt
    lsp_on_attach = true, -- use on_attach from go.nvim
})

require("lsp_signature").setup()

local wk = require("which-key")
wk.register({
  g = {
    name = "go.nvim",
    a = { "<cmd>GoAddTag<cr>", "Run GoAddTag" },
    i = { "<cmd>GoIfErr<cr>", "Run GoIfErr" },
    f = {
      name = "GoFill",
      s = { "<cmd>GoFillStruct<cr>", "Run GoFillStruct" },
      w = { "<cmd>GoFillSwitch<cr>", "Run GoFillSwitch" },
    },
    r = { "<cmd>GoRmTag<cr>", "Run GoRmTag" },
    t = {
      name = "GoTest",
      a = { "<cmd>GoAddTest -F<cr>", "Run GoAddTest" },
      f = { "<cmd>GoTestFunc -F<cr>", "Run GoTestFunc" },
    },
  },
  v = { "<cmd>vsp|term<cr>", "Vertical Terminal"}
}, { prefix = "<space>" })

require("colorizer").setup()

-- lspkind Icon setup
require("lspkind").init({})

-- gitsigns setup
require("gitsigns").setup()

local nvim_lsp = require("lspconfig")
local util = require("lspconfig/util")
local configs = require("lspconfig/configs")

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
	local function buf_set_keymap(...)
		vim.api.nvim_buf_set_keymap(bufnr, ...)
	end
	local function buf_set_option(...)
		vim.api.nvim_buf_set_option(bufnr, ...)
	end

	--Enable completion triggered by <c-x><c-o>
	buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

	-- Mappings.
	local opts = { noremap = true, silent = true }

	-- See `:help vim.lsp.*` for documentation on any of the below functions
	buf_set_keymap("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)
	buf_set_keymap("n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
	buf_set_keymap("n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>", opts)
	buf_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
	buf_set_keymap("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
	buf_set_keymap("n", "<space>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
	buf_set_keymap("n", "<space>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
	buf_set_keymap("n", "<space>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", opts)
	buf_set_keymap("n", "<space>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
	buf_set_keymap("n", "<space>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
	buf_set_keymap("n", "<space>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
	buf_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
	-- buf_set_keymap("n", "<space>e", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", opts)
	buf_set_keymap("n", "[d", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", opts)
	buf_set_keymap("n", "]d", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", opts)
	buf_set_keymap("n", "<space>q", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", opts)
	buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
end

-- LSP this is needed for LSP completions in CSS along with the snippets plugin
-- local capabilities = vim.lsp.protocol.make_client_capabilities()
--
-- -- Code actions
-- capabilities.textDocument.codeAction = {
-- 	dynamicRegistration = false,
-- 	codeActionLiteralSupport = {
-- 		codeActionKind = {
-- 			valueSet = {
-- 				"",
-- 				"quickfix",
-- 				"refactor",
-- 				"refactor.extract",
-- 				"refactor.inline",
-- 				"refactor.rewrite",
-- 				"source",
-- 				"source.organizeImports",
-- 			},
-- 		},
-- 	},
-- }
--
-- -- Snippets
-- -- capabilities.textDocument.completion.completionItem.snippetSupport = false
-- capabilities.textDocument.completion.completionItem.snippetSupport = true
-- capabilities.textDocument.completion.completionItem.resolveSupport = {
-- 	properties = {
-- 		"documentation",
-- 		"detail",
-- 		"additionalTextEdits",
-- 	},
-- }

-- COQ
local coq = require "coq" -- add this

-- LSP Server config
nvim_lsp.gopls.setup(coq.lsp_ensure_capabilities({
	on_attach = on_attach,
	-- capabilities = capabilities,
	flags = {
		debounce_text_changes = 150,
	},
	cmd = { "gopls" },
	filetypes = { "go", "gomod" },
	root_dir = function(fname)
		return util.root_pattern("go.mod", ".git")(fname) or util.path.dirname(fname)
	end,
	settings = {
		gopls = {
			analyses = {
				unusedparams = true,
			},
			staticcheck = true,
		},
	},
}))

nvim_lsp.intelephense.setup(coq.lsp_ensure_capabilities({
	on_attach = on_attach,
	-- capabilities = capabilities,
	filetypes = { "php" },
	flags = {
		debounce_text_changes = 150,
	},
	root_dir = function(fname)
		return util.root_pattern("package.json", ".git")(fname) or util.path.dirname(fname)
	end,
}))

nvim_lsp.cssls.setup(coq.lsp_ensure_capabilities({
	on_attach = on_attach,
	-- capabilities = capabilities,
	flags = {
		debounce_text_changes = 150,
	},
	cmd = { "vscode-css-language-server", "--stdio" },
	filetypes = { "css", "scss", "less" },
	root_dir = function(fname)
		return util.root_pattern("package.json", ".git")(fname) or util.path.dirname(fname)
	end,
	settings = {
		css = {
			validate = true,
		},
		less = {
			validate = true,
		},
		scss = {
			lint = {
				idSelector = "warning",
				zeroUnits = "warning",
				duplicateProperties = "warning",
			},
			completion = {
				completePropertyWithSemicolon = true,
				triggerPropertyValueCompletion = true,
			},
		},
	},
}))

nvim_lsp.vuels.setup(coq.lsp_ensure_capabilities({
	on_attach = on_attach,
	-- capabilities = capabilities,
	flags = {
		debounce_text_changes = 150,
	},
	init_options = {
		config = {
			vetur = {
				ignoreProjectWarning = true,
			},
		},
	},
	filetypes = { "vue" },
	root_dir = function(fname)
		return util.root_pattern("package.json", "jsconfig.json", ".git")(fname) or util.path.dirname(fname)
	end,
}))

nvim_lsp.tsserver.setup(coq.lsp_ensure_capabilities({
	on_attach = on_attach,
	-- capabilities = capabilities,
	flags = {
		debounce_text_changes = 150,
	},
	cmd = { "typescript-language-server", "--stdio" },
	filetypes = {
		"javascript",
		"javascriptreact",
		"javascript.jsx",
		"typescript",
		"typescriptreact",
		"typescript.tsx",
	},
	root_dir = function(fname)
		return util.root_pattern("tsconfig.json")(fname)
			or util.root_pattern("package.json", "jsconfig.json", ".git")(fname)
			or util.path.dirname(fname)
	end,
}))

nvim_lsp.pyright.setup(coq.lsp_ensure_capabilities({
	on_attach = on_attach,
	-- capabilities = capabilities,
	flags = {
		debounce_text_changes = 150,
	},
	filetypes = { "python" },
	root_dir = function(fname)
		return util.root_pattern(".git")(fname) or util.path.dirname(fname)
	end,
}))

nvim_lsp.html.setup(coq.lsp_ensure_capabilities({
	on_attach = on_attach,
	-- capabilities = capabilities,
	flags = {
		debounce_text_changes = 150,
	},
	cmd = { "vscode-html-language-server", "--stdio" },
	filetypes = { "html" },
	init_options = {
		configurationSection = { "html", "css", "javascript" },
		embeddedLanguages = {
			css = true,
			javascript = true,
		},
	},
	root_dir = function(fname)
		return util.root_pattern("package.json", "jsconfig.json", ".git")(fname) or util.path.dirname(fname)
	end,
	settings = {},
}))

-- LSP Prevents inline buffer annotations
-- vim.lsp.diagnostic.show_line_diagnostics()
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
	-- Enable underline, use default values
	underline = true,
	-- Enable virtual text, override spacing to 4
	virtual_text = {
		spacing = 4,
		prefix = "~",
	},
	-- Use a function to dynamically turn signs off
	-- and on, using buffer local variables
	signs = function(bufnr, client_id)
		local ok, result = pcall(vim.api.nvim_buf_get_var, bufnr, "show_signs")
		-- No buffer local variable set, so just enable by default
		if not ok then
			return true
		end

		return result
	end,
	-- Disable a feature
	update_in_insert = false,
})

-- LSP Saga config & keys
local saga = require("lspsaga")
saga.init_lsp_saga({
	code_action_prompt = {
		enable = true,
		sign = true,
		sign_priority = 40,
		virtual_text = false,
	},
	code_action_icon = " ",
	definition_preview_icon = "  ",
	diagnostic_header_icon = "   ",
	error_sign = " ",
	finder_definition_icon = "  ",
	finder_reference_icon = "  ",
	hint_sign = "⚡",
	infor_sign = "",
	warn_sign = "",
})

map("n", "<leader>cf", ":Lspsaga lsp_finder<CR>", { silent = true })
map("n", "<leader>ca", ":Lspsaga code_action<CR>", { silent = true })
map("v", "<leader>ca", ":<C-U>Lspsaga range_code_action<CR>", { silent = true })
map("n", "<leader>ch", ":Lspsaga hover_doc<CR>", { silent = true })
map("n", "<leader>ck", '<cmd>lua require("lspsaga.action").smart_scroll_with_saga(-1)<CR>', { silent = true })
map("n", "<leader>cj", '<cmd>lua require("lspsaga.action").smart_scroll_with_saga(1)<CR>', { silent = true })
map("n", "<leader>cs", ":Lspsaga signature_help<CR>", { silent = true })
-- map("n", "<leader>ci", ":Lspsaga show_line_diagnostics<CR>", {silent = true})
map("n", "<leader>cn", ":Lspsaga diagnostic_jump_next<CR>", { silent = true })
map("n", "<leader>cp", ":Lspsaga diagnostic_jump_prev<CR>", { silent = true })
map("n", "<leader>cr", ":Lspsaga rename<CR>", { silent = true })
map("n", "<leader>cd", ":Lspsaga preview_definition<CR>", { silent = true })

-- Setup treesitter
require("nvim-treesitter.configs").setup({
	ensure_installed = {
		"css",
		"dockerfile",
		"go",
		"gomod",
		"gowork",
		"godot_resource",
		"html",
		"javascript",
		"json",
		"lua",
		"php",
		"python",
		"scss",
		"tsx",
		"typescript",
		"vue",
	},
	highlight = {
		enable = true,
		disable = { "php" },
	},
	indent = {
		enable = true,
		disable = { "blade", "vue" },
	},
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = "gnn",
			node_incremental = "gn[",
			scope_incremental = "gn]",
			node_decremental = "gn)",
		},
	},
	textobjects = {
		select = {
			enable = true,
			lookahead = true,
			keymaps = {
				["af"] = "@function.outer",
				["if"] = "@function.inner",
				["ac"] = "@class.outer",
				["ic"] = "@class.inner",
			},
		},
		lsp_interop = {
			enable = true,
			border = "none",
			peek_definition_code = {
				["<leader>df"] = "@function.outer",
				["<leader>dF"] = "@class.outer",
			},
		},
		move = {
			enable = true,
			set_jumps = true, -- whether to set jumps in the jumplist
			goto_next_start = {
				["]m"] = "@function.outer",
				["]]"] = "@class.outer",
			},
			goto_next_end = {
				["]M"] = "@function.outer",
				["]["] = "@class.outer",
			},
			goto_previous_start = {
				["[m"] = "@function.outer",
				["[["] = "@class.outer",
			},
			goto_previous_end = {
				["[M"] = "@function.outer",
				["[]"] = "@class.outer",
			},
		},
	},
	context_commentstring = {
		enable = true,
		enable_autocmd = false,
		config = {
			css = "// %s",
			javascript = {
				__default = "// %s",
				jsx_element = "{/* %s */}",
				jsx_fragment = "{/* %s */}",
				jsx_attribute = "// %s",
				comment = "// %s",
			},
		},
	},
	playground = {
		enable = true,
		disable = {},
		updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
		persist_queries = false, -- Whether the query persists across vim sessions
		keybindings = {
			toggle_query_editor = "o",
			toggle_hl_groups = "i",
			toggle_injected_languages = "t",
			toggle_anonymous_nodes = "a",
			toggle_language_display = "I",
			focus_language = "f",
			unfocus_language = "F",
			update = "R",
			goto_node = "<cr>",
			show_help = "?",
		},
	},
})

g.netrw_liststyle = 3 -- Tree style Netrw

local actions = require("lir.actions")
local mark_actions = require("lir.mark.actions")
local clipboard_actions = require("lir.clipboard.actions")

require("lir").setup({
	show_hidden_files = true,
	devicons_enable = true,
	mappings = {
		["l"] = actions.edit,
		["<CR>"] = actions.edit,
		["<C-s>"] = actions.split,
		["<C-v>"] = actions.vsplit,
		["<C-t>"] = actions.tabedit,

		["h"] = actions.up,
		["q"] = actions.quit,
		["<ESC>"] = actions.quit,

		["A"] = actions.mkdir,
		["a"] = actions.newfile,
		["r"] = actions.rename,
		["@"] = actions.cd,
		["Y"] = actions.yank_path,
		["."] = actions.toggle_show_hidden,
		["D"] = actions.delete,

		["J"] = function()
			mark_actions.toggle_mark()
			vim.cmd("normal! j")
		end,
		["x"] = clipboard_actions.cut,
		["c"] = clipboard_actions.copy,
		["p"] = clipboard_actions.paste,
		["d"] = function()
			mark_actions.toggle_mark()
			clipboard_actions.cut()
		end,
	},
	float = {
		winblend = 0,
		curdir_window = {
			enable = false,
			highlight_dirname = false,
		},
	},
	hide_cursor = true,
})

-- use visual mode
function _G.LirSettings()
	vim.api.nvim_buf_set_keymap(
		0,
		"x",
		"J",
		':<C-u>lua require"lir.mark.actions".toggle_mark("v")<CR>',
		{ noremap = true, silent = true }
	)

	-- echo cwd
	vim.api.nvim_echo({ { vim.fn.expand("%:p"), "Normal" } }, false, {})
end

vim.cmd([[augroup lir-settings]])
vim.cmd([[  autocmd!]])
vim.cmd([[  autocmd Filetype lir :lua LirSettings()]])
vim.cmd([[augroup END]])
map("", "<space><space>", "<cmd>lua require'lir.float'.toggle()<CR>")

-- Open nvimrc file
map("n", "<leader>v", "<cmd>e $MYVIMRC<CR>")

-- Source nvimrc file
map("n", "<leader>sv", ":source $MYVIMRC<CR>")

-- Quick new file
-- map("n", "<leader>n", "<cmd>enew<CR>")

-- Easy select all of file
map("n", "<leader>a", "ggVG<c-$>")

-- Make visual yanks place the cursor back where started
map("v", "y", "ygv<Esc>")

-- Easier file save
map("n", "<leader>w", "<cmd>w<CR>")

-- Close buffer
-- map("n", "<leader>c", ":Bclose<CR>")
map("n", "<leader>ba", "<cmd>%bd|e#|bd#<CR>")
map("n", "<leader>bd", "<cmd>bd<CR>")
map("t", "<leader>c", "exit<CR>")
map("n", "<leader>q", "<cmd>q<CR>")

-- Wrap selection with ''
map("v", "<leader>'", "<esc>`>a'<esc>`<i'<esc>")
-- Wrap selection with ""
map("v", '<leader>"', '<esc>`>a"<esc>`<i"<esc>')
-- Wrap selection with ()
map("v", "<leader>(", "<esc>`>a)<esc>`<i(<esc>")
-- Wrap selection with []
map("v", "<leader>[", "<esc>`>a]<esc>`<i[<esc>")
-- Wrap selection with {}
map("v", "<leader>{", "<esc>`>a}<esc>`<i{<esc>")

-- moving text
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")
map("i", "<c-j>", "<esc>:m .+1<CR>==a")
map("i", "<c-k>", "<esc>:m .-2<CR>==a")
map("n", "<leader>j", ":m .+1<CR>==")
map("n", "<leader>k", ":m .-2<CR>==")

-- copy to end of line
map("n", "Y", "y$")

-- undo breakpoints
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

-- jumplist mutations
map("i", ",", ",<c-g>u")
map("i", ".", ".<c-g>u")

--After searching, pressing escape stops the highlight
map("n", "<esc>", ":noh<cr><esc>", { silent = true })

-- Telescope Global remapping
local actions = require("telescope.actions")
local action_set = require("telescope.actions.set")

require("telescope").setup({
	defaults = {
		prompt_prefix = "> ",
		selection_caret = "> ",
		entry_prefix = "  ",
		initial_mode = "insert",
		selection_strategy = "reset",
		sorting_strategy = "ascending",
		layout_strategy = "horizontal",
		layout_config = {
			horizontal = {
				prompt_position = "top",
				preview_width = 0.55,
				results_width = 0.8,
			},
			vertical = {
				mirror = false,
			},
			width = 0.87,
			height = 0.80,
			preview_cutoff = 120,
		},
		mappings = {
			i = {
				["<C-h>"] = "which_key",
				["<esc>"] = actions.close,
			},
		},
		file_sorter = require("telescope.sorters").get_fuzzy_file,
		file_ignore_patterns = { "public/*", "node_modules/*", ".git" },
		generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
		winblend = 0,
		border = {},
		borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
		color_devicons = true,
		use_less = true,
		path_display = { "absolute" },
		set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
		file_previewer = require("telescope.previewers").vim_buffer_cat.new,
		grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
		qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
		-- Developer configurations: Not meant for general override
		buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
	},
	pickers = {
		buffers = {
			sort_lastused = true,
			mappings = {
				i = {
					["<C-w>"] = "delete_buffer",
				},
				n = {
					["<C-w>"] = "delete_buffer",
				},
			},
		},
	},
})

map("n", "<leader>p", '<cmd>lua require("telescope.builtin").find_files(require("telescope.themes"))<cr>')
map("n", "<leader>r", '<cmd>lua require("telescope.builtin").registers()<cr>')
map("n", "<leader>g", '<cmd>lua require("telescope").extensions.live_grep_args.live_grep_args()<cr>')
map("n", "<leader>,", '<cmd>lua require("telescope.builtin").buffers(require("telescope.themes"))<cr>')
map("n", "<leader>f", '<cmd>lua require("telescope.builtin").file_browser(require("telescope.themes"))<cr>')
map("n", "<leader>i", '<cmd>lua require("telescope.builtin").git_status(require("telescope.themes"))<cr>')

map("n", "<Leader>=", ":Tabularize /=<CR>")
map("v", "<Leader>=", ":Tabularize /=<CR>")
map("n", "<Leader>:", ":Tabularize /:\zs<CR>")
map("v", "<Leader>:", ":Tabularize /:\zs<CR>")
map("n", "<Leader>>", ":Tabularize /=><CR>")
map("v", "<Leader>>", ":Tabularize /=><CR>")

opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"

cmd("autocmd User TelescopePreviewerLoaded setlocal wrap") -- disabled in visual mode

-------------------- COMMANDS ------------------------------
cmd("au TextYankPost * lua vim.highlight.on_yank {on_visual = true}") -- disabled in visual mode
cmd([[set shortmess+=c]])

vim.api.nvim_exec(
  [[
      let g:python3_host_prog = '/usr/local/bin/python3'
  ]],
  false
)

vim.api.nvim_exec([[
augroup FormatAutogroup
  autocmd!
  autocmd BufEnter,BufNewFile,BufRead *.blade.php set filetype=blade
  autocmd BufEnter,BufNewFile,BufRead *.blade.php set indentexpr=
  autocmd BufEnter,BufNewFile,BufRead Dockerfile* set filetype=dockerfile
  autocmd FileType blade :setlocal foldmethod=indent

  ""autocmd BufEnter,BufNewFile,BufRead *.php set autoindent
  ""autocmd BufEnter,BufNewFile,BufRead *.php set smartindent

  ""autocmd BufWinLeave,FocusLost,WinLeave *.vue,*.json,*.php,*.js,*.ts,*.tsx,*.css,*.scss,*.html,*.lua silent :up
  ""autocmd BufWritePost *.vue,*.json,*.php,*.js,*.ts,*.tsx,*.css,*.scss,*.html,*.lua : FormatWrite
augroup END
]], true)

vim.api.nvim_exec([[
  function! LaravelView()
    let currentLine = getline(".")
    let viewPath = matchstr(currentLine, '\c(\([''"]\)\zs.\{-}\ze\1')
    let viewPath = substitute(viewPath,'\.','/','ge')
    exe 'cd `git rev-parse --show-toplevel`'
    ""exe 'cd' fnameescape(fnamemodify(finddir('artisan', escape(expand('%:p:h'), ' ') . ';'), ':h'))
    exe 'cd backend'
    let bladePath = 'resources/views/'.viewPath.'.blade.php'
    echo bladePath
    if empty(glob(bladePath))
      echo "File doesn't exists."
    else
      exe 'e '.bladePath
      ""exe 'e resources/views/'.viewPath.'.blade.php'
    endif
  endfunction
  noremap gv :call LaravelView()<CR>
]], true)

vim.api.nvim_exec([[
  function! WindowDiff()
    exe 'windo diffthis'
  endfunction
  noremap <leader>dd :call WindowDiff()<CR>
]], true)

vim.api.nvim_exec([[ autocmd BufWritePre *.go :silent! lua require('go.format').goimport() ]], false)

cmd("COQnow -s")
