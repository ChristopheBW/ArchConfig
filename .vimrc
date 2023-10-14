"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader = ","      " Define <leader> key
set nocompatible         " Set non-compatible with the original vi mode
filetype on              " Set to enable file type detection
filetype plugin on       " Set to load plugins corresponding to file type
set noeb                 " Turn off error prompts
syntax enable            " Enable syntax highlighting
syntax on                " Automatic syntax highlighting
set t_Co=256             " Enable 256 color support
set cmdheight=2          " Set command line height
set showcmd              " Show the number of lines selected in select mode
set ruler                " Always show cursor position
set laststatus=2         " Always display status bar
set number               " Enable line number display
set relativenumber       " Enable relative line number
set cursorline           " Highlight the current line
set mouse=a              " Set to use mouse in VIM
set ttimeoutlen=0        " Set <ESC> key response time

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Code indentation and formatting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set autoindent           " Set automatic indentation
set cindent              " Set to use C/C++ automatic indentation
set cinoptions=g0,:0,N-s,(0    " Set specific indentation method for C/C++
set smartindent          " Intelligent selection of alignment method
filetype indent on       " Automatically adapt intelligent indentation for different languages
set expandtab            " Expand tab character to spaces
set tabstop=4            " Set the number of spaces a tab occupies during editing
set shiftwidth=4         " Set the number of spaces a tab occupies when formatting
set softtabstop=4       " Set 4 spaces as a tab
set smarttab             " Use tab at the beginning of lines and paragraphs
" set nowrap               " Disable line wrap
set backspace=2          " Use the return key to normally handle indent, eol, start, etc.
set sidescroll=10        " Set the number of characters to scroll to the right
set nofoldenable         " Disable code folding

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Code completion
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set wildmenu             " Smart completion of vim's own command line mode
set completeopt-=preview " Do not display window when completing, only display completion list

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Search settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set hlsearch            " Highlight search results
set incsearch           " Enable real-time search
set ignorecase          " Case insensitive during search

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Buffer settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nobackup            " Set not to backup
set noswapfile          " Disable generation of temporary files
set autoread            " If file is modified outside vim, automatically read again
set autowrite           " Set to auto-save
set confirm             " When dealing with unsaved or read-only files, pop up for confirmation

" Automatically open at the last position
if has("autocmd")                                                          
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Encoding settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set termencoding=utf-8
set encoding=utf8
set fileencodings=utf8,ucs-bom,gbk,cp936,gb2312,gb18030

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin list
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Install vim-plug
"
" curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
" ln -s ~/.vim ~/.config/nvim 
" ln -s ~/.vimrc ~/.config/nvim/init.vim

call plug#begin('~/.vim/plugged')

Plug 'Yggdroot/LeaderF'
Plug 'chxuan/vim-buffer'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'preservim/tagbar'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'scrooloose/nerdtree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'
Plug 'terryma/vim-smooth-scroll'
Plug 'ap/vim-css-color'
Plug 'sbdchd/neoformat'
Plug 'tomtom/tcomment_vim'
Plug 'wakatime/vim-wakatime'
Plug 'github/copilot.vim'
Plug 'ianding1/leetcode.vim'
Plug 'NLKNguyen/papercolor-theme'

call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Color scheme settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set background=dark
colorscheme PaperColor

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" F10 to run
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <F10> :call CompileRunGcc()<CR>

func! CompileRunGcc()
    exec "w"
    if &filetype == 'c'
        exec 'te clang % -o %< && ./%< ; rm %<'
    elseif &filetype == 'cpp'
        exec 'te clang++ % -o %< && ./%< ; rm %<'
    elseif &filetype == 'rust'
        exec 'te cargo run'
    elseif &filetype == 'java'
        exec 'te javac % && java %< ; rm *.class'
    elseif &filetype == 'python'
        exec 'te python3 %'
    elseif &filetype == 'ocaml'
        exec 'te ocaml %'
    elseif &filetype == 'sh'
        :!time bash %
    endif
    exec 'startinsert'
endfunc

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Leader key settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Set leader key
nnoremap <leader>f :LeaderfFile ~<cr>

let g:Lf_WildIgnore = {
            \ 'dir': ['.svn','.git','.hg','.vscode','.wine','.deepinwine','.oh-my-zsh'],
            \ 'file': ['*.sw?','~$*','*.bak','*.exe','*.o','*.so','*.py[co]']
            \}
let g:Lf_UseCache = 0

" Copy to system clipboard
noremap <Leader>yg :%y+<CR>
noremap <Leader>yy "+y<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" airline
let g:airline_theme="christophe"
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''

" vim-buffer
nnoremap <silent> <c-p> :PreviousBuffer<cr>
nnoremap <silent> <c-n> :NextBuffer<cr>
nnoremap <silent> <leader>d :CloseBuffer<cr>
nnoremap <silent> <leader>D :BufOnly<cr>

" nerdtree
nnoremap <silent> <F2> :silent! NERDTreeToggle<cr>
let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1
let g:NERDTreeHighlightFolders = 1         
let g:NERDTreeHighlightFoldersFullName = 1 
let g:NERDTreeDirArrowExpandable='▷'
let g:NERDTreeDirArrowCollapsible='▼'

" nerdtree-git-plugin
let g:NERDTreeGitStatusIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }

" Tagbar
nnoremap <silent> <F3> :TagbarToggle<cr>
let g:tagbar_autofocus = 1

" tabular
nnoremap <leader>l :Tab /\|<cr>
nnoremap <leader>= :Tab /=<cr>

" --------------------------------------------------------------------------------------
" Plug COC
" --------------------------------------------------------------------------------------
" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.

  function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
  endfunction

  " Insert <tab> when previous text is space, refresh completion if not.
  inoremap <silent><expr> <TAB>
	\ coc#pum#visible() ? coc#pum#next(1):
	\ <SID>check_back_space() ? "\<Tab>" :
	\ coc#refresh()
  inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" !---------------------------!
" Add the following line in :CocConfig
"   "suggest.noselect": true
" !---------------------------!


" Use <c-space> to trigger completion.
  if has('nvim')
    inoremap <silent><expr> <c-space> coc#refresh()
  else
    inoremap <silent><expr> <c-@> coc#refresh()
  endif

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
"autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <C-d> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <C-d> <Plug>(coc-range-select)
xmap <silent> <C-d> <Plug>(coc-range-select)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

highlight CocFloating ctermbg=grey ctermfg=white
" --------------------------------------------------------------------------------------

" vim-markdown
let g:markdown_enable_spell_checking = 0
"let g:vim_markdown_folding_disabled=1
let g:vim_markdown_frontmatter = 1
"set conceallevel=2

" vim-arduino
let g:arduino_dir = "/usr/share/arduino/"

nnoremap <buffer> <leader>am :ArduinoVerify<CR>
nnoremap <buffer> <leader>au :ArduinoUpload<CR>
nnoremap <buffer> <leader>ad :ArduinoUploadAndSerial<CR>
nnoremap <buffer> <leader>ab :ArduinoChooseBoard<CR>
nnoremap <buffer> <leader>ap :ArduinoChooseProgrammer<CR>

" Neoformat
noremap <F9> :Neoformat<CR>

let g:neoformat_ocaml_ocamlformat = {
            \ 'exe': 'ocamlformat',
            \ 'no_append': 1,
            \ 'stdin': 1,
            \ 'args': ['--enable-outside-detected-project', '--profile=sparse', '--name', '"%:p"', '-']
            \ }

let g:neoformat_enabled_ocaml = ['ocamlformat']


" Opam-Merlin
nnoremap <leader>c :TComment<cr>

" vim-leetcode
let g:leetcode_solution_filetype = 'python3'
let g:leetcode_browser = 'chrome'
nnoremap <leader>ll :LeetCodeList<cr>
nnoremap <leader>lt :LeetCodeTest<cr>
nnoremap <leader>ls :LeetCodeSubmit<cr>
nnoremap <leader>li :LeetCodeSignIn<cr>

" copilot
" use right arrow to accept suggestion
" imap <silent><script><expr> <Right> copilot#Accept("\<CR>")
imap <silent><script><expr> <C-J> copilot#Accept("\<CR>")
let g:copilot_no_tab_map = v:true

" wsl
if system('uname -r') =~ "microsoft"
  augroup Yank
  autocmd!
  autocmd TextYankPost * :call system('/mnt/c/windows/system32/clip.exe ',@")
  augroup END
endif

" nvim-treesitter
" enable highlighting for all file types
lua << EOF
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
  },
}
EOF

