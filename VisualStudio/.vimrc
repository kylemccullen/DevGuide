# %USERNAME%/.vimrc

set number relativenumber
set nu rnu
set clipboard=unnamed
let mapleader=" "

map K :vsc Edit.QuickInfo<CR>
map gi :vsc Edit.GoToImplementation<CR>
map gr :vsc Edit.FindAllReferences<CR>
map <leader>rn :vsc ReSharper.ReSharper_Rename<CR>

map ]c :vsc GitDiffMargin.NextChange<CR>
map [c :vsc GitDiffMargin.PreviousChange<CR>

map [g :vsc ReSharper.ReSharper_GotoPrevHighlight<CR>
map ]g :vsc ReSharper.ReSharper_GotoNextHighlight<CR>

map <leader>ci :vsc ReSharper.ReSharper_LineComment<CR>
