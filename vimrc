set number
set tabstop=2
set shiftwidth=2
set mouse=a
set autoindent
set cindent
syntax on
filetype indent plugin on

autocmd BufRead,BufNewFile *.c,*.h,*.cc,*.cpp,*.hpp,*.java set colorcolumn=80
highlight ColorColumn ctermbg=gray

let _curfile = expand("%:t")
if _curfile =~ "Makefile" || _curfile =~ "makefile" || _curfile =~ ".*\.mk"
    set noexpandtab
else
    set expandtab
endif


map <C-X> :pyf $HOME/workspace/packages/llvm-3.8.1.src/tools/clang/tools/clang-format/clang-format.py<cr>
imap <C-X> <c-o>:pyf $HOME/workspace/packages/llvm-3.8.1.src/tools/clang/tools/clang-format/clang-format.py<cr>


function FormatFile()
  let l:lines="all"
  pyf $HOME/workspace/packages/llvm-3.8.1.src/tools/clang/tools/clang-format/clang-format.py
endfunction

autocmd BufWritePre *.h,*.cc,*.cpp call FormatFile()


source ~/.cscope_maps.vim