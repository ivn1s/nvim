if exists("current_compiler")
    finish
endif
let current_compiler = "tex"

if exists(":CompilerSet") != 2
    command -nargs=* CompilerSet setlocal <args>
endif

CompilerSet makeprg=tmux\ send-keys\ pdflatex\ '\ '\ %\ Enter\ Enter\ Enter\ Enter\ Enter\ Enter\ Enter\ Enter\ Enter\ Enter\ Enter\ Enter
CompilerSet errorformat=%f:\ line\ %l:\ %m,
		       \%-G%.%#

