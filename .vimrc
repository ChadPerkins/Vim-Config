 set nocompatible
filetype off

" Set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

" Download plug-ins to the ~/.vim/plugged/ directory
call vundle#begin('~/.vim/plugged')

" Let Vundle manage Vundle
Plugin 'VundleVim/Vundle.vim'

" Polyglot syntax highlighting
Plugin 'sheerun/vim-polyglot'

" Auto pairs
Plugin 'jiangmiao/auto-pairs'

" NERDTree file viewer
Plugin 'preservim/nerdtree'

" Tagbar
Plugin 'preservim/tagbar'

" CtrlSF file searcher
Plugin 'dyng/ctrlsf.vim'

" FSwitch .h and .cpp file switcher
Plugin 'derekwyatt/vim-fswitch'

" Vim-Protodef
Plugin 'derekwyatt/vim-protodef'

" Add YCM repository to plugin list
Plugin 'ycm-core/YouCompleteMe'

" Add Vim-Dispatch for auto build and run
Plugin 'tpope/vim-dispatch'

" Archery colorscheme
Plugin 'Badacadabra/vim-archery'

" Airline directory patch and theme
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

call vundle#end()
filetype plugin indent on

set nu		" Enable Line Numbers
syntax on 	" Enable syntax highlighting

" How many colums of whitespace a \t is worth
set tabstop=8

" How many columns of whitespace a "level of indentation" is worth
set shiftwidth=8

set incsearch 	" Enable incremental search
set hlsearch 	" Enable highlight search

set termwinsize=12x0	" Set terminal size
set splitbelow			" Always split below
set mouse=a				" Enables mouse drag on window split

" Make Vim always render the sign column:
set signcolumn=yes

" NERDTree Settings

let NERDTreeShowBookmarks = 1	" Show the bookmarks table
let NERDTreeShowHidden = 1 		" Show hidden files
let NERDTreeShowLineNumbers = 0 " Hide line numbers
let NERDTreeMinimalMenu = 1		" use the minimal menue (m)
let NERDTreeWinPos = "left" 	" Panel opens on the left side
let NERDTreeWinSize = 31		" Set the panel width to 31 columns

" Toggle NERDTree with F2
nmap <F2> :NERDTreeToggle<CR>

" Tagbar settings

let g:tagbar_autofocus = 1					" Focus the paanel when opening it
let g:tagbar_autoshowtag = 1				" Highlight the active tag
let g:tagbar_position = 'botright vertical'	" Make panel appear vertically on the right side

" Toggle tagbar panel with F8
nmap <F8> :TagbarToggle<CR>

" CtrlSF Settings

let g:ctrlsf_backend = 'ack'							" Use the ack tool as the backend
let g:ctrlsf_auto_close = { "normal":0, "compact":0 }	" Auto close the results panel when opening a file
let g:ctrlsf_auto_focus = { "at":"start" }				" Immediately switch focus to the search window
let g:ctrlsf_auto_preview = 0							" Don't open the preview window automatically
let g:ctrlsf_case_sensitive = 'smart'					" Use the smart case sensitivity search scheme
let g:ctrlsf_default_view = 'normal'					" Normal mode, not compact mode
let g:ctrlsf_regex_pattern = 0							" Use absoulte search by default
let g:ctrlsf_position = 'right'							" Position of the search window
let g:ctrlsf_winsize = '46'								" Width or height of search window
let g:ctrlsf_default_root = 'cwd'						" Search from the current working directory

" (Ctrl+F) Open search prompt (Normal Mode)
nmap <C-F>f <Plug>CtrlSFPrompt

" (Ctrl-F + f) Open search prompt with selection (Visual Mode)
xmap <C-F>f <Plug>CtrlSFVwordPath

" (Ctrl-F + F) Perform search with selection (Visual Mode)
xmap <C-F>F <Plug>CtrlSFVwordExec

" (Ctrl-F + n) Open search prompt with current word (Normal Mode)
nmap <C-F>n <Plug>CtrlSFCwordPath

" (Ctrl-F + o )Open CtrlSF window (Normal Mode)
nnoremap <C-F>o :CtrlSFOpen<CR>

" (Ctrl-F + t) Toggle CtrlSF window (Normal Mode)
nnoremap <C-F>t :CtrlSFToggle<CR>

" (Ctrl-F + t) Toggle CtrlSF window (Insert Mode)
inoremap <C-F>t <Esc>:CtrlSFToggle<CR>

" FSwitch setting

" When the loaded buffer is a .cpp file, the companion file is of type hpp or h
au! BufEnter *.cpp let b:fswitchdst = 'hpp,h'

" When the loaded buffer is a .h file, the companion file is of tipe cpp or c
au! BufEnter *.h let b:fswitchdst = 'cpp,c'These lines specify that:

" Use (Ctrl+Z) to open acompanying file in a vertical window
nmap <C-Z> :vsplit <bar> :wincmd l <bar> :FSRight<CR>

" Protodef settings

" Pull in prototypes
nmap <buffer> <silent> <leader> ,PP

" Pull in prototypes without namespace definition"
nmap <buffer> <silent> <leader> ,PN

" YCM settings

" Mapping to close the completion menu (default <C-y>)
let g:ycm_key_list_stop_completion = ['<C-x>']

" Set filetypes where YCM will be turned on
let g:ycm_filetype_whitelist = { 'cpp':1, 'h':2, 'hpp':3, 'c':4, 'cxx':5 }

" Close preview window after completing the insertion
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_autoclose_preview_window_after_completion = 1

let g:ycm_confirm_extra_conf = 0                 " Don't confirm python conf
let g:ycm_always_populate_location_list = 1      " Always populae diagnostics list
let g:ycm_enable_diagnostic_signs = 1            " Enable line highligting diagnostics
let g:ycm_open_loclist_on_ycm_diags = 1          " Open location list to view diagnostics

let g:ycm_max_num_candidates = 20                " Max number of completion suggestions
let g:ycm_max_num_identifier_candidates = 10     " Max number of identifier-based suggestions
let g:ycm_auto_trigger = 1                       " Enable completion menu
let g:ycm_show_diagnostic_ui = 1                 " Show diagnostic display features
let g:ycm_error_symbol = '>>'                    " The error symbol in Vim gutter
let g:ycm_enable_diagnostic_signs = 1            " Display icons in Vim's gutter, error, warnings
let g:ycm_enable_diagnostic_highlighting = 1     " Highlight regions of diagnostic text
let g:ycm_echo_current_diagnostic = 1            " Echo line's diagnostic that cursor is on

" Airline settings
let g:airline#extensions#tabline#enabled = 1	" Auto displays buffers when theres only 1 tab

let g:airline_skip_empty_sections = 1			" Hides empty sections

let g:airline_theme='minimalist'

if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif


" powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.dirty='⚡'


" Vim-Dispatch settings

" Open vim-dispatch window and scroll to bottom
nnoremap    <C-m>m    :Copen<CR> <bar> G

" Build debug and release targets
nnoremap    <C-m>bd   :Dispatch! make -C build/Debug<CR>
nnoremap    <C-m>br   :Dispatch! make -C build/Release<CR>

" Map <F6> to the Debug executable with passed filename
function SetBinaryDebug(filename)
    let bpath = getcwd() . "/bin/Debug/" . a:filename
    execute "nnoremap <F6> :Dispatch "
            \ bpath
            \ . " <CR> <bar> :Copen<CR>"
    echo "<F6> will run: " . bpath
endfunction

" Map <F7> to the Release executable with passed filename
function SetBinaryRelease(filename)
    let bpath = getcwd() . "/bin/Release/" . a:filename
    execute "nnoremap <F7> :Dispatch "
                \ bpath
                \ . "<CR> <bar> :Copen<CR>"
    echo "<F7> will run: " . bpath
endfunction


