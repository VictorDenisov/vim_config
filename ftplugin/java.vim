set path=**/*

set ts=4
set sw=4
set et
abbrev sysout System.out.println

"set foldmethod=expr
"set foldexpr=JavaFoldLevel(v:lnum)

function! JavaFoldLevel(lineNumber)
	if a:lineNumber > 1
		echo "Inside > 1"
		if foldlevel(a:lineNumber - 1) == 0
			echo "Inside == 0"
			if getline(a:lineNumber)=~"^.*(.*)\\s*{\\s*$"
				echo "Inside match"
				return 1
			endif
			return 0
		else
			echo "Inside == 1"
			if getline(a:lineNumber)=~"^\\s*}\\s*$"
				return 0
			else
				return 1
			endif
		endif
	endif
	"if getline(a:lineNumber) =~ "^\\s*import.*"
		"return 1
	"endif
	return 0
endfunction

nmap <leader>f :find <cword>.java<cr>
