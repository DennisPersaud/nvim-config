" Compile and execute C
func C()
    exec "!cls && gcc % && a.exe"
endfunc
map <silent> <C-b> :call C()<CR>

" Compile and execute CPP
func CPP()
    exec "!cls && g++ % && a.exe"
endfunc
map <silent> <C-b> :call CPP()<CR>

" Compile & execute Rust
func RUST()
    exec "!cls && rustc % && %:r.exe"
endfunc
map <silent> <C-b> :call RUST()<CR>

" Interpret Python
func PYTHON()
    exec "!cls && python %"
endfunc
map <silent> <C-b> :call PYTHON()<CR>

" Compile Java
func JAVA()
    exec "!cls && javac % && java %"
endfunc
map <silent> <C-b> :call JAVA()<CR>

" Compile Kotlin
func KOTLIN()
    exec "!cls && kotlinc % -include-runtime -d %:r.jar && java -jar %:r.jar"
endfunc
map <silent> <C-b> :call KOTLIN()<CR>

" Interpret JavaScript
func JAVASCRIPT()
    exec "!cls && node %"
endfunc
map <silent> <C-b> :call JAVASCRIPT()<CR>

" Interpret TypeScript
func TYPESCRIPT()
    exec "!cls && tsc % && node %:r.js"
endfunc
map <silent> <C-b> :call TYPESCRIPT()<CR>

" Interpret PHP
func PHP()
    exec "!cls && php %"
endfunc
map <silent> <C-b> :call PHP()<CR>

" Run Ruby
func RUBY()
	exec "!cls && ruby %"
endfunc
map <silent> <C-b> :call RUBY()<CR>

" Build Go
func GOLANG()
	exec "!cls && go build % && %:r.exe"
endfunc
map <silent> <C-b> :call GOLANG()<CR>

" Compile Haskell
func HASKELL()
	exec "!cls && ghc % && % && %:r.exe"
endfunc
map <silent> <C-b> :call HASKELL()<CR>

" Run Perl
func PERL()
	exec "!cls && perl %"
endfunc
map <silent> <C-b> :call PERL()<CR>

" Run Bash
func BASH()
	exec "!cls && bash %"
endfunc
map <silent> <C-b> :call BASH()<CR>

" Run Powershell
func POWERSHELL()
	exec "!cls && %"
endfunc
map <silent> <C-b> :call POWERSHELL()<CR>


autocmd Filetype c map <C-b> :call C()<CR>
autocmd Filetype cpp map <C-b> :call CPP()<CR>
autocmd Filetype rust map <C-b> :call RUST()<CR>
autocmd Filetype python map <C-b> :call PYTHON()<CR>
autocmd Filetype java map <C-b> :call JAVA()<CR>
autocmd Filetype kotlin map <C-b> :call KOTLIN()<CR>
autocmd Filetype javascript map <C-b> :call JAVASCRIPT()<CR>
autocmd Filetype typescript map <C-b> :call TYPESCRIPT()<CR>
autocmd Filetype php map <C-b> :call PHP()<CR>
autocmd Filetype ruby map <C-b> :call RUBY()<CR>
autocmd Filetype go map <C-b> :call GOLANG()<CR>
autocmd Filetype haskell map <C-b> :call HASKELL()<CR>
autocmd Filetype bash map <C-b> :call BASH()<CR>
autocmd Filetype perl map <C-b> :call PERL()<CR>
autocmd Filetype powershell map <C-b> :call POWERSHELL()<CR>

