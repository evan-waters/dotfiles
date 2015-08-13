set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undodir=~/.vim/undo//

set nocompatible              " be iMproved, required
filetype off                  " required
filetype indent on
filetype plugin on
set tabstop=2
set shiftwidth=2
set expandtab
set shell=/bin/bash\ -l
call pathogen#infect()

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/vundle
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

Plugin 'thoughtbot/vim-rspec'

Bundle 'altercation/vim-colors-solarized'

Bundle 'mileszs/ack.vim'

Plugin 'airblade/vim-gitgutter'

Bundle 'scrooloose/nerdtree'

Plugin 'luochen1990/rainbow'

Bundle 'vim-ruby/vim-ruby'

Bundle 'ntpeters/vim-better-whitespace'

" Some settings to enable the theme:
set number        " Show line numbers
syntax enable     " Use syntax highlighting
set background=dark
let g:solarized_termcolors = 256
colorscheme solarized

" RSpec.vim mappings
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

" RSpec.vim overrides
let g:rspec_runner = "os_x_iterm"
let g:rspec_command = "!run_in_docker rspec {spec}"

" NERDTree
" autocmd vimenter * NERDTree
nmap <leader>n :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
let g:NERDTreeDirArrows=0

" Rainbow
let g:rainbow_active = 1

" CtrlP
set runtimepath^=~/.vim/bundle/ctrlp.vim

" Shortcuts
:command -nargs=1 PV :normal Aputs "#{__FILE__}:#{__LINE__} <args>: #{<args>.inspect}"<ESC>
:command -nargs=1 Lscream :normal ALog.scream "#{__FILE__}:#{__LINE__} <args>: #{<args>.inspect}"<ESC>
:command -nargs=1 Lshout :normal ALog.shout "#{__FILE__}:#{__LINE__} <args>: #{<args>.inspect}"<ESC>
:command -nargs=1 Lsay :normal ALog.say "#{__FILE__}:#{__LINE__} <args>: #{<args>.inspect}"<ESC>
