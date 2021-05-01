set nu
set shiftwidth=4
set tabstop=4
set noexpandtab
set backspace=2
set signcolumn=yes
set laststatus=2
set noshowmode
set cursorline

call plug#begin('~/.vim/plugged')
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings' 
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
"The following plugin requires a vim with lua installed
"you might need to compile github.com/vim/vim.git
"For instruction read the bottom of this page.
Plug 'jeaye/color_coded'
Plug 'tmsvg/pear-tree'
 "Plug 'morhetz/gruvbox'
Plug 'rhysd/vim-clang-format'
Plug 'itchyny/lightline.vim'

call plug#end()

"let g:lsp_settings = {
"\  'clangd': {'cmd': ['clangd-6.0']},
"\  'efm-langserver': {'disabled': v:false}
"\}

if executable('clangd')
    augroup lsp_clangd
        autocmd!
        autocmd User lsp_setup call lsp#register_server({
                    \ 'name': 'clangd',
                    \ 'cmd': {server_info->['clangd']},
                    \ 'whitelist': ['c', 'cpp', 'objc', 'objcpp'],
                    \ })
        autocmd FileType c setlocal omnifunc=lsp#complete
        autocmd FileType cpp setlocal omnifunc=lsp#complete
        autocmd FileType objc setlocal omnifunc=lsp#complete
        autocmd FileType objcpp setlocal omnifunc=lsp#complete
    augroup end
endif

let g:color_coded_enabled = 1
let g:clang_format#style_options = {
			\"BasedOnStyle": 'Mozilla',
			\"AccessModifierOffset": '-4',
			\"AlignAfterOpenBracket": 'Align',
			\"AlignConsecutiveAssignments": 'true',
			\"AlignConsecutiveDeclarations": 'true',
			\"AlignEscapedNewlinesLeft": 'false',
			\"AlignOperands": 'true',
			\"BreakBeforeBraces": 'Allman',
			\"BreakConstructorInitializersBeforeComma": 'true',
			\"BreakStringLiterals": 'false',
			\"ColumnLimit": '100',
			\"ConstructorInitializerAllOnOneLineOrOnePerLine": 'false',
			\"ConstructorInitializerIndentWidth": '0',
			\"ContinuationIndentWidth": '4',
			\"Cpp11BracedListStyle": 'false',
			\"DerivePointerAlignment": 'false',
			\"DisableFormat": 'false',
			\"ExperimentalAutoDetectBinPacking": 'true',
			\"IndentCaseLabels": 'true',
			\"IndentWidth": '4',
			\"IndentWrappedFunctionNames": 'false',
			\"JavaScriptQuotes": 'Single',
			\"KeepEmptyLinesAtTheStartOfBlocks": 'false',
			\"Language": 'Cpp',
			\"MaxEmptyLinesToKeep": '2',
			\"NamespaceIndentation": 'None',
			\"ObjCBlockIndentWidth": '4',
			\"ObjCSpaceAfterProperty": 'false',
			\"ObjCSpaceBeforeProtocolList": 'false',
			\"PointerAlignment": 'Left',
			\"ReflowComments": 'true',
			\"SortIncludes": 'false',
			\"SpaceAfterCStyleCast": 'true',
			\"SpaceBeforeAssignmentOperators": 'true',
			\"SpaceBeforeParens": 'ControlStatements',
			\"SpaceInEmptyParentheses": 'false',
			\"SpacesBeforeTrailingComments": '2',
			\"SpacesInAngles": 'false',
			\"SpacesInCStyleCastParentheses": 'false',
			\"SpacesInContainerLiterals": 'false',
			\"SpacesInParentheses": 'false',
			\"SpacesInSquareBrackets": 'false',
			\"Standard": 'Cpp11',
			\"TabWidth": '4',
			\"UseTab": 'Always'}

let g:clang_format#auto_format_on_insert_leave = 1
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240

"#flags used to compile vim
"# ./configure --with-features=huge --enable-cscope --enable-python3interp=yes --with-python3-command=python3.8 --with-python3-config-dir=/usr/lib/python3.8/config-3.8-x86_64-linux-gnu --enable-multibyte --enable-fontset --enable-luainterp=yes --with-lua-prefix=/usr/include/lua5.3 --enable-gui=gtk3 --enable-fail-if-missing

"#and a hack needed to compile with lua
"#https://gist.github.com/tehmachine/962639982bed614f1965d0fe405ae5f5
