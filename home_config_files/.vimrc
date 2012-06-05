syntax on

set history=50        " keep 50 lines of command line history
set ruler        " show the cursor position all the time
set showcmd        " display incomplete commands
set incsearch        " do incremental searching
"if has('mouse')
"set mouse=a
"endif
" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif
" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

else

  set autoindent        " always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
          \ | wincmd p | diffthis
endif

"""
" Special conf
"""
set nocompatible " breaks compatibility with original vi
"set backspace=indent,eol,start " allow backspace in insert mode
set autoindent    " text indenting
set smartindent   " as above
set tabstop=4     " number of spaces in a tab
set softtabstop=4 " as above
set shiftwidth=4  " as above

set history=100   " lines of command history
set showcmd       " show incomplete commands
set hlsearch      " highlight searched-for phrases
set incsearch     " highlight search as you type
set smarttab
"set list " affiche les caracteres louches
set tabpagemax=15
se nu
"Color
colorscheme desert " set up a color scheme in the gvim interface
syntax on " active the syntaxic coloration
let mywinfont="Monospace:h10:cANSI"

"Retour a la meme position
if has("autocmd")
  filetype plugin indent on
  autocmd FileType text setlocal textwidth=78

" always jump to last edit position when opening a file
  autocmd BufReadPost *
  \ if line("'\"") > 0 && line("'\"") <= line("$") |
  \   exe "normal g`\"" |
  \ endif
endif

"Souligne la ligne en cours
set cursorline
" highlight CursorLine term=bold cterm=bold
