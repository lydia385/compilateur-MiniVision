cls
del lex.yy.c
flex new-lexical.l
bison -d syn.y
gcc lex.yy.c syn.tab.c  -o pp.exe
pp.exe .\code.txt


