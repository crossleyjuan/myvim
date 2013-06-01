" All system-wide defaults are set in $VIMRUNTIME/debian.vim (usually just
" /usr/share/vim/vimcurrent/debian.vim) and sourced by the call to :runtime
" you can find below.  If you wish to change any of those settings, you should
" do it in this file (/etc/vim/vimrc), since debian.vim will be overwritten
" everytime an upgrade of the vim packages is performed.  It is recommended to
" make changes after sourcing debian.vim since it alters the value of the
" 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
if has("syntax")
  syntax on
endif

set tabstop=3
set shiftwidth=3
set number
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'
" My Bundles here:
" original repos on github
Bundle 'tpope/vim-fugitive'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
Bundle 'tpope/vim-rails.git'
" vim-scripts repos
Bundle 'L9'
Bundle 'FuzzyFinder'
" non github repos
Bundle 'git://git.wincent.com/command-t.git'
" ...
Bundle 'taglist.vim'
Bundle 'DoxygenToolkit.vim'
Bundle 'a.vim'
"Bundle 'doxygen-support.vim'

filetype plugin indent on     " required!


" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
	au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
if has("autocmd")
	filetype plugin indent on
endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
set showcmd		" Show (partial) command in status line.
set showmatch		" Show matching brackets.
set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching
set incsearch		" Incremental search
set autowrite		" Automatically save before commands like :next and :make
"set hidden             " Hide buffers when they are abandoned
"set mouse=a		" Enable mouse usage (all modes)

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
	source /etc/vim/vimrc.local
endif

set tabpagemax=16
" Mapping keys
"
map <F7> :tabp <CR>
map <F8> :tabn <CR>

function! s:insert_gates()
	let gatename = substitute(toupper(expand("%:t")), "\\.", "_INCLUDED_", "g")
	execute "normal! i#ifndef " . gatename 
	execute "normal! o#define " . gatename . " "
	execute "normal! Go#endif /* " . gatename . " */"
	normal! kk
endfunction
autocmd BufNewFile *.{h,hpp} call <SID>insert_gates()

set tags+=/usr/include/tags


"let g:DoxygenToolkit_authorName = "Juan Pablo Crossley (cross), crossleyjuan@gmail.com"

"let g:DoxygenToolkit_licenseTag = "// =====================================================================================\<enter>"
"let g:DoxygenToolkit_licenseTag = g:DoxygenToolkit_licenseTag . "//\<enter>"
"let g:DoxygenToolkit_licenseTag = g:DoxygenToolkit_licenseTag . "//       Filename:  TXBUFFER.h\<enter>"
"let g:DoxygenToolkit_licenseTag = g:DoxygenToolkit_licenseTag . "//\<enter>"
"let g:DoxygenToolkit_licenseTag = g:DoxygenToolkit_licenseTag . "//    Description: This class work as a front controller and bridge for any controller\<enter>"
"let g:DoxygenToolkit_licenseTag = g:DoxygenToolkit_licenseTag . "//                 operation that needs a transaction \<enter>"
"let g:DoxygenToolkit_licenseTag = g:DoxygenToolkit_licenseTag . "//\<enter>"
"let g:DoxygenToolkit_licenseTag = g:DoxygenToolkit_licenseTag . "//        Version:  1.0\<enter>"
"let g:DoxygenToolkit_licenseTag = g:DoxygenToolkit_licenseTag . "//        Created:  09/26/2012 08:26:29 PM\<enter>"
"let g:DoxygenToolkit_licenseTag = g:DoxygenToolkit_licenseTag . "//       Revision:  none\<enter>"
"let g:DoxygenToolkit_licenseTag = g:DoxygenToolkit_licenseTag . "//       Compiler:  gcc\<enter>"
"let g:DoxygenToolkit_licenseTag = g:DoxygenToolkit_licenseTag . "//\<enter>"
"let g:DoxygenToolkit_licenseTag = g:DoxygenToolkit_licenseTag . "//         @author:  \<author>\<enter>"
"let g:DoxygenToolkit_licenseTag = g:DoxygenToolkit_licenseTag . "//   Organization:  djondb\<enter>"
"let g:DoxygenToolkit_licenseTag = g:DoxygenToolkit_licenseTag . "//\<enter>"
"let g:DoxygenToolkit_licenseTag = g:DoxygenToolkit_licenseTag . "// This file is part of the djondb project, for license information please refer to the LICENSE file,\<enter>"
"let g:DoxygenToolkit_licenseTag = g:DoxygenToolkit_licenseTag . "// the application and libraries are provided as-is and free of use under the terms explained in the file LICENSE\<enter>"
"let g:DoxygenToolkit_licenseTag = g:DoxygenToolkit_licenseTag . "// Its authors create this application in order to make the world a better place to live, but you should use it on\<enter>"
"let g:DoxygenToolkit_licenseTag = g:DoxygenToolkit_licenseTag . "// your own risks.\<enter>"
"let g:DoxygenToolkit_licenseTag = g:DoxygenToolkit_licenseTag . "// \<enter>"
"let g:DoxygenToolkit_licenseTag = g:DoxygenToolkit_licenseTag . "// Also, be adviced that, the GPL license force the committers to ensure this application will be free of use, thus\<enter>"
"let g:DoxygenToolkit_licenseTag = g:DoxygenToolkit_licenseTag . "// if you do any modification you will be required to provide it for free unless you use it for personal use (you may \<enter>"
"let g:DoxygenToolkit_licenseTag = g:DoxygenToolkit_licenseTag . "// charge yourself if you want), bare in mind that you will be required to provide a copy of the license terms that ensures\<enter>"
"let g:DoxygenToolkit_licenseTag = g:DoxygenToolkit_licenseTag . "// this program will be open sourced and all its derivated work will be too.\<enter>"
"let g:DoxygenToolkit_licenseTag = g:DoxygenToolkit_licenseTag . "// =====================================================================================\<enter>"
