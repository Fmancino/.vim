" Compiler for cmake, set of instructions to compile project using cmake

if exists("current_compiler")
  finish
endif
let current_compiler = "cmake"

if exists(":CompilerSet") != 2
    command -nargs=* CompilerSet setlocal <args>
endif
CompilerSet errorformat&      " use the default 'errorformat'
CompilerSet makeprg=~/.vim/vimbin/b-cmake
