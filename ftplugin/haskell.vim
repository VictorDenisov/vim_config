set et
set ai
set ts=4
set sw=4

set include=^import\\s*\\(qualified\\)\\?\\s*
set includeexpr=substitute(v:fname,'\\.','/','g').'.'
set suffixesadd=hs,lhs,hsc

set makeprg=cabal\ build
