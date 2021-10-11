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
  vim.cmd('command! LspSignatureHelp lua vim.lsp.buf.signature_help()')
  vim.cmd('command! LspTypeDefinition lua vim.lsp.buf.type_definition()')
  vim.cmd('command! LspRename lua vim.lsp.buf.rename()')
  vim.cmd('command! LspCodeAction lua vim.lsp.buf.code_action()')
  vim.cmd('command! LspReferences lua vim.lsp.buf.references()')
  vim.cmd('command! LspShowLineDiag lua vim.lsp.diagnostic.show_line_diagnostics()')
  vim.cmd('command! LspDiagPrev lua vim.lsp.diagnostic.goto_prev()')
  vim.cmd('command! LspDiagNext lua vim.lsp.diagnostic.goto_next()')
  vim.cmd('command! LspSetLocList lua vim.lsp.diagnostic.set_loclist()')
  vim.cmd("command! LspFormatting lua vim.lsp.buf.formatting()")
  vim.cmd("command! LspsagaSmartScrollUp lua require('lspsaga.action').smart_scroll_with_saga(-1)")
  vim.cmd("command! LspsagaSmartScrollDown lua require('lspsaga.action').smart_scroll_with_saga(1)")
  vim.cmd("command! LspsagaShowLineDiag lua require'lspsaga.diagnostic'.show_line_diagnostics()")
  vim.cmd("command! LspsagaDiagNext lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_next()")
  vim.cmd("command! LspsagaDiagPrev lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_prev()")

  buf_set_keymap('n', 'gd', ':LspDefinition<CR>', opts)
  buf_set_keymap('n', 'K', ':Lspsaga hover_doc<CR>', opts)
  buf_set_keymap('n', '<C-v>', ':LspsagaSmartScrollUp<CR>', opts)
  buf_set_keymap('n', '<C-b>', ':LspsagaSmartScrollDown<CR>', opts)
  buf_set_keymap('n', 'gi', ':LspImplementation<CR>', opts)
  buf_set_keymap('n', '<space>r', ':Lspsaga rename<CR>', opts)
  buf_set_keymap('n', '<space>a', ':Lspsaga code_action<CR>', opts)
  buf_set_keymap('n', 'gr', ':LspReferences<CR>', opts)
  buf_set_keymap('n', '<space>e', ':LspsagaShowLineDiag<CR>', opts)
  buf_set_keymap('n', '[g', ':LspsagaDiagPrev<CR>', opts)
  buf_set_keymap('n', ']g', ':LspsagaDiagNext<CR>', opts)
  buf_set_keymap('n', '<space>q', ':TroubleToggle lsp_document_diagnostics<CR>', opts)
  buf_set_keymap('n', '<space>Q', ':TroubleToggle lsp_workspace_diagnostics<CR>', opts)
  buf_set_keymap('n', '<space>n', ':AerialToggle!<CR>', opts)


  -- Add navigation
  require("aerial").on_attach(client)

  -- auto formatting
  if client.resolved_capabilities.document_formatting then
      vim.api.nvim_exec([[
        augroup LspAutocommands
            autocmd! * <buffer>
            autocmd BufWritePost <buffer> LspFormatting
        augroup END
        ]], true)
  end
end

-- Add lsp signature help
require "lsp_signature".setup({
  bind = true,
  hint_enable = false,
  max_height = 3,
  auto_close_after = 2
})

-- Completion
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

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = true,
    signs = true,
    update_in_insert = true,
  }
)

-- Improved lsp
local saga = require 'lspsaga'
saga.init_lsp_saga()
require("trouble").setup{}

-- Enable Async format
local format_async = function(err, _, result, _, bufnr)
    if err ~= nil or result == nil then return end
    if not vim.api.nvim_buf_get_option(bufnr, "modified") then
        local view = vim.fn.winsaveview()
        vim.lsp.util.apply_text_edits(result, bufnr)
        vim.fn.winrestview(view)
        if bufnr == vim.api.nvim_get_current_buf() then
            vim.api.nvim_command("noautocmd :update")
        end
    end
end
vim.lsp.handlers["textDocument/formatting"] = format_async

-- Register Language Servers
-- Enable rust_analyzer
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
nvim_lsp.rust_analyzer.setup({
    on_attach=on_attach,
    capabilities=capabilities,
})

-- Enable tsserver
-- npm install -g typescript typescript-language-server diagnostic-languageserver eslint_d prettier prettier-eslint prettier-eslint-cli
nvim_lsp.tsserver.setup {
    on_attach = function(client)
        client.resolved_capabilities.document_formatting = false
        on_attach(client)
    end
}

local filetypes = {
    javascript = "eslint",
    typescript = "eslint",
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
    prettier = {command = "prettier", args = {"--stdin-filepath", "%filepath"}},
    prettierEslint = {command = "prettier-eslint", args = {"%filepath"}},
}

local formatFiletypes = {
    javascript = "prettierEslint",
    typescript = "prettierEslint"
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
nvim_lsp.jsonls.setup {}

-- Enable yaml language server
-- npm i -g yarn
-- yarn global add yaml-language-server
nvim_lsp.yamlls.setup{}
