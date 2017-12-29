#!/bin/sh
rm -rf cscope.files cscope.out tags
#ctags -R --exclude=libs/*
ctags -R --exclude=libs/* --language-force=C --language-force=C++
find $PWD -type f \( -name '*.c' -o -name '*.cpp' -o -name '*.cc' -o -name '*.h' -o -name '*.s' -o -name '*.S' -o -name '*.hpp' \) -print | awk '{print "\""$0"\""}' > cscope.files
cscope -i cscope.files
