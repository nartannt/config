-- the comments are not coloured right
local colors = require("onenord.colors").load()

-- highlight group for hints
vim.api.nvim_set_hl(0, "Hints", {fg = "#6d647d", bg = bg})

-- changes the background colour
require('onenord').setup({
    theme = "dark",
    disable = {
        background = true,
    }
})


-- setup formatting
require("conform").setup({
  formatters_by_ft = {
    -- TODO find out which format to use
    lua = { "stylua" },
    -- Conform will run multiple formatters sequentially
    -- TODO find out which format and options to use
    python = { "isort", "black" },
    -- You can customize some of the format options for the filetype (:help conform.format)
    -- TODO find out which format and options to use
    rust = { "rustfmt", lsp_format = "fallback" },
    -- TODO find out which format and options to use
    ocaml = { "ocamlformat" },
    nix = { "nixpkgs-fmt" },
    
  },
})

-- still formatting but lets the function be called from init.vim
vim.api.nvim_create_user_command("Format", function(args)
  local range = nil
  if args.count ~= -1 then
    local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
    range = {
      start = { args.line1, 0 },
      ["end"] = { args.line2, end_line:len() },
    }
  end
  require("conform").format({ async = true, lsp_format = "fallback", range = range })
end, { range = true })

-- general setting up of lsp
local util = require 'lspconfig.util'


-- rust
require("lspconfig").rust_analyzer.setup{}
local opts = {
    -- rust tools
    tools = {
        inlay_hints = {
            parameter_hints_prefix = "// ",
            -- hint colour
            highlight = "Hints",
        },
    },
}
require("rust-tools").setup(opts)


-- ocaml
require("lspconfig").ocamllsp.setup {}

--LaTeX
require("lspconfig").texlab.setup {}


-- lsp key mappings

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = {
        buffer = ev.buf,
    }

    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
    vim.keymap.set('n', '<space>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<space>f', function()
      vim.lsp.buf.format { async = true }
    end, opts)
    -- these are my own mappings
    vim.keymap.set('n', '<space>j', vim.diagnostic.goto_next, opts)
    vim.keymap.set('n', '<space>k', vim.diagnostic.goto_prev, opts)
  end,
})
