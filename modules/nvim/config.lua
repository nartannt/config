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
    nix = { "nixfmt" },
    
  },
})


-- typst lsp
vim.lsp.config("tinymist", {
     root_dir = function(_, bufnr)
       return vim.fs.root(bufnr, { ".git" }) or vim.fn.expand("%:p:h")
     end,
    settings = {
        formatterMode = "typstyle",
        exportPdf = "onSave",
        semanticTokens = "enable",
        --typstExtraArgs = { "--ignore-system-fonts" },
    }
   })
--vim.lsp.config("tinymist", {
--    cmd = {'tinymist'},
--    filetypes = {'typst'},
--    settings = {
--        -- ...
--    }
--})

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
vim.lsp.config("rust_analyzer", {
	-- rust tools
	tools = {
	   inlay_hints = {
	       parameter_hints_prefix = "// ",
	       -- hint colour
	       highlight = "Hints",
	   },
	},
})
--require("rust-tools").setup(opts)


-- ocaml
vim.lsp.config("ocamllsp", {})

--LaTeX
vim.lsp.config("texlab", {})

-- lean4
  ---@module 'lean'
  ---@type lean.Config
  require('lean').setup {
    -- Enable suggested mappings?
    --
    -- false by default, true to enable
    mappings = true,

    -- Enable the Lean language server(s)?
    --
    -- false to disable, otherwise should be a table of options to pass to `leanls`
    --
    -- See :help vim.lsp.Config for details.
    vim.lsp.config('leanls', {
      abbreviations = { builtin = true },
      on_attach = on_attach,
      init_options = {
        -- See Lean.Lsp.InitializationOptions for details and further options.

        -- Time (in milliseconds) which must pass since latest edit until elaboration begins.
        -- Lower values may make editing feel faster at the cost of higher CPU usage.
        -- Note that lean.nvim changes the Lean default for this value!
        editDelay = 5,

        -- Whether to signal that widgets are supported.
        hasWidgets = true,
      }
    }),

    ft = {
      -- A list of patterns which will be used to protect any matching
      -- Lean file paths from being accidentally modified (by marking the
      -- buffer as `nomodifiable`).
      nomodifiable = {
          -- by default, this list includes the Lean standard libraries,
          -- as well as files within dependency directories (e.g. `_target`)
          -- Set this to an empty table to disable.
      }
    },

    -- Abbreviation support
    abbreviations = {
      -- Enable expanding of unicode abbreviations?
      enable = true,
      -- additional abbreviations:
      extra = {
        -- Add a \wknight abbreviation to insert ♘
        --
        -- Note that the backslash is implied, and that you of
        -- course may also use a snippet engine directly to do
        -- this if so desired.
        wknight = '♘',
      },
      -- Change if you don't like the backslash
      -- (comma is a popular choice on French keyboards)
      leader = '<space>',
    },

    -- Infoview support
    infoview = {
      -- Automatically open an infoview on entering a Lean buffer?
      -- Should be a function that will be called anytime a new Lean file
      -- is opened. Return true to open an infoview, otherwise false.
      -- Setting this to `true` is the same as `function() return true end`,
      -- i.e. autoopen for any Lean file, or setting it to `false` is the
      -- same as `function() return false end`, i.e. never autoopen.
      autoopen = true,

      -- Set infoview windows' starting dimensions.
      -- Windows are opened horizontally or vertically depending on spacing.
      width = 50,
      height = 20,

      -- Set the infoviews' orientation to be dynamic based on screen layout
      -- or fixed to a vertical or horizontal orientation
      -- auto | vertical | horizontal
      orientation = "auto",

      -- Put the infoview on the top or bottom when horizontal?
      -- top | bottom
      horizontal_position = "bottom",

      -- Always open the infoview window in a separate tabpage.
      -- Might be useful if you are using a screen reader and don't want too
      -- many dynamic updates in the terminal at the same time.
      -- Note that `height` and `width` will be ignored in this case.
      separate_tab = false,

      -- Show indicators for pin locations when entering an infoview window?
      -- always | never | auto (= only when there are multiple pins)
      indicators = "auto",
    },

    -- Progress bar support
    progress_bars = {
      -- Enable the progress bars?
      -- By default, this is `true` if satellite.nvim is not installed, otherwise
      -- it is turned off, as when satellite.nvim is present this information would
      -- be duplicated.
      enable = true,  -- see above for default
      -- What character should be used for the bars?
      character = '│',
      -- Use a different priority for the signs
      priority = 10,
    },

    -- Redirect Lean's stderr messages somewhere (to a buffer by default)
    stderr = {
      enable = true,
      -- height of the window
      height = 5,
      -- a callback which will be called with (multi-line) stderr output
      -- e.g., use:
      --   on_lines = function(lines) vim.notify(lines) end
      -- if you want to redirect stderr to `vim.notify`.
      -- The default implementation will redirect to a dedicated stderr
      -- window.
      on_lines = nil,
    },
  }
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
