syntax on
filetype plugin indent on
autocmd Syntax * syn keyword Todo TODO todo TBD tbd Tbd FIXME fixme Fixme containedin=.*Comment.*

set nu 
set cursorline
set cursorcolumn
set showmatch

set hls
autocmd ColorScheme * highlight Search guifg=#282828 guibg=#fe8019 gui=BOLD
highlight Search guifg=#282828 guibg=#fe8019 gui=BOLD
nnoremap <silent> <Esc> :noh<CR>

set tabstop=4 
set shiftwidth=4 
set autoindent  

set paste  

set guioptions-=T

set incsearch

colorscheme desert

set guifont=Monospace\ 14

if has("gui_running") && has("unix")
    set lines=999 columns=999
endif

set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936 
set termencoding=utf-8
set encoding=utf-8 

"set H replace *
nnoremap <S-H> *

" ===== 搜索高亮计数 =====
" 在状态栏显示当前匹配位置和总数，如 [3/10]
set laststatus=2
let g:search_count_prefix = '['
let g:search_count_suffix = ']'

function! SearchCount() abort
    if !v:hlsearch || empty(@/)
        return ''
    endif
    let l:pos = getpos('.')
    let l:count = 0
    let l:current = 0
    " 从文件头开始统计总数
    keepjumps g/\c\=@/let l:count += 1
    " 计算当前位置是第几个匹配
    if l:count > 0
        let l:save_pos = getpos('.')
        call cursor(1, 1)
        let l:current = 1
        let l:found = search(@/, 'cW')
        while l:found && getpos('.') != l:save_pos && l:current < l:count
            let l:current += 1
            let l:found = search(@/, 'W')
        endwhile
        call cursor(l:save_pos[1], l:save_pos[2])
    endif
    return g:search_count_prefix . l:current . '/' . l:count . g:search_count_suffix
endfunction

" 高效版本：利用 Vim 内置 searchcount() (Vim 8.1+)
function! SearchCountFast() abort
    if !v:hlsearch || empty(@/)
        return ''
    endif
    try
        let l:result = searchcount(#{recompute: 1, maxcount: 0})
        if empty(l:result) || l:result.total == 0
            return ''
        endif
        return g:search_count_prefix . l:result.current . '/' . l:result.total . g:search_count_suffix
    catch
        " searchcount() 不可用时回退
        return ''
    endtry
endfunction

" 设置状态栏：文件名 + 搜索计数
set statusline=%f\ %h%w%q%=%(\ %{SearchCountFast()}%)\ %y\ %l:%v/%L

" ===== netrw NFS 优化 =====
let g:netrw_liststyle = 0        " 最简列表，减少 stat 调用
let g:netrw_fastbrowse = 2       " 快速浏览，不做缓存
let g:netrw_dirhistmax = 0       " 不记录目录历史
let g:netrw_sort_by = "name"     " 只按名字排序
