-- nvim_lsp object
local nvim_lsp = require'lspconfig'

local on_attach = function(client, bufnr)
 local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  vim.cmd("command! LspDeclaration lua vim.lsp.buf.declaration()")
  vim.cmd('command! LspDefinition lua vim.lsp.buf.definition()')
  vim.cmd('command! LspHover lua vim.lsp.buf.hover()')
  vim.cmd('command! LspImplementation lua vim.lsp.buf.implementation()')
  vim.cmd('command! LspTypeDefinition lua vim.lsp.buf.type_definition()')
  vim.cmd('command! LspSignatureHelp lua vim.lsp.buf.signature_help()')
  vim.cmd('command! LspRename lua vim.lsp.buf.rename()')
  vim.cmd('command! LspCodeAction lua vim.lsp.buf.code_action()')
  vim.cmd('command! LspCodeActionTelescope lua require("telescope.builtin").lsp_code_actions()')
  vim.cmd('command! LspReferencesTelescope lua require("telescope.builtin").lsp_references()')
  vim.cmd('command! LspReferences lua vim.lsp.buf.references()')
  vim.cmd('command! LspShowLineDiag lua vim.diagnostic.open_float()')
  vim.cmd('command! LspDiagPrev lua vim.diagnostic.goto_prev()')
  vim.cmd('command! LspDiagNext lua vim.diagnostic.goto_next()')
  vim.cmd('command! LspSetLocList lua vim.diagnostic.setloclist()')
  vim.cmd("command! LspFormatting lua vim.lsp.buf.formatting()")

  buf_set_keymap('n', 'gd', ':LspDefinition<CR>', opts)
  buf_set_keymap('n', 'K', ':LspHover<CR>', opts)
  buf_set_keymap('n', 'I', ':LspSignatureHelp<CR>', opts)
  buf_set_keymap('n', 'gi', ':LspImplementation<CR>', opts)
  buf_set_keymap('n', 'ff', ':w | :LspFormatting<CR>', opts)
  buf_set_keymap('n', '<space>r', ':LspRename<CR>', opts)
  buf_set_keymap('n', '<space>a', ':LspCodeActionTelescope<CR>', opts)
  buf_set_keymap('n', 'gr', ':LspReferencesTelescope<CR>', opts)
  buf_set_keymap('n', '<space>e', ':LspShowLineDiag<CR>', opts)
  buf_set_keymap('n', '[g', ':LspDiagPrev<CR>', opts)
  buf_set_keymap('n', ']g', ':LspDiagNext<CR>', opts)
  buf_set_keymap('n', '<space>q', ':TroubleToggle document_diagnostics<CR>', opts)
  buf_set_keymap('n', '<space>Q', ':TroubleToggle workspace_diagnostics<CR>', opts)
  buf_set_keymap('n', '<space>n', ':AerialToggle!<CR>', opts)

  -- Add navigation
  require("aerial").on_attach(client)
end

-- Syntax
require'nvim-treesitter.configs'.setup {
  ensure_installed = {"typescript"},
  sync_install = false,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  -- indent = {
  --   enable = true
  -- },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "<C-v>",
      node_incremental = "v",
      node_decremental = "b",
    },
  }
}

-- Code Completion
local check_back_space = function()
  local col = vim.fn.col('.') - 1
  return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s')
end

local cmp = require'cmp'
cmp.setup({
  snippet = {
    expand = function(args)
        vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  preselect = true,
  mapping = {
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<CR>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Insert,
      select = true,
    }),
    ['<Tab>'] = function(fallback)
      if cmp.visible() then
        cmp.confirm({behavior = cmp.ConfirmBehavior.Insert, select = true})
      elseif check_back_space() then
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<Tab>', true, true, true), 'n')
      elseif vim.fn['vsnip#available']() == 1 then
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<Plug>(vsnip-jump-next)', true, true, true), '')
      else
        fallback()
      end
    end
  },

  -- Installed sources
  sources = {
    { name = 'nvim_lsp', max_item_count = 10 },
    { name = 'vsnip', max_item_count = 10 },
    { name = 'path', max_item_count = 10 },
    { name = 'buffer', max_item_count = 10 },
  },

  formatting = {
    format = function(entry, vim_item)
      -- fancy icons and a name of kind
      vim_item.kind = require("lspkind").presets.default[vim_item.kind] .. " " .. vim_item.kind

      -- set a name for each source
      vim_item.menu = ({
        buffer = "[Buffer]",
        path = "[Path]",
        vsnip = "[VSnip]",
        nvim_lsp = "[LSP]",
      })[entry.source.name]
      return vim_item
    end,
  },
})

-- Improved lsp
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end
vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = false,
})
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {border = 'rounded'})
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {border = 'rounded'})

local telescope_actions = require("telescope.actions")
require('telescope').setup{
  defaults = {
    mappings = {
      i = {
        ["<esc>"] = telescope_actions.close,
        ["<C-x>"] = false,
        ["<M-a>"] = telescope_actions.select_all,
        ["<C-q>"] = telescope_actions.send_to_qflist + telescope_actions.open_qflist
      },
    },
  },
  pickers = {
    lsp_code_actions = {
      theme = "cursor",
    },
    lsp_references = {
      theme = "ivy",
    }
  },
  extensions = {
  },
}

require("trouble").setup{}
require("todo-comments").setup{
  keywords = {
    DEBUG = { icon = " ", color = "warning" },
  },
}


local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
-- Register Language Servers
-- Enable rust_analyzer
nvim_lsp.rust_analyzer.setup({
    on_attach=on_attach,
    capabilities=capabilities,
})

-- Enable tsserver
-- npm install -g typescript \
--   typescript-language-server \
--   diagnostic-languageserver \
--   eslint_d eslint prettier \
--   eslint-config-prettier eslint-plugin-prettier
nvim_lsp.tsserver.setup {
    on_attach = function(client)
        client.resolved_capabilities.document_formatting = false
        client.resolved_capabilities.document_range_formatting = false
        on_attach(client)
    end
}

local filetypes = {
    javascript = "eslint",
    typescript = "eslint",
    javascriptreact = "eslint",
    typescriptreact = "eslint",
}

local linters = {
    eslint = {
        sourceName = "eslint",
        command = "eslint_d",
        rootPatterns = {".eslintrc", ".eslintrc.js", ".eslintrc.json", "package.json"},
        debounce = 100,
        args = {"--stdin", "--stdin-filename", "%filepath", "--format", "json"},
        parseJson = {
            errorsRoot = "[0].messages",
            line = "line",
            column = "column",
            endLine = "endLine",
            endColumn = "endColumn",
            message = "${message} [${ruleId}]",
            security = "severity"
        },
        securities = {[2] = "error", [1] = "warning"}
    }
}

local formatters = {
    eslint = {command = "eslint_d", args = {"--fix-to-stdout", "--stdin", "--stdin-filename", "%filepath"}},
}

local formatFiletypes = {
    javascript = "eslint",
    typescript = "eslint",
    javascriptreact = "eslint",
    typescriptreact = "eslint",
}

nvim_lsp.diagnosticls.setup {
    on_attach = on_attach,
    filetypes = vim.tbl_keys(filetypes),
    init_options = {
        filetypes = filetypes,
        linters = linters,
        formatters = formatters,
        formatFiletypes = formatFiletypes
    }
}

-- Enable json language server
-- npm i -g vscode-langservers-extracted
nvim_lsp.jsonls.setup {
  on_attach = on_attach,
  settings = {
    json = {
      schemas = {
        {
          fileMatch = { 'package.json' },
          url = 'https://json.schemastore.org/package.json',
        },
        {
          fileMatch = { 'tsconfig.json', 'tsconfig.*.json' },
          url = 'http://json.schemastore.org/tsconfig',
        },
        {
          fileMatch = { '.eslintrc.json', '.eslintrc' },
          url = 'http://json.schemastore.org/eslintrc',
        },
        {
          fileMatch = { '.prettierrc', '.prettierrc.json', 'prettier.config.json' },
          url = 'http://json.schemastore.org/prettierrc',
        },
        {
          fileMatch = { '.stylelintrc', '.stylelintrc.json', 'stylelint.config.json' },
          url = 'http://json.schemastore.org/stylelintrc',
        },
      },
    },
  },
}

-- Enable yaml language server
-- npm i -g yarn
-- yarn global add yaml-language-server
nvim_lsp.yamlls.setup{
  on_attach=on_attach
}

-- Enable css language server
-- npm i -g vscode-langservers-extracted
nvim_lsp.cssls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}

-- Enable python lsp
-- npm i -g pyright
nvim_lsp.pyright.setup{
  on_attach = on_attach
}

-- golsp
-- brew install go
-- brew install gopls
nvim_lsp.gopls.setup{
  on_attach = on_attach,
  cmd = {"gopls", "serve"},
  settings = {
    gopls = {
      analyses = {
        unusedparams = true,
      },
      staticcheck = true,
    },
  },
}
