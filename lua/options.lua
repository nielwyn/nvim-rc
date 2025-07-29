vim.opt.whichwrap:append "<>[]hl" -- Seemlessly move between lines

local options = {
  -- UI and Status
  statuscolumn   = " %s%l%=%r",    -- Custom status column (requires Neovim 0.9+)
  laststatus     = 3,              -- Global statusline

  -- Folds and Indents
  foldlevelstart = 99,      -- Open all folds by default
  breakindent    = true,    -- Enable break indent
  expandtab      = true,    -- Convert tabs to spaces
  softtabstop    = 8,       -- Number of spaces per <Tab> in insert mode
  shiftwidth     = 2,       -- Number of spaces for each indentation
  tabstop        = 8,       -- Number of spaces that a <Tab> in the file counts for

  -- Search
  hlsearch       = false,    -- Don't highlight search results
  incsearch      = true,     -- Show search matches as you type
  ignorecase     = true,     -- Ignore case in search patterns
  smartcase      = true,     -- Override ignorecase if search contains capitals

  -- File Handling
  backup         = false,      -- Don't create backup files
  swapfile       = true,       -- Create swapfiles
  writebackup    = false,      -- Don't allow editing files opened elsewhere
  fileencoding   = "utf-8",    -- File encoding written to disk
  conceallevel   = 0,          -- Show all text in markdown

  -- Buffers and Windows
  hidden         = true,    -- Allow background buffers
  splitbelow     = true,    -- Horizontal splits open below
  splitright     = true,    -- Vertical splits open to the right

  -- Mouse and UI
  mouse          = "a",      -- Enable mouse in all modes
  showmode       = false,    -- Don't show -- INSERT -- etc.
  relativenumber = true,     -- Show relative line numbers
  numberwidth    = 5,        -- Set line number column width
  signcolumn     = "yes",    -- Always show sign column
  wrap           = false,    -- Don't wrap lines
  scrolloff      = 9,        -- Minimal number of screen lines above/below cursor
  sidescrolloff  = 9,        -- Minimal number of screen columns to the side of cursor

  -- Performance
  timeoutlen     = 500,      -- Time in ms to wait for a mapped sequence
  updatetime     = 100,      -- Faster completion
  lazyredraw     = false,    -- Don't lazy redraw (default false)

  -- Appearance
  termguicolors  = true,    -- Enable GUI colors in terminal
  fillchars      = {        -- Customize fill characters
    eob       = " ",        -- Empty buffer lines
    fold      = " ",
    foldopen  = "",
    foldsep   = " ",
    foldclose = "",
    lastline  = " ",
  },
}

for name, value in pairs(options) do
  vim.opt[name] = value
end
