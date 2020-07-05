"    ____      _ __        _
"   /  _/___  (_) /__   __(_)___ ___
"   / // __ \/ / __/ | / / / __ `__ \
" _/ // / / / / /__| |/ / / / / / / /
"/___/_/ /_/_/\__(_)___/_/_/ /_/ /_/


" Always source these
source $HOME/.config/nvim/vim-plug/plugins.vim
source $HOME/.config/nvim/general/settings.vim
source $HOME/.config/nvim/general/functions.vim
source $HOME/.config/nvim/keys/mappings.vim
source $HOME/.config/nvim/keys/which-key.vim

" Source depending on if VSCode is our client
if exists('g:vscode')
    " VSCode extension
  source $HOME/.config/nvim/vscode/windows.vim
  source $HOME/.config/nvim/plug-config/easymotion.vim
else
  " ordinary neovim
  source $HOME/.config/nvim/themes/syntax.vim
  source $HOME/.config/nvim/themes/onedark.vim
  source $HOME/.config/nvim/themes/airline.vim
  source $HOME/.config/nvim/plug-config/rnvimr.vim
  source $HOME/.config/nvim/plug-config/fzf.vim
  source $HOME/.config/nvim/plug-config/nerd-commenter.vim
  source $HOME/.config/nvim/plug-config/rainbow.vim
  source $HOME/.config/nvim/plug-config/codi.vim
  source $HOME/.config/nvim/plug-config/quickscope.vim
  source $HOME/.config/nvim/plug-config/vim-wiki.vim
  " source $HOME/.config/nvim/plug-config/sneak.vim
  source $HOME/.config/nvim/plug-config/coc.vim
  source $HOME/.config/nvim/plug-config/goyo.vim
  source $HOME/.config/nvim/plug-config/vim-rooter.vim
  source $HOME/.config/nvim/plug-config/start-screen.vim
  source $HOME/.config/nvim/plug-config/gitgutter.vim
  source $HOME/.config/nvim/plug-config/closetags.vim
  source $HOME/.config/nvim/plug-config/floaterm.vim
  source $HOME/.config/nvim/plug-config/vista.vim
  luafile $HOME/.config/nvim/lua/plug-colorizer.lua
  " source $HOME/.config/nvim/plug-config/easymotion.vim
endif

" Experimental

if !empty(glob("./paths.vim"))
  source $HOME/.config/nvim/paths.vim
endif
let g:polyglot_disabled = ['csv']

" Python
" https://realpython.com/python-debugging-pdb/ " breakpoint syntax is really cool
" also look into profiling as well
" let g:python_highlight_all=1
set tabstop=4
set shiftwidth=4
set autoindent

" hien ten ham o statusline
function! NearestMethodOrFunction() abort
  return get(b:, 'vista_nearest_method_or_function', '')
endfunction

set statusline+=%{NearestMethodOrFunction()}

" By default vista.vim never run if you don't call it explicitly.
"
" If you want to show the nearest function in your statusline automatically,
" you can add the following line to your vimrc
autocmd VimEnter * call vista#RunForNearestMethodOrFunction()

" Debug
packadd! vimspector
let g:vimspector_enable_mappings = 'VISUAL_STUDIO'

" JAVA 
autocmd Filetype java set makeprg=javac\ %
set errorformat=%A%f:%l:\ %m,%-Z%p^,%-C%.%#
map <C-c> :make<Return>:copen<Return>
"map <C-v> :cprevious<Return>
"map <C-b> :cnext<Return>

" To sang dau ':' khi dung TODO:
syn match   myTodo   contained   "\<\(TODO\|FIXME\):"
hi def link myTodo Todo

" move line
nnoremap <silent> <M-Up> :m-2<CR>
nnoremap <silent> <M-Down> :m+<CR>
inoremap <silent> <M-Up> <Esc>:m-2<CR>
inoremap <silent> <M-Down> <Esc>:m+<CR>

" dracula themes
let g:dracula_colorterm = 0
set termguicolors
packadd! dracula
syntax enable
colorscheme dracula

" Dong bo clipboard giua tmux, vim vs OS
set clipboard^=unnamed,unnamedplus
