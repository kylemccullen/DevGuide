set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set number
syntax on
set clipboard=unnamedplus
set relativenumber
set hidden
set nowrap
set nohlsearch
set nofixendofline
let mapleader = ' '

nnoremap Y y$
nnoremap n nzz
nnoremap N Nzz

" Shortcuts for Split Navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Move lines up and down with Alt-j and Alt-k
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

call plug#begin()

Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'

Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'
Plug 'kylemccullen/vim-gitstatus', { 'branch': 'patch-2' }

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'preservim/nerdtree'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'preservim/nerdcommenter'
Plug 'szw/vim-maximizer'
Plug 'jiangmiao/auto-pairs'
Plug 'ThePrimeagen/harpoon'

Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'

call plug#end()

" gruvbox
colorscheme gruvbox
set background=dark

" treesitter
lua <<EOF
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
  },
}
EOF

" nerdtree
nnoremap <C-f> :NERDTreeToggle %<CR>

" telescope
nnoremap <C-g> <cmd>Telescope find_files<cr>
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" nerdcommenter
let g:NERDSpaceDelims = 1

" omnisharp lsp config
lua <<EOF
require'lspconfig'.omnisharp.setup {
  capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities()),
  on_attach = function(_, bufnr)
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
  end,
  cmd = { "C:/omnisharp-win-x64/OmniSharp.exe", "--languageserver" , "--hostPID", tostring(pid) },
}
EOF

" harpoon
nmap <leader>tj :lua require("harpoon.term").gotoTerminal(0)<CR>
nmap <leader>tk :lua require("harpoon.term").gotoTerminal(1)<CR>
nmap <leader>tl :lua require("harpoon.term").gotoTerminal(2)<CR>
nmap <leader>t; :lua require("harpoon.term").gotoTerminal(3)<CR>

" lspconfig
nnoremap <silent> ]g :lua vim.diagnostic.goto_next()<CR>
nnoremap <silent> [g :lua vim.diagnostic.goto_prev()<CR>
nnoremap <silent> <leader>qd :lua vim.diagnostic.set_loclist()<CR>
nnoremap <silent> <leader>gqf :lua vim.diagnostic.toqflist()<CR>
nnoremap <silent> gd :lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gi :lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> gr :lua vim.lsp.buf.references()<CR>
nnoremap <silent> <leader>rn :lua vim.lsp.buf.rename()<CR>
nnoremap <silent> ca :lua vim.lsp.buf.code_action()<CR>
nnoremap <silent> K :lua vim.lsp.buf.hover()<CR>

" cmp
lua <<EOF
local cmp = require 'cmp'
cmp.setup {
  mapping = {
    ['<Tab>'] = cmp.mapping.select_next_item(),
    ['<S-Tab>'] = cmp.mapping.select_prev_item(),
    ['<CR>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    })
  },
  sources = {
    { name = 'nvim_lsp' },
  }
}
EOF
