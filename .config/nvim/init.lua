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
opt.updatetime = 250 -- don't give |ins-completion-menu| messages.
opt.wrap = false
opt.swapfile = false

local function map(mode, lhs, rhs, opts)
  local options = {noremap = true}
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Map leader to space
g.mapleader = ","

-- Plugins
require("packer").startup(
  function()
    -- use "akinsho/nvim-toggleterm.lua"
    -- use "alvan/vim-closetag"
    -- use "arcticicestudio/nord-vim"
    use "b3nj5m1n/kommentary"
    use "JoosepAlviste/nvim-ts-context-commentstring"
    use "editorconfig/editorconfig-vim"
    use "folke/tokyonight.nvim"
    use "folke/which-key.nvim"
    -- use {"glacambre/firenvim", run = function() fn["firenvim#install"](0) end }
    use "glepnir/lspsaga.nvim"
    -- use "glepnir/dashboard-nvim"
    use "godlygeek/tabular"
    use "hoob3rt/lualine.nvim"
    use "hrsh7th/nvim-compe"
    use "hrsh7th/vim-vsnip"
    use "hrsh7th/vim-vsnip-integ"
    use "jiangmiao/auto-pairs"
    use "jwalton512/vim-blade"
    use "kyazdani42/nvim-web-devicons"
    use "kyazdani42/nvim-tree.lua"
    use {'lewis6991/gitsigns.nvim', requires = {'nvim-lua/plenary.nvim'}}
    -- use "mfussenegger/nvim-dap"
    -- use "mhartington/formatter.nvim"
    use "neovim/nvim-lspconfig"
    use "norcalli/nvim-colorizer.lua"
    use "nvim-lua/popup.nvim"
    use "nvim-telescope/telescope.nvim"
    use {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"}
    use {"nvim-treesitter/playground", run = ":TSInstall query"}
    use "nvim-treesitter/nvim-treesitter-textobjects"
    use "onsails/lspkind-nvim"
    use "phaazon/hop.nvim"
    -- use "p00f/nvim-ts-rainbow"
    use "rafamadriz/friendly-snippets"
    -- use "rbgrouleff/bclose.vim"
    use "rmagatti/auto-session"
    use "terryma/vim-multiple-cursors"
    use "tpope/vim-repeat"
    -- use "tpope/vim-surround"
    -- use "wellle/targets.vim"
    use "wbthomason/packer.nvim"

    -- use "tpope/vim-dadbod"
    -- use "kristijanhusak/vim-dadbod-completion"
    -- use "kristijanhusak/vim-dadbod-ui"

    use {
      "folke/trouble.nvim",
      requires = "kyazdani42/nvim-web-devicons",
      config = function()
        require("trouble").setup {
          position = "bottom", -- position of the list can be: bottom, top, left, right
          height = 10, -- height of the trouble list when position is top or bottom
          width = 50, -- width of the list when position is left or right
          icons = true, -- use devicons for filenames
          mode = "lsp_workspace_diagnostics", -- "lsp_workspace_diagnostics", "lsp_document_diagnostics", "quickfix", "lsp_references", "loclist"
          fold_open = "?", -- icon used for open folds
          fold_closed = "?", -- icon used for closed folds
          action_keys = { -- key mappings for actions in the trouble list
              -- map to {} to remove a mapping, for example:
              -- close = {},
              close = "q", -- close the list
              cancel = "<esc>", -- cancel the preview and get back to your last window / buffer / cursor
              refresh = "r", -- manually refresh
              jump = {"<cr>", "<tab>"}, -- jump to the diagnostic or open / close folds
              open_split = { "<c-x>" }, -- open buffer in new split
              open_vsplit = { "<c-v>" }, -- open buffer in new vsplit
              open_tab = { "<c-t>" }, -- open buffer in new tab
              jump_close = {"o"}, -- jump to the diagnostic and close the list
              toggle_mode = "m", -- toggle between "workspace" and "document" diagnostics mode
              toggle_preview = "P", -- toggle auto_preview
              hover = "K", -- opens a small popup with the full multiline message
              preview = "p", -- preview the diagnostic location
              close_folds = {"zM", "zm"}, -- close all folds
              open_folds = {"zR", "zr"}, -- open all folds
              toggle_fold = {"zA", "za"}, -- toggle fold of current file
              previous = "k", -- preview item
              next = "j" -- next item
          },
          indent_lines = true, -- add an indent guide below the fold icons
          auto_open = false, -- automatically open the list when you have diagnostics
          auto_close = false, -- automatically close the list when you have no diagnostics
          auto_preview = true, -- automatically preview the location of the diagnostic. <esc> to close preview and go back to last window
          auto_fold = false, -- automatically fold a file trouble list at creation
          signs = {
              -- icons / text used for a diagnostic
              error = "?",
              warning = "?",
              hint = "?",
              information = "?",
              other = "?"
          },
          use_lsp_diagnostic_signs = false -- enabling this will use the signs defined in your lsp client
      }
      end
    }

    use {'pwntester/octo.nvim', config=function()
      require"octo".setup()
    end}
    use "ray-x/lsp_signature.nvim"

  end
)

require "lsp_signature".setup()

require("which-key").setup()

require'colorizer'.setup()

cmd[[colorscheme tokyonight]]

-- lspkind Icon setup
require("lspkind").init({})

-- gitsigns setup
require("gitsigns").setup()

-- Hop
require "hop".setup()
map("n", "<leader>j", "<cmd>lua require'hop'.hint_words()<cr>")
map("n", "<leader>l", "<cmd>lua require'hop'.hint_lines()<cr>")
map("v", "<leader>j", "<cmd>lua require'hop'.hint_words()<cr>")
map("v", "<leader>l", "<cmd>lua require'hop'.hint_lines()<cr>")

require('kommentary.config').configure_language("default", {
    prefer_single_line_comments = true,
    hook_function = function()
      require('ts_context_commentstring.internal').update_commentstring()
    end,
})

-- Session
require("auto-session").setup(
  {
    log_level = "info",
    auto_session_enable_last_session = false,
    auto_session_root_dir = vim.fn.stdpath("data") .. "/sessions/",
    auto_session_enabled = true,
    auto_save_enabled = true,
    auto_restore_enabled = true,
    auto_session_suppress_dirs = nil
  }
)

-- require("toggleterm").setup {
--   open_mapping = [[<c-\>]],
--   hide_numbers = true, -- hide the number column in toggleterm buffers
--   shade_filetypes = {},
--   shade_terminals = false,
--   start_in_insert = true,
--   insert_mappings = true, -- whether or not the open mapping applies in insert mode
--   persist_size = true,
--   close_on_exit = true, -- close the terminal window when the process exits
--   shell = vim.o.shell, -- change the default shell
-- }

-- -- formatter
-- local prettier = function()
--   return {
--     exe = "prettier",
--     args = {"--stdin-filepath", vim.api.nvim_buf_get_name(0)},
--     stdin = true
--   }
-- end

-- local prettierPhp = function()
--   return {
--     exe = "prettier",
--     args = {
--       "--php-version",
--       "7.3",
--       "--stdin-filepath",
--       vim.api.nvim_buf_get_name(0),
--       "--print-width=10000",
--       "--single-quote=true",
--       "--trailing-comma-php=false"
--     },
--     stdin = true
--   }
-- end

-- require("formatter").setup(
--   {
--     logging = false,
--     filetype = {
--       javascript = {prettier},
--       typescript = {prettier},
--       html = {prettier},
--       css = {prettier},
--       scss = {prettier},
--       vue = {prettier},
--       -- php = {prettierPhp},
--       blade = {
--         -- blade-formatter
--         function()
--           return {
--             exe = "blade-formatter",
--             args = {"--indent-size", 2, "--wrap-line-length", 10000, "--end-with-newline", 0, "--write", "--stdin"},
--             stdin = true
--           }
--         end
--       },
--       php = {
--         -- php
--         function()
--           return {
--             exe = "php-cs-fixer",
--             args = {"fix", vim.api.nvim_buf_get_name(0), "--quiet", "--rules=@PSR2", "--using-cache=no"},
--             stdin = true
--           }
--         end
--       },
--       lua = {
--         -- luafmt
--         function()
--           return {
--             exe = "luafmt",
--             args = {"--indent-count", 2, "--line-width", 10000, "--stdin"},
--             stdin = true
--           }
--         end
--       }
--     }
--   }
-- )
-- end formatter

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
  local opts = {noremap = true, silent = true}

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
  buf_set_keymap("n", "<space>e", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", opts)
  buf_set_keymap("n", "[d", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", opts)
  buf_set_keymap("n", "]d", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", opts)
  buf_set_keymap("n", "<space>q", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", opts)
  buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
end

-- LSP this is needed for LSP completions in CSS along with the snippets plugin
local capabilities = vim.lsp.protocol.make_client_capabilities()

-- Code actions
-- capabilities.textDocument.codeAction = {
--   dynamicRegistration = false,
--   codeActionLiteralSupport = {
--     codeActionKind = {
--       valueSet = {
--         "",
--         "quickfix",
--         "refactor",
--         "refactor.extract",
--         "refactor.inline",
--         "refactor.rewrite",
--         "source",
--         "source.organizeImports"
--       }
--     }
--   }
-- }

-- Snippets
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.resolveSupport = {
  properties = {
    "documentation",
    "detail",
    "additionalTextEdits"
  }
}

-- LSP Server config
nvim_lsp.intelephense.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = {"php"},
  flags = {
    debounce_text_changes = 150
  },
  root_dir = function(fname)
    return util.root_pattern("package.json", ".git")(fname) or util.path.dirname(fname)
  end,
}

nvim_lsp.cssls.setup {
  on_attach = on_attach,
  flags = {
    debounce_text_changes = 150
  },
  cmd = {"vscode-css-language-server", "--stdio"},
  filetypes = {"css", "scss", "less"},
  root_dir = function(fname)
    return util.root_pattern("package.json", ".git")(fname) or util.path.dirname(fname)
  end,
  capabilities = capabilities,
  settings = {
    css = {
      validate = true
    },
    less = {
      validate = true
    },
    scss = {
      lint = {
        idSelector = "warning",
        zeroUnits = "warning",
        duplicateProperties = "warning"
      },
      completion = {
        completePropertyWithSemicolon = true,
        triggerPropertyValueCompletion = true
      }
    }
  }
}

nvim_lsp.vuels.setup {
  on_attach = on_attach,
  flags = {
    debounce_text_changes = 150
  },
  init_options = {
    config = {
      vetur = {
        ignoreProjectWarning = true
      }
    }
  },
  capabilities = capabilities,
  filetypes = {"vue"},
  root_dir = function(fname)
    return util.root_pattern("package.json", "jsconfig.json", ".git")(fname) or util.path.dirname(fname)
  end,
}

nvim_lsp.tsserver.setup {
  on_attach = on_attach,
  flags = {
    debounce_text_changes = 150
  },
  capabilities = capabilities,
  cmd = {"typescript-language-server", "--stdio"},
  filetypes = {"javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx"},
  root_dir = function(fname)
    return util.root_pattern("tsconfig.json")(fname) or util.root_pattern("package.json", "jsconfig.json", ".git")(fname) or util.path.dirname(fname)
  end
}

nvim_lsp.html.setup {
  on_attach = on_attach,
  flags = {
    debounce_text_changes = 150
  },
  capabilities = capabilities,
  cmd = {"vscode-html-language-server", "--stdio"},
  filetypes = {"html"},
  init_options = {
    configurationSection = {"html", "css", "javascript"},
    embeddedLanguages = {
      css = true,
      javascript = true
    }
  },
  root_dir = function(fname)
    return util.root_pattern("package.json", "jsconfig.json", ".git")(fname) or util.path.dirname(fname)
  end,
  settings = {}
}

if not nvim_lsp.emmet_ls then
  configs.emmet_ls = {
    default_config = {
      cmd = {'emmet-ls', '--stdio'};
      filetypes = {'html', 'css', 'vue'};
      root_dir = function(fname)
        return util.root_pattern("package.json", "jsconfig.json", ".git")(fname) or util.path.dirname(fname)
      end;
      settings = {};
    };
  }
end
nvim_lsp.emmet_ls.setup{ capabilities = capabilities;}

nvim_lsp.gopls.setup {
  on_attach = on_attach,
  flags = {
    debounce_text_changes = 150
  },
  capabilities = capabilities,
  cmd = {"gopls"},
  filetypes = {"go", "gomod"},
  root_dir = function(fname)
    return util.root_pattern("go.mod", ".git")(fname) or util.path.dirname(fname)
  end,
  settings = {
    gopls = {
      analyses = {
        unusedparams = true
      },
      staticcheck = true
    }
  }
}

-- LSP Prevents inline buffer annotations
vim.lsp.diagnostic.show_line_diagnostics()
vim.lsp.handlers["textDocument/publishDiagnostics"] =
  vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics,
  {
    virtual_text = false
  }
)

-- LSP Saga config & keys
local saga = require "lspsaga"
saga.init_lsp_saga {
  code_action_icon = " ",
  definition_preview_icon = "  ",
  dianostic_header_icon = "   ",
  error_sign = " ",
  finder_definition_icon = "  ",
  finder_reference_icon = "  ",
  hint_sign = "⚡",
  infor_sign = "",
  warn_sign = ""
}

map("n", "<leader>cf", ":Lspsaga lsp_finder<CR>", {silent = true})
map("n", "<leader>ca", ":Lspsaga code_action<CR>", {silent = true})
map("v", "<leader>ca", ":<C-U>Lspsaga range_code_action<CR>", {silent = true})
map("n", "<leader>ch", ":Lspsaga hover_doc<CR>", {silent = true})
map("n", "<leader>ck", '<cmd>lua require("lspsaga.action").smart_scroll_with_saga(-1)<CR>', {silent = true})
map("n", "<leader>cj", '<cmd>lua require("lspsaga.action").smart_scroll_with_saga(1)<CR>', {silent = true})
map("n", "<leader>cs", ":Lspsaga signature_help<CR>", {silent = true})
map("n", "<leader>ci", ":Lspsaga show_line_diagnostics<CR>", {silent = true})
map("n", "<leader>cn", ":Lspsaga diagnostic_jump_next<CR>", {silent = true})
map("n", "<leader>cp", ":Lspsaga diagnostic_jump_prev<CR>", {silent = true})
map("n", "<leader>cr", ":Lspsaga rename<CR>", {silent = true})
map("n", "<leader>cd", ":Lspsaga preview_definition<CR>", {silent = true})

-- Setup treesitter
require "nvim-treesitter.configs".setup {
  ensure_installed = {
    "css",
    "dockerfile",
    "go",
    "gomod",
    "html",
    "javascript",
    "json",
    "lua",
    "php",
    "scss",
    "tsx",
    "typescript",
    "vue"
  },
  highlight = {
    enable = true
  },
  incremental_selection = {
    enable = true,
    keymaps = { init_selection = "gnn", node_incremental = "gn[", scope_incremental = "gn]", node_decremental = "gn)" }
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
      }
    }
  },
  -- rainbow = {
  --   enable = true,
  --   extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
  --   max_file_lines = 1000, -- Do not enable for files with more than 1000 lines, int
  -- },
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
    config = {
      css = '// %s',
      javascript = {
        __default = '// %s',
        jsx_element = '{/* %s */}',
        jsx_fragment = '{/* %s */}',
        jsx_attribute = '// %s',
        comment = '// %s'
      }
    }
  },
  playground = {
    enable = true,
    disable = {},
    updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
    persist_queries = false, -- Whether the query persists across vim sessions
    keybindings = {
      toggle_query_editor = 'o',
      toggle_hl_groups = 'i',
      toggle_injected_languages = 't',
      toggle_anonymous_nodes = 'a',
      toggle_language_display = 'I',
      focus_language = 'f',
      unfocus_language = 'F',
      update = 'R',
      goto_node = '<cr>',
      show_help = '?',
    },
  }
}

-- local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
-- parser_config.javascript.used_by = "blade"
-- parser_config.html.used_by = "blade"
-- parser_config.css.used_by = "blade"
-- parser_config.vue.used_by = "blade"


g.netrw_liststyle = 3 -- Tree style Netrw

-- nvim-dashboard
--[[ g.dashboard_default_executive = "telescope"
g.dashboard_preview_command = "cat"
g.dashboard_preview_pipeline = "lolcat"
g.dashboard_preview_file = "~/.config/nvim/neovim-block.cat"
g.dashboard_preview_file_height = 10
g.dashboard_preview_file_width = 200 ]]
-- g.dashboard_preview_file = "~/.config/nvim/neovim.cat"
-- g.dashboard_preview_file_height = 14
-- g.dashboard_preview_file = "~/.config/nvim/doom.cat"
-- g.dashboard_preview_file_height = 20

--[[ map("n", "<space>fh", ":DashboardFindHistory<CR>")
map("n", "<space>ff", ":DashboardFindFile<CR>")
map("n", "<space>tc", ":DashboardChangeColorscheme<CR>")
map("n", "<space>fa", ":DashboardFindWord<CR>")
map("n", "<space>fb", ":DashboardJumpMark<CR>")
map("n", "<space>sl", ":SessionLoad<CR>")
map("n", "<space>cn", ":DashboardNewFile<CR>") ]]

require "lualine".setup {
  options = {
    icons_enabled = true,
    theme = "tokyonight",
    component_separators = {" ", " "},
    section_separators = {"", ""},
    disabled_filetypes = {}
  },
  sections = {
    lualine_a = {"mode", "paste"},
    lualine_b = {
      {"branch", icon = ""},
      {"diff", color_added = "#a7c080", color_modified = "#ffdf1b", color_removed = "#ff6666"}
    },
    lualine_c = {
      {"diagnostics", sources = {"nvim_lsp"}},
      function()
        return "%="
      end,
      {"filename", path = 1}
    },
    lualine_x = {"filetype"},
    lualine_y = {
      {
        "progress"
      }
    },
    lualine_z = {
      {
        "location",
        icon = ""
      }
    }
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {"filename"},
    lualine_x = {"location"},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {}
}

-- Compe setup start
require "compe".setup {
  enabled = true,
  autocomplete = true,
  debug = false,
  min_length = 1,
  preselect = "enable",
  throttle_time = 80,
  source_timeout = 200,
  resolve_timeout = 800,
  incomplete_delay = 400,
  max_abbr_width = 100,
  max_kind_width = 100,
  max_menu_width = 100,
  documentation = {
    border = {"", "", "", " ", "", "", "", " "}, -- the border option is the same as `|help nvim_open_win|`
    winhighlight = "NormalFloat:CompeDocumentation,FloatBorder:CompeDocumentationBorder",
    max_width = 120,
    min_width = 60,
    max_height = math.floor(vim.o.lines * 0.3),
    min_height = 1
  },
  source = {
    path = true,
    buffer = true,
    calc = true,
    nvim_lsp = true,
    nvim_lua = true,
    vsnip = true,
    luasnip = true,
    -- vim_dadbod_completion = true
  }
}

local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
    local col = vim.fn.col('.') - 1
    return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
end

-- Use (s-)tab to:
--- move to prev/next item in completion menuone
--- jump to prev/next snippet's placeholder
_G.tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-n>"
  elseif vim.fn['vsnip#available'](1) == 1 then
    return t "<Plug>(vsnip-expand-or-jump)"
  elseif check_back_space() then
    return t "<Tab>"
  else
    return vim.fn['compe#complete']()
  end
end
_G.s_tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-p>"
  elseif vim.fn['vsnip#jumpable'](-1) == 1 then
    return t "<Plug>(vsnip-jump-prev)"
  else
    -- If <S-Tab> is not working in your terminal, change it to <C-h>
    return t "<S-Tab>"
  end
end

map("i", "<CR>", "compe#confirm({ 'keys': '<CR>', 'select': v:true })", {expr = true})
map("i", "<Tab>", "v:lua.tab_complete()", {expr = true, noremap = false})
map("s", "<Tab>", "v:lua.tab_complete()", {expr = true, noremap = false})
map("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true, noremap = false})
map("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true, noremap = false})

-- End Compe related setup

map("", "<space><space>", ":NvimTreeToggle<CR>")

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

-- Escape in terminal mode takes you to normal mode
-- tnoremap <silent><leader><Esc> <C-\><C-n>
-- map("t", "<silent><Esc>", "<C-a><C-n>")

-- Tab to switch buffers in Normal mode
-- map("n", "<Tab>", ":bnext<CR>")
-- map("n", "<S-Tab>", ":bprevious<CR>")

-- Line bubbling
-- Use these two if you don't have prettier
--[[ map("n", "<c-j>", "<cmd>m .+1<CR>", {silent = true})
map("n", "<c-k>", "<cmd>m .-2<CR>", {silent = true})
map("i", "<c-j> <Esc>", "<cmd>m .+1<CR>==gi", {silent = true})
map("i", "<c-k> <Esc>", "<cmd>m .-2<CR>==gi", {silent = true})
map("v", "<c-j>", "<cmd>m +1<CR>gv=gv", {silent = true})
map("v", "<c-k>", "<cmd>m -2<CR>gv=gv", {silent = true}) ]]
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

--Auto close tags
-- map("i", ",/", "</<C-X><C-O>")

--After searching, pressing escape stops the highlight
map("n", "<esc>", ":noh<cr><esc>", {silent = true})

-- Telescope Global remapping
local actions = require("telescope.actions")
local action_set = require "telescope.actions.set"
local trouble = require("trouble.providers.telescope")

require("telescope").setup {
  defaults = {
    vimgrep_arguments = {
      "rg",
      "--hidden",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case"
    },
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
        ["<esc>"] = actions.close,
        ["<c-t>"] = trouble.open_with_trouble,
      },
      n = { ["<c-t>"] = trouble.open_with_trouble },
    },
    file_sorter = require "telescope.sorters".get_fuzzy_file,
    file_ignore_patterns = {"public/*", "node_modules/*", "vendor/*", ".git"},
    generic_sorter = require "telescope.sorters".get_generic_fuzzy_sorter,
    winblend = 0,
    border = {},
    borderchars = {"─", "│", "─", "│", "╭", "╮", "╯", "╰"},
    color_devicons = true,
    use_less = true,
    path_display = { "absolute" },
    set_env = {["COLORTERM"] = "truecolor"}, -- default = nil,
    file_previewer = require "telescope.previewers".vim_buffer_cat.new,
    grep_previewer = require "telescope.previewers".vim_buffer_vimgrep.new,
    qflist_previewer = require "telescope.previewers".vim_buffer_qflist.new,
    -- Developer configurations: Not meant for general override
    buffer_previewer_maker = require "telescope.previewers".buffer_previewer_maker
  },
  pickers = {
    file_browser = {
      attach_mappings = function(prompt_bufnr)
        action_set.select:enhance({
          post = function()
            cmd(":normal! zx")
          end
        })
        return true
      end
    },
    live_grep = {
      attach_mappings = function(prompt_bufnr)
        action_set.select:enhance({
          post = function()
            cmd(":normal! zx")
          end
        })
        return true
      end
    },
    find_files = {
      attach_mappings = function(prompt_bufnr)
        action_set.select:enhance({
          post = function()
            cmd(":normal! zx")
          end
        })
        return true
      end
    },
    buffers = {
      sort_lastused = true,
      mappings = {
        i = {
          ["<C-w>"] = "delete_buffer"
        },
        n = {
          ["<C-w>"] = "delete_buffer"
        }
      },
      attach_mappings = function(prompt_bufnr)
        action_set.select:enhance({
          post = function()
            cmd(":normal! zx")
          end
        })
        return true
      end,
    }
  }
}

map("n", "<leader>p", '<cmd>lua require("telescope.builtin").find_files(require("telescope.themes"))<cr>')
map("n", "<leader>r", '<cmd>lua require("telescope.builtin").registers()<cr>')
map("n", "<leader>g", '<cmd>lua require("telescope.builtin").live_grep(require("telescope.themes"))<cr>')
map("n", "<leader>,", '<cmd>lua require("telescope.builtin").buffers(require("telescope.themes"))<cr>')
map("n", "<leader>h", '<cmd>lua require("telescope.builtin").help_tags()<cr>')
map("n", "<leader>f", '<cmd>lua require("telescope.builtin").file_browser(require("telescope.themes"))<cr>')
map("n", "<leader>i", '<cmd>lua require("telescope.builtin").git_status(require("telescope.themes"))<cr>')
-- map("n", "<leader>s", '<cmd>lua require("telescope.builtin").spell_suggest()<cr>')

-- Lua
map("n", "<leader>xx", "<cmd>Trouble<cr>")
map("n", "<leader>xw", "<cmd>Trouble lsp_workspace_diagnostics<cr>")
map("n", "<leader>xd", "<cmd>Trouble lsp_document_diagnostics<cr>")
map("n", "<leader>xl", "<cmd>Trouble loclist<cr>")
map("n", "<leader>xq", "<cmd>Trouble quickfix<cr>")
map("n", "gR", "<cmd>Trouble lsp_references<cr>")

map("n", "<Leader>=", ":Tabularize /=<CR>")
map("v", "<Leader>=", ":Tabularize /=<CR>")
map("n", "<Leader>:", ":Tabularize /:\zs<CR>")
map("v", "<Leader>:", ":Tabularize /:\zs<CR>")
map("n", "<Leader>>", ":Tabularize /=><CR>")
map("v", "<Leader>>", ":Tabularize /=><CR>")

-- map('n', '<C-h>', [[<C-\><C-n><C-W>h]])
-- map('n', '<C-j>', [[<C-\><C-n><C-W>j]])
-- map('n', '<C-k>', [[<C-\><C-n><C-W>k]])
-- map('n', '<C-l>', [[<C-\><C-n><C-W>l]])

-- function _G.set_terminal_keymaps()
--   local opts = {noremap = true}
--   vim.api.nvim_buf_set_keymap(0, 't', '<esc>', [[<C-\><C-n>]], opts)
--   vim.api.nvim_buf_set_keymap(0, 't', 'jk', [[<C-\><C-n>]], opts)
--   vim.api.nvim_buf_set_keymap(0, 't', '<C-h>', [[<C-\><C-n><C-W>h]], opts)
--   vim.api.nvim_buf_set_keymap(0, 't', '<C-j>', [[<C-\><C-n><C-W>j]], opts)
--   vim.api.nvim_buf_set_keymap(0, 't', '<C-k>', [[<C-\><C-n><C-W>k]], opts)
--   vim.api.nvim_buf_set_keymap(0, 't', '<C-l>', [[<C-\><C-n><C-W>l]], opts)
-- end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
-- vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

opt.foldmethod="expr"
opt.foldexpr="nvim_treesitter#foldexpr()"

-------------------- COMMANDS ------------------------------
cmd("au TextYankPost * lua vim.highlight.on_yank {on_visual = true}") -- disabled in visual mode
cmd [[set shortmess+=c]]
cmd [[highlight link CompeDocumentation NormalFloat]]

vim.api.nvim_exec([[
augroup FormatAutogroup
  autocmd!
  autocmd BufEnter,BufNewFile,BufRead *.php set autoindent
  autocmd BufEnter,BufNewFile,BufRead *.php set smartindent
  autocmd BufEnter,BufNewFile,BufRead *.blade.php set filetype=blade
  autocmd FileType blade :setlocal foldmethod=indent
  autocmd BufWinLeave,FocusLost,WinLeave *.vue,*.json,*.php,*.js,*.ts,*.tsx,*.css,*.scss,*.html,*.lua silent :up
  ""autocmd BufWritePost *.vue,*.json,*.php,*.js,*.ts,*.tsx,*.css,*.scss,*.html,*.lua : FormatWrite
augroup END
]], true)

vim.api.nvim_exec([[
  function! LaravelView()
    let currentLine = getline(".")
    let viewPath = matchstr(currentLine, '\c(\([''"]\)\zs.\{-}\ze\1')
    let viewPath = substitute(viewPath,'\.','/','ge')
    exe 'cd `git rev-parse --show-toplevel`'
    exe 'e backend/resources/views/'.viewPath.'.blade.php'
  endfunction
  noremap gv :call LaravelView()<CR>
]], true)
